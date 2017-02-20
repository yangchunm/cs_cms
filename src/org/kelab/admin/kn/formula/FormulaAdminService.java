package org.kelab.admin.kn.formula;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.kelab.admin.kn.tag.TagAdminService;
import org.kelab.admin.kn.tree.TreeAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.bean.Latex;
import org.kelab.model.KnFormula;
import org.kelab.model.KnLang;
import org.kelab.util.Base64Utils;
import org.kelab.util.CmdUtils;
import org.kelab.util.StringUtils;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

import net.sf.jnati.FileUtils;

public class FormulaAdminService {
	public static final FormulaAdminService me = new FormulaAdminService();
	public static TreeAdminService treeSrv = new TreeAdminService();
	public static TagAdminService tagSrv = new TagAdminService();
	final static KnFormula dao = new KnFormula().dao();
	final String cacheName = "knFormula";
	Prop p = PropKit.use("config.properties");
	
	/**
	 * 加载
	 * @param 
	 * @return 则返回所有
	 */
	public Page<KnFormula> findAllForm(CommQuery comQ){
		String strSele = "select knfo.*,kntr.kntr_name as kntrName,keus.user_real_name as userRealName,"
				+ "keus.user_name as userName";
		String strFrom = "from kn_formula knfo, kn_tree kntr, ke_user keus";
		String strWhere = " where keus.id = knfo.knfo_user_id and knfo.knfo_kntr_id = kntr.id";
		if(comQ.getKeyWord() != null && comQ.getKeyWord() != "")
			strWhere = strWhere + " and (knfo.knfo_name like '%"+comQ.getKeyWord()+"%' "
					+ " or knfo.knfo_tag like '%"+comQ.getKeyWord()+"%' "
					+ " or kntr.kntr_name like '%"+comQ.getKeyWord()+"%')";
		if(comQ.getOther() != null && comQ.getOther() != "")
			strWhere = strWhere + " and (keus.user_real_name like '%"+comQ.getOther()+"%' "
					+ "or keus.user_name like '%"+comQ.getOther()+"%') ";
		if(comQ.getStart() != null && comQ.getEnd() != null)
			strWhere = strWhere + " and knfo.knfo_time between '"+comQ.getStart()+"' and '"+comQ.getEnd()+"'";
		Page<KnFormula> formP = dao.paginate(comQ.getPage(), comQ.getPageSize(), strSele, strFrom
				+  strWhere+" order by knfo.id desc");
		return formP;
	}
	
	/**
	 * 保存信息
	 * @param KnFormula对象
	 * @return 结果信息
	 */
	public Ret save(KnFormula knForm){
		int currId = 0;
		if(knForm.getId() != null && knForm.getId() > 0)
			currId = knForm.getId();
		if (isExists(knForm,currId)) {
			return Ret.fail("msg", "该名称已经存在");
		}
		//获取公式Latex文本
		List<Latex> latexL = StringUtils.extrLatex(knForm.getKnfoText());
		Latex latex = new Latex();
		if(latexL.size()>1){
			return Ret.fail("msg","只能添加一个公式！");
		}else if(latexL.size() > 0)
			latex = latexL.get(0);
		
		knForm.setKnfoLatex(latex.getLatexCode());
		//转为png
		String filename = knForm.getKnfoPng();
		if(filename == null || filename == "")
			filename = System.currentTimeMillis()+".png";
		String filePath = PathKit.getWebRootPath()+"/"+p.get("baseUploadPath")+p.get("knFormPath")+filename;
		Base64Utils.GenerateImage(latex.getBase64Code(), filePath);
		knForm.setKnfoPng(filename);
		knForm.setKnfoText(latex.getImgHtml());
		knForm.setKnfoTag(knForm.getKnfoTag().replace("，", ",").replace(" ",","));
		if(currId == 0){	//新增
			knForm.save();
			currId = findLastOne().getId();
			tagSrv.saveMutil(knForm.getKnfoTag());
		}else{	//修改
			knForm.update();
			tagSrv.saveMutil(knForm.getKnfoTag());
		}
		FormulaAdminService.me.clearCache();    // 清缓存
		return Ret.ok("currId",currId);
	}
	
	
	/**
	 * 检查是否存在
	 * @param KnFormula
	 * @param oldId，旧的ID，如果为0，则为新增，否则检查除自己以外的是否有重复
	 * @return 是否存在重复名称
	 */
	private boolean isExists(KnFormula knForm, int oldId) {
		String strWhere = "";
		if(oldId > 0)
			strWhere = " and id <>" + oldId;
		String sql = "select id from kn_formula where knfo_name=? "+strWhere+" limit 1";
		return Db.queryInt(sql , knForm.getKnfoName()) != null;
	}
	
	public KnFormula findLastOne(){
		String sql = "select * from kn_formula order by id desc limit 1";
		List<KnFormula> fL = dao.find(sql);
		if(fL.size()>0)
			return fL.get(0);
		else
			return null;
	}
	
	/**
	 * 删除指定id的信息
	 * @param id
	 * @return 删除结果
	 */
	public Ret delete(String ids){
		int rt = 0;
    	String msg = "";
    	for(String obj :ids.split(",")){
    		int id = Integer.parseInt(obj);
    		String checkSql = "select * from kn_entr_form where form_id = ?";
	    	if(id > 0 && Db.find(checkSql,id).size() == 0){	    		
	    		Db.update("delete from kn_formula where id=?",id);
	    		rt=1;
	    	}else{
	    		rt = 0;
	    		msg = "部分记录关联数据，不能删除！";
	    	}
    	}
		if(rt == 1)
			return Ret.ok();
		else
			return Ret.fail("msg", msg);
	}
	
	/**
	 * 根据选择的知识点和填入的标签，自动匹配相关的公式
	 * @param knTreeId
	 * @param enTags
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Page<KnFormula> findFileByWords(int knTreeId, String enTags,int page, int pageSize){
		String strSele = "select knfo.*";
		String strFrom = "from kn_formula knfo, kn_tree kntr";
		String strWhere = " where knfo.knfo_kntr_id = kntr.id";
		if(knTreeId > 0)
			strWhere = strWhere + " and kntr.id ="+knTreeId;
		if(enTags != null && enTags != ""){
			String[] arrTags = StringUtils.splitTags(enTags);
			strWhere += " and ( ";
			int i = 1;
			for(String tag: arrTags){
				strWhere += "knfo.knfo_tag like '%"+tag+"%' or knfo.knfo_name like '%"+tag+"%'";
				if(arrTags.length > 1 && i < (arrTags.length))
					strWhere += " or ";
				i++;
			}
			strWhere += " )";
		}
		Page<KnFormula> fileP = dao.paginate(page, pageSize, strSele, strFrom
				+  strWhere+" order by knfo.id desc");
		return fileP;
	}
	
	@SuppressWarnings("unchecked")
	public Ret runFormProg(int formId) throws IOException{
		Ret ret = new Ret();
		KnFormula form = dao.findById(formId);
		List<KnLang> lang = KnLang.dao.find("select * from kn_lang where ext = ? limit 1",form.getKnfoLang());
		String cmdPath = "";
		String cmdArgu = "";
		if(lang.size()>0){
			cmdPath = lang.get(0).getCmd();
			cmdArgu = lang.get(0).getArgu();
		}else{
			return Ret.fail("msg","没有找到相关的语言配置");
		}
		
		//生成原始文件
		String filename = System.currentTimeMillis()+form.getKnfoLang();
		String srcDir = PathKit.getWebRootPath()+"/tmp/";
		File file = new File(srcDir+filename);
		FileUtils.writeString(file, form.getKnfoCode());
		//执行
		long begin = System.currentTimeMillis();		
		ret = CmdUtils.executeCmd(cmdPath, srcDir, filename, cmdArgu, "");
		long end = System.currentTimeMillis();
		ret.put("timeUser", end - begin);
		return ret;
	}
	
	public void clearCache() {
		CacheKit.removeAll(cacheName);
	}
}

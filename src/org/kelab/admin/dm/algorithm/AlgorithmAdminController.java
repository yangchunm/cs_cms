package org.kelab.admin.dm.algorithm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.kelab.admin.dm.algocate.AlgoCateAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.model.DmAlgoArgument;
import org.kelab.model.DmAlgorithm;
import org.kelab.common.controller.BaseController;

import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class AlgorithmAdminController extends BaseController{
	static AlgoCateAdminService cateSrv = AlgoCateAdminService.me;
	static AlgorithmAdminService srv = AlgorithmAdminService.me;
	
	public void index() {
		DmAlgorithm sAlgo = getModel(DmAlgorithm.class,"s");
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("sAlgo",sAlgo);
		setAttr("comQ",comQ);
		setAttr("dmALgoP",srv.findAllAlgo(comQ,sAlgo));
		setAttr("dmAlgoCateL",cateSrv.findAllCate());
		render("index.html");
	}
	
	public void save() throws IOException{
		Ret ret = new Ret();
		Prop p = PropKit.use("config.properties");
		UploadFile uf = null;
		try {
			uf = getFile("al.dmal_cmd_path",p.get("dmAlgoPath"));
			if (uf == null) {
				renderJson(Ret.fail("msg", "请先选择上传文件"));
				return;
			}
			if(!uf.getFileName().contains(".jar")){
				uf.getFile().delete();
				renderJson(Ret.fail("msg", "只能上传Java的jar或class文件！"));
				return;
			}
		} catch (Exception e) {
			if (e instanceof com.oreilly.servlet.multipart.ExceededSizeException) {
				renderJson(Ret.fail("msg", "文件大小超出范围"));
			} else {
				if (uf != null) {
					uf.getFile().delete();
				}
				renderJson(Ret.fail("msg", e.getMessage()));
			}
			return ;
		}
		DmAlgorithm algo = getModel(DmAlgorithm.class,"al");
		algo.setDmalTime(new Date());
		algo.setDmalUserId(getLoginUserId());
		algo.setDmalCmdPath(uf.getFileName());
		List<DmAlgoArgument> algoArgL = new ArrayList<DmAlgoArgument>();
		String[] dmaaArgu = getParaValues("dmaa_argu");
		String[] dmaaNameEn = getParaValues("dmaa_name_en");
		String[] dmaaNameZh = getParaValues("dmaa_name_zh");
		String[] dmaaDesc = getParaValues("dmaa_desc");
		String[] dmaaValue = getParaValues("dmaa_value");
		if(dmaaArgu != null && dmaaArgu.length > 0){
			for(int i=0;i<dmaaArgu.length;i++){
				DmAlgoArgument arg = new DmAlgoArgument();
				arg.setDmaaArgu(dmaaArgu[i]);
				arg.setDmaaNameEn(dmaaNameEn[i]);
				arg.setDmaaNameZh(dmaaNameZh[i]);
				arg.setDmaaDesc(dmaaDesc[i]);
				arg.setDmaaValue(dmaaValue[i]);
				algoArgL.add(i, arg);
			}
		}
		ret = srv.save(algo,algoArgL);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getAlgoById(){
		int id = getParaToInt(0);
		renderJson(srv.findOneById(id));
	}
	
	public void revStatus(){
		int algoId = getParaToInt("algoId");
		boolean isEnable = getParaToBoolean("isEnable");
		DmAlgorithm.dao.findById(algoId).set("dmal_status", !isEnable).update();
		renderJson(Ret.ok());
	}
}

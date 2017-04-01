package org.kelab.admin.em.gene;
import java.io.File;
import java.util.Date;
import java.util.List;

import org.kelab.admin.em.attr.AttrAdminService;
import org.kelab.admin.em.cate.CateAdminService;
import org.kelab.bean.CommQuery;
import org.kelab.common.controller.BaseController;
import org.kelab.model.EmAttr;
import org.kelab.model.EmGene;
import org.kelab.model.EmGeneAttr;
import org.kelab.model.KeSecurity;
import org.kelab.util.FileUtils;

import com.jfinal.aop.Before;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class GeneAdminController  extends BaseController{
	static GeneAdminService srv = GeneAdminService.me;
	static CateAdminService cateSrv = CateAdminService.me;
	static AttrAdminService attrSrv = AttrAdminService.me;
	
	public void index() {
		CommQuery comQ = getBean(CommQuery.class,"comm");
		if(comQ.getPage() == 0)
			comQ.setPage(1);
		if(comQ.getPageSize() == 0)
			comQ.setPageSize(10);
		setAttr("comQ",comQ);
		setAttr("emGeneP",srv.findAllGene(comQ));
		render("index.html");
	}
	
	public void add(){
		setAttr("emCateL",cateSrv.findAllEmCate(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		setAttr("emAttrL",attrSrv.findAllAttrValue(0,0));
		render("edit.html");
	}
	public void edit(){
		int geneId = getParaToInt(0,0);
		setAttr("emCateL",cateSrv.findAllEmCate(0));
		setAttr("keSecuL",KeSecurity.dao.findAll());
		List<EmAttr> emAttrL = attrSrv.findAllAttrValue(0,geneId);
		if(emAttrL.size() == 0)
			emAttrL = attrSrv.findAllAttrValue(0,0);
		setAttr("emAttrL",emAttrL);
		setAttr("emGene",srv.findOneById(geneId));
		render("edit.html");
	}
	
	@Before(GeneAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		EmGene gene = getModel(EmGene.class,"em");
		String[] emCateIds = getParaValues("emcateId");
		gene.setEmgeUserId(getLoginUserId());
		gene.setEmgeCreateTime(new Date());
		gene.setEmgeUpdateTime(new Date());
		ret = srv.save(gene,emCateIds);
		renderJson(ret);
	}
	
	public void saveAttr(){
		Ret ret = new Ret();
		EmGeneAttr emga = getModel(EmGeneAttr.class,"");
		ret = srv.SaveGeneAttr(emga);
		renderJson(ret);
	}
	
	public void saveAttrFile(){
		Ret ret = new Ret();
		EmGeneAttr emga = new EmGeneAttr();
		String filestr = System.currentTimeMillis()+"";
		
		UploadFile uf = null;
		try {
			uf = getFile("attr.file",PropKit.get("emGenePath"));
			emga = getModel(EmGeneAttr.class,"geat");
			int attrType = getParaToInt("attr.type",4);
			if (attrType == 3 && uf == null) {
				renderJson(Ret.fail("msg", "请先选择上传文件"));
				return;
			}
			if(attrType == 3 && uf != null){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				emga.setEmgaValue(filestr);
			}
			if (attrType == 4 && uf != null) {
				uf.getFile().delete();
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
		if(emga.getId()==0)
			emga.save();
		else
			emga.update();
		ret = Ret.ok("emga",emga);
		renderJson(ret);
	}
	
	public void del(){
		String ids = getPara("ids");
		Ret ret = srv.delete(ids);
		renderJson(ret);
	}
	
	public void getAttrById(){
		int attrId = getParaToInt(0);
		EmAttr emattr = EmAttr.dao.findById(attrId);
		renderJson(emattr);
	}
	
	public void geneImport(){
		Ret ret = new Ret();
		String filestr = System.currentTimeMillis()+"";
		
		UploadFile uf = null;
		try {
			uf = getFile("gene.file","temp/");
			if (uf == null) {
				renderJson(Ret.fail("msg", "请先选择上传文件"));
				return;
			}
			if (uf != null && !FileUtils.getSuffix(uf.getFileName()).equals(".xls")) {
				uf.getFile().delete();
				renderJson(Ret.fail("msg", "只支持.xls文件"));
				return;
			}
			if(uf != null){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				
				ret = srv.geneImport(uf.getUploadPath()+filestr,getLoginUserId());
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
		renderJson(ret);
	}
	
	public void sampledown(){
		String fileStr = "/download/emgene-sample.xls";
		renderJson(FileUtils.fileDown(fileStr));
	}
	
	//设置状态
	public void setEmgeStatus(){
		int emgeId = getParaToInt("emgeId",0);
		int emgeStatus = getParaToInt("emgeStatus",0);
		EmGene.dao.findById(emgeId).set("emge_status", emgeStatus).update();
		renderJson(Ret.ok());
	}
	
}

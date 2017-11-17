package org.kelab.admin.cms.staff;

import java.io.File;
import java.util.Date;
import org.kelab.common.controller.BaseController;
import org.kelab.model.CmsStaff;
import org.kelab.util.FileUtils;
import org.kelab.util.ImageKit;
import com.jfinal.aop.Before;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;


public class StaffAdminController extends BaseController{
	static StaffAdminService srv = StaffAdminService.me;
	Prop p = PropKit.use("config.properties");
	
	public void index() {
		setAttr("cmsStaff",srv.findByUserId(getLoginUserId()));
		render("edit.html");
	}
	
	@Before(StaffAdminValidator.class)
	public void save(){
		Ret ret = new Ret();
		CmsStaff cmsStaf = new CmsStaff();
		String filestr = "/"+p.get("cmsImage")+"staf"+System.currentTimeMillis()+"";
		UploadFile uf = null;
		try {
			uf = getFile("tmp.stafpic",p.get("cmsImage"));
			cmsStaf = getModel(CmsStaff.class,"st");

			if(uf != null && !ImageKit.isImageExtName(uf.getFileName())){
				renderJson(Ret.fail("msg", "请先选择图片文件"));
				return;
			}
			if(uf != null && ImageKit.isImageExtName(uf.getFileName())){
				filestr =filestr + FileUtils.getSuffix(uf.getFileName());
				File f = new File(uf.getUploadPath()+filestr);
				uf.getFile().renameTo(f);
				cmsStaf.setStafPic(filestr);
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
		cmsStaf.setStafTime(new Date());
		cmsStaf.setStafUserId(getLoginUserId());
		if(cmsStaf.getId()>0 && cmsStaf.update())
			ret =Ret.ok();
		else{
			cmsStaf.save();
			ret = Ret.ok();
		}
		renderJson(ret);
	}
	
	
}

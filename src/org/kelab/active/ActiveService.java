package org.kelab.active;
import java.util.List;

import org.kelab.model.CmsStaff;
import org.kelab.model.KeOrgan;
import org.kelab.model.KeSecurity;
import org.kelab.model.KeUser;

public class ActiveService{
	
	public KeUser findUserByAvtive(KeUser user){
		String sql = "select * from ke_user where user_name = ? and user_real_name = ? and user_is_active = 0";
		List<KeUser> userL = KeUser.dao.find(sql,user.getUserName(),user.getUserRealName());
		if(userL.size()>0)
			return userL.get(0);
		else
			return null;
	}
	
	public List<KeSecurity> findStaffBySecu(){
		String sql = "select secu_name as sName,id as id from ke_security order by id asc";
		List<KeSecurity> staffL = KeSecurity.dao.find(sql);
		for(KeSecurity st : staffL){
			String sqls = "select ke_user.*,cms_staff.id as staffId from ke_user left join cms_staff on ke_user.id = cms_staff.staf_user_id "
					+ " where ke_user.user_security_id = ? "
					+ "order by ke_user.user_security_id asc,ke_user.user_pinyin asc" ;
			st.put("staffL",KeUser.dao.find(sqls,st.getId()));
		}
		return staffL;
	}
	
	public List<KeUser> findStaffByPinyin(){
		String sql = "select left(user_pinyin,1) as sName from ke_user GROUP BY sName order by sName ASC";
		List<KeUser> staffL = KeUser.dao.find(sql);
		for(KeUser st : staffL){
			String sqls = "select ke_user.*,cms_staff.id as staffId from ke_user left join cms_staff on ke_user.id = cms_staff.staf_user_id "
					+ " where left(ke_user.user_pinyin,1) = ? "
					+ "order by ke_user.user_pinyin asc" ;
			st.put("staffL",KeUser.dao.find(sqls,st.getStr("sName")));
		}
		return staffL;
	}
	
	public KeUser findUserByPinyin(String userPy){
		String sql = "select u.*,o.orga_name as orgaName from ke_user u,ke_organ o where user_pinyin = ?";
		List<KeUser> keuser = KeUser.dao.find(sql,userPy);
		if(keuser.size()>0){
			KeUser u = keuser.get(0);
			
			return u;
		}else
			return null;
		
	}
	
	public List<KeSecurity> findStaffByAdvisor(){
		String sql = "select secu_name as sName,id as id from ke_security order by id asc";
		List<KeSecurity> staffL = KeSecurity.dao.find(sql);
		for(KeSecurity st : staffL){
			String sqls = "select ke_user.*,cms_staff.id as staffId from ke_user left join cms_staff on ke_user.id = cms_staff.staf_user_id "
					+ " where ke_user.user_security_id = ? and cms_staff.staf_advisor like '%导师'"
					+ "order by ke_user.user_security_id asc,ke_user.user_pinyin asc" ;
			st.put("staffL",KeUser.dao.find(sqls,st.getId()));
		}
		return staffL;
	}
	
	public CmsStaff findStaffByUserId(int userId){
		String sql = "select * from cms_staff where staf_user_id =?";
		List<CmsStaff> stafL = CmsStaff.dao.find(sql,userId);
		if(stafL.size()>0){
			CmsStaff st = stafL.get(0);
			st.setStafPaper(st.getStafPaper().replace("\r\n", "<br/>"));
			st.setStafProject(st.getStafProject().replace("\r\n", "<br />"));
			st.setStafAward(st.getStafAward().replace("\r\n", "<br />"));
			st.setStafResume(st.getStafResume().replace("\r\n", "<br />"));
			return st;
		}
		else
			return null;
	}
}

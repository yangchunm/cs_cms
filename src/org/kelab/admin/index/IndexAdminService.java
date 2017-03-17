package org.kelab.admin.index;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;


import com.jfinal.plugin.activerecord.Db;

public class IndexAdminService {
	
	public static final IndexAdminService me = new IndexAdminService();

	/**
	 * 统计
	 * @param 
	 * @return 
	 */
	public Map<String,Long> siteStatics(){
		Map<String,Long> retS = new HashMap<String,Long>();
		//用户数
		Long userNum = Db.queryLong("select count(id) from ke_user");
		retS.put("userNum",userNum);
		//词条
		Long entrNum = Db.queryLong("select count(id) from kn_entry");
		retS.put("entrNum",entrNum);
		//知识点
		Long treeNum = Db.queryLong("select count(id) from kn_tree");
		retS.put("treeNum",treeNum);
		//公式
		Long formNum = Db.queryLong("select count(id) from kn_entr_form");
		retS.put("formNum",formNum);
		//公式
		Long moleNum = Db.queryLong("select count(id) from kn_entr_mole");
		retS.put("moleNum",moleNum);
		//文件
		Long fileNum = Db.queryLong("select count(id) from kn_entr_file");
		retS.put("fileNum",fileNum);
		//配方
		Long emgeNum = Db.queryLong("select count(id) from em_gene");
		retS.put("emgeNum",emgeNum);
		//配方属性
		Long egatNum = Db.queryLong("select count(id) from em_attr");
		retS.put("egatNum",egatNum);
		//挖掘算法
		Long dmalNum = Db.queryLong("select count(id) from dm_algorithm");
		retS.put("dmalNum",dmalNum);
		//使用次数
		Long dmalsubNum = Db.queryLong("select count(id) from dm_submit");
		retS.put("dmalsubNum",dmalsubNum);
		
		return retS;
	}
	
	/**
	 * 获取服务器状态
	 * 
	 * @author MrYang
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	public Map<String, Object> serverStatus() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		int kb = 1024 * 1024;
		// 可使用内存
		long totalMemory = Runtime.getRuntime().totalMemory() / kb;
		// 剩余内存
		long freeMemory = Runtime.getRuntime().freeMemory() / kb;
		// 最大可使用内存
		long maxMemory = Runtime.getRuntime().maxMemory() / kb;
		// 操作系统
		String osName = System.getProperty("os.name");
		// 用户当前目录
		String userHome = System.getProperty("user.home");
		// JDK版本
		String jkdVersion = System.getProperty("java.specification.version");
		// JDK路径
		String jkdPath = System.getProperty("java.home");
		// 当前程序主目录
		String appDir = System.getProperty("user.dir");
		// 操作系统类型
		String osType = System.getProperty("os.arch");
		// 操作系统内部版本号
		String osVersion = System.getProperty("os.version");
		// 服务器IP
		InetAddress myIPaddress = null;
		try {
			myIPaddress = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String serIPAddr = myIPaddress.getHostAddress();
		// 系统存储容量
		// String
		// appdir=ServletActionContext.getServletContext().getRealPath("/");
		map.put("result", "1");
		map.put("totalmemory", totalMemory);
		map.put("freememory", freeMemory);
		map.put("maxmemory", maxMemory);
		map.put("osname", osName);
		map.put("userhome", userHome);
		map.put("jdkversion", jkdVersion);
		map.put("jdkpath", jkdPath);
		// map.put("appdir", appdir);
		map.put("ostype", osType);
		map.put("osversion", osVersion);
		map.put("servipaddr", serIPAddr);
		return map;

	}
}

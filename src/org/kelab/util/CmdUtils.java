package org.kelab.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import com.jfinal.kit.Ret;

public class CmdUtils {
	
	/**
	 * 根据命令目录和参数调用，并返回执行结果
	 * @param cmdPath
	 * @param fileDir
	 * @param exeFile
	 * @param argu
	 * @param outFile
	 * @return
	 */
	public static Ret executeCmd(String cmdPath, String fileDir, String exeFile, String argu, String outFile){
		File dirFile = new File(fileDir);
		if (dirFile.isDirectory() == false) {
			return Ret.fail("msg","文件目录不存在！");
		}
		String okResult = "";
		String errorRet = "";
		try {
			StringBuilder cmd = new StringBuilder();
			cmd.append(cmdPath).append(" ").append(fileDir+exeFile).append(" ")
					.append(argu);
			Process process = Runtime.getRuntime().exec(cmd.toString());
			BufferedReader br = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			BufferedReader er = new BufferedReader(new InputStreamReader(
					process.getErrorStream()));
			String s = "";
			while ((s = br.readLine()) != null) {
				okResult += s;
			}
			br.close();
			while((s = er.readLine()) != null){
				errorRet += s;
			}
			er.close();
			if (process.waitFor() == 0) {// 0 表示线程正常终止。
				return Ret.ok("msg",okResult);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return Ret.fail("msg",errorRet);
	}
	
	public static void main(String[] args){
		String cmdPath ="java";
		String fileDir = "D:\\work\\exetest\\";
		String exeFile = "Test.class";
		System.out.println("begian ...");
		long began = System.currentTimeMillis();
		Ret ret = executeCmd(cmdPath,fileDir,exeFile,"","");
		long end = System.currentTimeMillis();
		System.out.println("execute end, and use time: "+(end - began)+" ms");
		System.out.println(ret.isOk());
		System.out.println(ret.getStr("msg"));
	}

}

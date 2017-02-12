package org.kelab.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import com.jfinal.kit.Ret;

public class CmdUtils {
	
	public static Ret executeCmd(String cmdPath, String fileDir, String exeFile, String argu, String outFile){
		File dirFile = new File(fileDir);
		if (dirFile.isDirectory() == false) {
			return Ret.fail("msg","文件目录不存在！");
		}
		String exeResult = "";
		try {
			StringBuilder cmd = new StringBuilder();
			cmd.append(cmdPath).append(" ").append(fileDir+exeFile).append(" ")
					.append(argu);
			System.out.println(cmd.toString());
			Process process = Runtime.getRuntime().exec(cmd.toString());
			BufferedReader br = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			String s = "";
			while ((s = br.readLine()) != null) {
				System.out.println(s);
				exeResult += s;
			}
			br.close();
			if (process.waitFor() == 0) {// 0 表示线程正常终止。
				return Ret.ok("msg",exeResult);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return Ret.fail("msg",exeResult);
	}
	
	public static void main(String[] args){
		String cmdPath ="java";
		String fileDir = "D:\\q\\exeTest\\";
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

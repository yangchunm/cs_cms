package org.kelab.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.rt.BASE64Decoder;
import com.rt.BASE64Encoder;

public class Base64Utils {
	
	/**
	 *  对字节数组字符串进行Base64解码并生成图片
	 * @param imgStr Base64编码
	 * @param imgFilePath  图片文件
	 * @return
	 */
	public static boolean GenerateImage(String imgStr, String imgFilePath) {
        System.out.println("EEE"+imgFilePath);;
		if (imgStr == null) // 图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            // Base64解码
            byte[] bytes = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            // 生成图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(bytes);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
	}
	
	
	/**
	 * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
	 * @param imgFilePath 图片文件
	 * @return
	 */
	public static String GetImageStr(String imgFilePath) { 
        byte[] data = null;
        // 读取图片字节数组
        try {
            InputStream in = new FileInputStream(imgFilePath);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);// 返回Base64编码过的字节数组字符串
    }

}

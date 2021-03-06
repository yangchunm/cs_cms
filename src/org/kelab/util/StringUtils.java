package org.kelab.util;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kelab.bean.Latex;

import com.jfinal.core.JFinal;
import com.jfinal.log.Log;

public class StringUtils {
	private static final Log log = Log.getLog(StringUtils.class);

	public static String urlDecode(String string) {
		try {
			return URLDecoder.decode(string, JFinal.me().getConstants().getEncoding());
		} catch (UnsupportedEncodingException e) {
			log.error("urlDecode is error", e);
		}
		return string;
	}

	public static String urlEncode(String string) {
		try {
			return URLEncoder.encode(string, JFinal.me().getConstants().getEncoding());
		} catch (UnsupportedEncodingException e) {
			log.error("urlEncode is error", e);
		}
		return string;
	}

	public static String urlRedirect(String redirect) {
		try {
			redirect = new String(redirect.getBytes(JFinal.me().getConstants().getEncoding()), "ISO8859_1");
		} catch (UnsupportedEncodingException e) {
			log.error("urlRedirect is error", e);
		}
		return redirect;
	}

	public static boolean areNotEmpty(String... strings) {
		if (strings == null || strings.length == 0)
			return false;

		for (String string : strings) {
			if (string == null || "".equals(string)) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNotEmpty(String string) {
		return string != null && !string.equals("");
	}

	public static boolean areNotBlank(String... strings) {
		if (strings == null || strings.length == 0)
			return false;

		for (String string : strings) {
			if (string == null || "".equals(string.trim())) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNotBlank(String string) {
		return string != null && !string.trim().equals("");
	}

	public static boolean isBlank(String string) {
		return string == null || string.trim().equals("");
	}

	public static long toLong(String value, Long defaultValue) {
		try {
			if (value == null || "".equals(value.trim()))
				return defaultValue;
			value = value.trim();
			if (value.startsWith("N") || value.startsWith("n"))
				return -Long.parseLong(value.substring(1));
			return Long.parseLong(value);
		} catch (Exception e) {
		}
		return defaultValue;
	}

	public static int toInt(String value, int defaultValue) {
		try {
			if (value == null || "".equals(value.trim()))
				return defaultValue;
			value = value.trim();
			if (value.startsWith("N") || value.startsWith("n"))
				return -Integer.parseInt(value.substring(1));
			return Integer.parseInt(value);
		} catch (Exception e) {
		}
		return defaultValue;
	}

	public static BigInteger toBigInteger(String value, BigInteger defaultValue) {
		try {
			if (value == null || "".equals(value.trim()))
				return defaultValue;
			value = value.trim();
			if (value.startsWith("N") || value.startsWith("n"))
				return new BigInteger(value).negate();
			return new BigInteger(value);
		} catch (Exception e) {
		}
		return defaultValue;
	}

	public static boolean match(String string, String regex) {
		Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(string);
		return matcher.matches();
	}

	public static boolean isNumeric(String str) {
		if (str == null)
			return false;
		for (int i = str.length(); --i >= 0;) {
			int chr = str.charAt(i);
			if (chr < 48 || chr > 57)
				return false;
		}
		return true;
	}

	public static String escapeHtml(String text) {
		if (isBlank(text))
			return text;
		
		return text.replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#x27;").replace("/", "&#x2F;");
	}
	
	/**
	 * 分割多个Tags
	 * @param srcTags
	 * @return
	 */
	public static String[] splitTags(String srcTags){
		if(srcTags.indexOf(",")>0)
			return srcTags.split(",");
		else if(srcTags.indexOf("，")>0)
			return srcTags.split("，");
		else if(srcTags.indexOf(" ")>0)
			return srcTags.split(" ");
		else
			return srcTags.split(" ");
					
	}
	
	public static String tags2InStr(String srcTags){
		String inStr = "(";
		String[] tags =  srcTags.split(",");
		for(String tag : tags){
			if(tag.length()>0)
				inStr += "'"+tag+"',";
		}
		inStr = inStr.substring(0, inStr.length()-1) + ")";
		return inStr;
					
	}
	
	/**
	 * 从html的img标签中抽取Latex对象
	 * @param formHtml
	 * @return
	 */
	public static List<Latex> extrLatex(String formHtml){
		List<Latex> strLatex = new ArrayList<Latex>();
		Document doc = Jsoup.parseBodyFragment(formHtml);
		Elements imgs = doc.getElementsByTag("img");
		for(Element img : imgs) {
			String lat = img.attr("data-latex");
			if(lat != null && lat != ""){
				Latex latex = new Latex();
				latex.setLatexCode(lat);
				latex.setImgHtml(img.toString());
				String base64 = img.attr("src");
				if(base64 != null && base64 != "" && base64.indexOf(",")>0)
					base64 = base64.split(",")[1];
				latex.setBase64Code(base64);
				strLatex.add(latex);
			}
			}
		return strLatex;
	}
	
	/**
	 * 从img标签中获取Base64编码
	 * @param imgHtml
	 * @return
	 */
	public static String extBase64Str(String imgHtml){
		Document doc = Jsoup.parseBodyFragment(imgHtml);
		Elements imgs = doc.getElementsByTag("img");
		String basestr = "";
		for(Element img : imgs) {
			basestr = img.attr("src");
			break;
			}
		if(basestr != "")
			return basestr.split(",")[1];
		else			
			return basestr;
	}
	
	/**
	 * 只需要img标签的内容
	 * @param formHtml
	 * @return
	 */
	public static String onlyimg(String formHtml){
		String retStr = "";
		Document doc = Jsoup.parseBodyFragment(formHtml);
		Elements imgs = doc.getElementsByTag("img");
		for(Element img : imgs) {
			retStr = retStr + img.toString();
			}
		return retStr;
	}
	
	/**
	 * 去掉文本中的HTML标签
	 * @param srcHtml
	 * @return
	 */
	public static String delHTML(String srcHtml){
		String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式  
	    String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式  
	    String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式  
	    String regEx_space = "\\s*|\t|\r|\n";//定义空格回车换行符 
	    Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);  
        Matcher m_script = p_script.matcher(srcHtml);  
        srcHtml = m_script.replaceAll(""); // 过滤script标签  
  
        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);  
        Matcher m_style = p_style.matcher(srcHtml);  
        srcHtml = m_style.replaceAll(""); // 过滤style标签  
  
        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);  
        Matcher m_html = p_html.matcher(srcHtml);  
        srcHtml = m_html.replaceAll(""); // 过滤html标签  
  
        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);  
        Matcher m_space = p_space.matcher(srcHtml);  
        srcHtml = m_space.replaceAll(""); // 过滤空格回车标签  
        return srcHtml.trim(); // 返回文本字符串  
	}
	
	/**
	 * 从文本“[[rrr]]”中找出链接文字
	 * @param srcTxt
	 * @return
	 */
	public static List<String> findWikiLinkWord(String srcTxt){
		List<String> rt = new ArrayList<String>();
		while(srcTxt.indexOf("[[")>=0){
			String target = srcTxt.substring(srcTxt.indexOf("[["));
			rt.add(target.substring(2,target.indexOf("]]")));
			srcTxt = target.substring(target.indexOf("]]"));
		}
		return rt;
		
	}
	
	public static String MD5(String s) {
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

	
	public static void main(String[] args){
		String txt ="123456";
				System.out.println(MD5(txt));
		
		
	}
}
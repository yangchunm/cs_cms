package org.kelab.test;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kelab.bean.Latex;
import org.kelab.model.KeUser;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class Test {
	
	
	/**
	 * 从html的img标签中抽取Latex文本
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
	
	//将中文转换为英文
    @SuppressWarnings("deprecation")
	public static String getEname(String name) throws BadHanyuPinyinOutputFormatCombination {
         HanyuPinyinOutputFormat pyFormat = new HanyuPinyinOutputFormat();
         pyFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);    //设置样式
         pyFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
          pyFormat.setVCharType(HanyuPinyinVCharType.WITH_V);

         return PinyinHelper.toHanyuPinyinString(name, pyFormat, "");
    }

    //姓、名 英文第一个字母大写
    public static String getUpEname(String name) throws BadHanyuPinyinOutputFormatCombination {
         char[] strs = name.toCharArray();
         String newname = null;


          if (strs.length == 2) {    //如果姓名只有两个字
               newname = toUpCase(getEname("" + strs[0])) + " " + toUpCase(getEname("" + strs[1]));
           } else if (strs.length == 3) {    //如果姓名有三个字
               newname = toUpCase(getEname("" + strs[0])) + " "+ toUpCase(getEname("" + strs[1] + strs[2]));
           } else if (strs.length == 4) {    //如果姓名有四个字
               newname = toUpCase(getEname("" + strs[0] + strs[1])) + " "+ toUpCase(getEname("" + strs[2] + strs[3]));
         } else {
                newname = toUpCase(getEname(name));
         }

         return newname;
    }

     //首字母大写
    private static String toUpCase(String str) {
         StringBuffer newstr = new StringBuffer();
         newstr.append((str.substring(0, 1)).toUpperCase()).append(
         str.substring(1, str.length()));

         return newstr.toString();
    }
	
	public static void main(String[] args) throws BadHanyuPinyinOutputFormatCombination{
		String sql ="select * from ke_user order by id desc";
		List<KeUser> keu = KeUser.dao.find(sql);
		for(KeUser u : keu){
			u.setUserPinyin(getUpEname(u.getUserRealName()));
			u.update();
			System.out.println(u.getUserRealName()+"####"+getUpEname(u.getUserRealName()));;
		}
	}
}

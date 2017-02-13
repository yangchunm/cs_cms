package org.kelab.test;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.kelab.bean.Latex;

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
	
	public static void main(String[] args){
		String html ="<img src=\"tt.png\"> <img src=\"123,jpg\" data-latex=\"djklajfkld\">";
		for(Latex ele : extrLatex(html)){
			System.out.println("#"+ele.getBase64Code()+"$"+ele.getImgHtml()+"%"+ele.getLatexCode());
		}
	}
}

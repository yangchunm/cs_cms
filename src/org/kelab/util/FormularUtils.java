package org.kelab.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import org.apache.batik.anim.dom.SAXSVGDocumentFactory;
import org.apache.batik.transcoder.TranscoderException;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.batik.transcoder.image.PNGTranscoder;
import org.apache.batik.util.XMLResourceDescriptor;
import org.openbabel.OBConversion;
import org.openbabel.OBMol;
import org.openscience.cdk.io.MDLReader;
import org.openscience.cdk.silent.AtomContainer;
import org.w3c.dom.Document;
import org.openscience.cdk.exception.CDKException;
import org.openscience.cdk.interfaces.IAtomContainer;

import net.sf.structure.cdk.util.ImageKit;

@SuppressWarnings("deprecation")
public class FormularUtils {
	
	/**
	 * 转换指定分子结构的文件为svg格式
	 * @param molFormat 分子文件格式
	 * @param srcPath 分子文件路径
	 * @return 在同一目录下生成同一文件名的svg文件
	 */
	@SuppressWarnings("finally")
	public static boolean convertSvg(String molFormat, String srcPath){
		//try{
		//	System.loadLibrary("openbabel_java");
		//}catch(Exception e){
		//	e.printStackTrace();
		//}finally{
			System.out.println(molFormat+"%%%"+srcPath);
			OBConversion conv = new OBConversion();
			OBMol mol = new OBMol();
			String target = srcPath.replace("."+molFormat, ".svg");
			conv.SetInFormat(molFormat);
			conv.ReadFile(mol,srcPath);
			conv.SetOutFormat("svg");
			conv.WriteFile(mol, target);
			File f = new File(target);
			//System.clearProperty("openbabel_java");
			System.out.println("svg down...");
			if(f.exists())
				return true;
			else
				return false;
		//}
	}
	
	/**
	 * 将SVG转换成PNG
	 * @param path SVG文件路径
	 * @param outputStream 输出流
	 * @throws TranscoderException
	 * @throws IOException
	 */
	public static boolean convSvgtoPng(String svgPath) throws IOException{
			boolean flag = true;
			File svgFile = new File(svgPath);
			String parser = XMLResourceDescriptor.getXMLParserClassName();
			SAXSVGDocumentFactory f = new SAXSVGDocumentFactory(parser);
			Document doc = f.createDocument(svgFile.toURI().toString());
			
			File target = new File (svgPath.replace("svg","png"));
			FileOutputStream outputStream = null;
			target.createNewFile();
			outputStream = new FileOutputStream(target);
			
			PNGTranscoder t = new PNGTranscoder();
			TranscoderInput input = new TranscoderInput(doc);
			TranscoderOutput output = new TranscoderOutput(outputStream);
			try {
				t.transcode(input, output);
			} catch (TranscoderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag = false;
			}
			outputStream.flush();
			System.out.println("pngg down...");
			return flag;
	}
	
	public static void writePNG(String molPath) throws CDKException, IOException{
		MDLReader mdlReader = new MDLReader(new FileReader(molPath));
		IAtomContainer mol = (IAtomContainer)mdlReader.read(new AtomContainer());
		ImageKit.writeSVG(mol, 300, 300, molPath.replace(".mol", ".svg"));
	}
	
	public static void main(String[] args) throws IOException, CDKException{
		String path = "D:\\work\\SourceCode\\structure-cdk-0.1.2\\molfiles\\caffeine.mol";
		writePNG(path);
		//convSvgtoPng(path);
	}
	

}

package org.kelab.util;

import java.io.FileReader;
import java.io.IOException;

import org.openscience.cdk.io.MDLReader;
import org.openscience.cdk.silent.AtomContainer;
import org.openscience.cdk.depict.Depiction;
import org.openscience.cdk.depict.DepictionGenerator;
import org.openscience.cdk.exception.CDKException;
import org.openscience.cdk.interfaces.IAtomContainer;

@SuppressWarnings("deprecation")
public class FormularUtils {
	
	/**
	 * 转换指定分子结构的文件为svg格式
	 * @param molFormat 分子文件格式
	 * @param srcPath 分子文件路径
	 * @return 在同一目录下生成同一文件名的svg文件
	 * @throws CDKException 
	 * @throws IOException 
	 */
	
	public static void writePNGSVG(String molPath) throws CDKException, IOException{
		String fileExt = FileUtils.getSuffix(molPath);
		@SuppressWarnings("resource")
		MDLReader mdlReader = new MDLReader(new FileReader(molPath));
		IAtomContainer mol = (IAtomContainer)mdlReader.read(new AtomContainer());
		Depiction depiction = new DepictionGenerator().withMargin(10)
				.withAtomColors().withMolTitle().depict(mol);
		depiction.writeTo(molPath.replace(fileExt, ".png"));
		depiction.writeTo(molPath.replace(fileExt, ".svg"));
	}
	
	public static void main(String[] args) throws IOException, CDKException{
		String path = "C:\\Users\\MrYang\\git\\emgen\\WebRoot\\upload\\knmole\\1486468845280.mol";
		writePNGSVG(path);
		//convSvgtoPng(path);
	}
	

}

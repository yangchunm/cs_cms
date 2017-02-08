package org.kelab.util;

import java.io.File;

import org.openbabel.OBAtom;
import org.openbabel.OBConversion;
import org.openbabel.OBMol;
import org.openbabel.OBMolAtomIter;
import org.openbabel.OBSmartsPattern;
import org.openbabel.vectorvInt;
import org.openbabel.OBFormat;

public class FormularUtils {
	public static void convert(){
		System.loadLibrary("openbabel_java");
		OBConversion conv = new OBConversion();
		OBMol mol = new OBMol();
		conv.SetInFormat("smi");
		conv.ReadString(mol, "C(Cl)(=O)CCC(=O)Cl");
		// Print out some general information
		conv.SetOutFormat("can");
		System.out.print("Canonical SMILES: " +
		conv.WriteString(mol));
		System.out.println("The molecular weight is "
		+ mol.GetMolWt());
		for(OBAtom atom : new OBMolAtomIter(mol))
		System.out.println("Atom " + atom.GetIdx()
		+ ": atomic number = " + atom.GetAtomicNum()
		+ ", hybridisation = " + atom.GetHyb());
		// What are the indices of the carbon atoms
		// of the acid chloride groups?
		OBSmartsPattern acidpattern = new OBSmartsPattern();
		acidpattern.Init("C(=O)Cl");
		acidpattern.Match(mol);
		vectorvInt matches = acidpattern.GetUMapList();
		System.out.println("There are " + matches.size() +
		" acid chloride groups");
		System.out.print("Their C atoms have indices: ");
		for(int i=0; i<matches.size(); i++)
		System.out.print(matches.get(i).get(0) + " ");
	}
	
	public static void convertPng(){
		System.loadLibrary("openbabel_java");
		OBConversion conv = new OBConversion();
		OBMol mol = new OBMol();
		String dir = "C:\\Users\\MrYang\\git\\emgen\\WebRoot\\upload\\knmole\\";
		String ext = "mol";
		String srcFile ="1486468515530.";
		String src = dir+srcFile+ext;
		String target = dir+srcFile+"png";
		conv.SetInFormat(ext);
		conv.ReadFile(mol,src);
		// Print out some general information
		conv.SetOutFormat("png2");
		System.out.print("Canonical SMILES: ");
		conv.AddOption("p");
		conv.WriteFile(mol, target);
		
	}
	
	public static void main(String[] args) {
		convertPng();
		}
}

package org.kelab.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelUtils {
	//read excel
	public static String[][] ReadExcel(String filename, int ColCount) throws FileNotFoundException, IOException {
		HSSFWorkbook wookbook = new HSSFWorkbook(new FileInputStream(filename));
		HSSFSheet sheet = wookbook.getSheet("Sheet1");
		int rows = sheet.getPhysicalNumberOfRows();
		String[][] paras =  new String[rows][ColCount];
		for (int i = 0; i < rows; i++) {
			HSSFRow row = sheet.getRow(i);
			if (row != null) {
				//int cells = row.getPhysicalNumberOfCells();
				int cells = ColCount;
				for (int j = 0; j < cells; j++) {
					HSSFCell cell = row.getCell(j);
					if(cell != null)
						paras[i][j] = cell.toString();
					else
						paras[i][j] = "";
				}
			}
		}
		wookbook = null;
		return paras;
	}
}

package org.kelab.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
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
		DecimalFormat df = new DecimalFormat("#.####");
		for (int i = 1; i < rows; i++) {
			HSSFRow row = sheet.getRow(i);
			if (row != null) {
				int cells = row.getPhysicalNumberOfCells();
				for (int j = 0; j < cells; j++) {
					HSSFCell cell = row.getCell(j);
					if (cell != null) {						
						switch (cell.getCellType()) {
							case HSSFCell.CELL_TYPE_FORMULA:								
							    paras[i][j] = df.format(cell.getNumericCellValue());
								break;
							case HSSFCell.CELL_TYPE_NUMERIC:
								 if (HSSFDateUtil.isCellDateFormatted(cell)) {    
								    SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
							        Date dt = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());   
							        paras[i][j] = dateformat.format(dt); 
								 } else{									
								    paras[i][j] = df.format(cell.getNumericCellValue());
									 
								 }
								 break;
							case HSSFCell.CELL_TYPE_STRING:
								paras[i][j] = cell.getStringCellValue();
								break;							
							default:
								paras[i][j] = null;
								break;
								
						}
					}
				}
			}
		}
		/*
		int[] ret = Db.batch(sql, paras, 100);
		int s = 0, l = 0;
		for (int i = 0; i < ret.length; i++)
			if (ret[i] == 1)
				s++;
			else
				l++;
		map = new HashMap<String, Object>();
		map.put("success", s);
		map.put("lost", l);
		map.put("count", ret.length);
		*/
		wookbook = null;
		return paras;
	}
}

package com.tms.utils;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tms.beans.QuestionBean;

public class ExcelUtils {

	public static List<QuestionBean> extractAsList(String filePath) {		
		List<QuestionBean> questionBeans = null;		
		int maxDataCount = 0;
		try {	
			FileInputStream file = new FileInputStream(filePath);	
			// Create Workbook instance holding reference to .xlsx file
			XSSFWorkbook workbook = new XSSFWorkbook(file);
			// Get first/desired sheet from the workbook
			XSSFSheet sheet = workbook.getSheetAt(0);
			// Iterate through each rows one by one
			Iterator<Row> rowIterator = sheet.iterator();
			
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				// Skip the first row beacause it will be header
				if (row.getRowNum() == 0) {
					maxDataCount = row.getLastCellNum();
					continue;
				}
	  			// if row is empty then break the loop,do not go further
				if (isRowEmpty(row, maxDataCount)) {
					break;
				}				
				//ArrayList<Object> singleRows = new ArrayList<Object>();
				questionBeans = new ArrayList<QuestionBean>();
			    String questionRow = "";
			    DataFormatter formatter = new DataFormatter();
			  //  String val = formatter.formatCellValue(sheet.getRow(col).getCell(row));
				// For each row, iterate through all the columns and put in a string separated by delimiters
//				for (int column = 0; column < maxDataCount; column++) {
//				    questionRow = questionRow +"-"+ formatter.formatCellValue(sheet.getRow(column).getCell(row.getRowNum()+1));
//				    if(column == 2){
//				    	questionRow = questionRow +":";	
//				    }
//				}
//				
			    for (Row rowCell : sheet) {
			    	if(rowCell.getRowNum() == 0){
			    		continue;
			    	}
			    	  for (Cell cell : rowCell) {
			    		  questionRow = questionRow + formatter.formatCellValue(cell)+"-";
			    		  if(cell.getColumnIndex() == 2){			    			    
			    			    questionRow = questionRow.substring(0, questionRow.length() - 1);
			    			   // questionRow = questionRow.substring(0,2);
						    	questionRow = questionRow +":";
						    	
						    }
			    		  questionRow = questionRow.replace(":-", ":");
			    	  }
			    }				
				String[] questionRowsArray = questionRow.split(":");
				for(String questions : questionRowsArray){					
			    String [] questionColumns = questions.split("-");
					QuestionBean questionBean = new QuestionBean();
					questionBean.setChapterName(questionColumns[0]);
					questionBean.setQuestion(questionColumns[1]);
					questionBean.setMarks(questionColumns[2] != null ? Integer.parseInt(questionColumns[2]) : null);
					questionBeans.add(questionBean);
				}
			}
			file.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return questionBeans;
	}
	
	private static boolean isRowEmpty(Row row, int lastcellno) {
		for (int c = row.getFirstCellNum(); c < lastcellno; c++) {
			Cell cell = row.getCell(c);
			if (cell != null && cell.getCellTypeEnum() != CellType.BLANK)
				return false;
		}
		return true;
	}

}

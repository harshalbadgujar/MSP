package Common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.module.ModuleDescriptor.Exports;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.testng.Assert;
import org.testng.ITestResult;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Parameters;
import com.relevantcodes.extentreports.ExtentReports;
import com.relevantcodes.extentreports.ExtentTest;
import com.relevantcodes.extentreports.LogStatus;

import MSP_API.MSEC_Bills;
import MSP_API.Reload;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Test_Base 
{
	public static String requestUid;
	public static String MPTData_requestUid;
	public static String transactionAmount;	
	public static String responseCode;
	public static int walletUniqueId;
	public static int customerId;
	public static int walletTypeId;
	public static String walletType;	
	public static int transactionId;
	public static String feeAmount = Reload.reload_feeAmount;
	public static Properties prop;
	FileInputStream fileInput;
	public static ExtentTest test;
	//public static ExtentReports report = new ExtentReports("E:\\IATA\\Autonation\\MSP_Automation\\MSP_Result.html", true);
	//public static ExtentTest logger;
	static String class_name = "Environment";
	public static String Username = "QA";
	public static String Test;
	public ExtentTest logger;
	public ExtentReports extent;
	
	@BeforeSuite

	public void setupTest() throws MalformedURLException 
	{
		extent = new ExtentReports(System.getProperty("user.dir") + "/src/MSP_Extent_Report.html", true);

	}
	
	
	public static ArrayList<String> readTestData(String class_name, String method_name) throws IOException
	{
		String fileName = "Db-data-for-EPC.xlsx";
		String filePath = System.getProperty("user.dir") + "\\TestData", sheetName = class_name;
		
		// Create a object of File class to open xlsx file
		File file = new File(filePath + "\\" + fileName);
		// Create an object of FileInputStream class to read excel file
		FileInputStream inputStream = new FileInputStream(file);
		Workbook workbook = null;
		// getting only extension name
		String fileExtensionName = fileName.substring(fileName.indexOf("."));
		
		// Check condition if the file is xlsx file
		if (fileExtensionName.equals(".xlsx")) {
			// If it is xlsx file then create object of XSSFWorkbook class
			workbook = new XSSFWorkbook(inputStream);
			
		}
		// Check condition if the file is xls file
		else if (fileExtensionName.equals(".xls")) {

			// If it is xls file then create object of XSSFWorkbook class
			workbook = new HSSFWorkbook(inputStream);
			
		}
		// Read sheet inside the workbook by its name
		Sheet sheet = workbook.getSheet(sheetName);
		
//	
		// Find number of rows workbook excel file
		int rowCount = sheet.getLastRowNum() - sheet.getFirstRowNum();
		
		ArrayList<String> cell_values = new ArrayList<String>();
		// Create a loop over all the rows of excel file to read it
		outerloop: for (int i = 1; i < rowCount + 1; i++) {
			Row row = sheet.getRow(i);
			if (row != null) {
				if (row.getCell(0).getStringCellValue().equals(method_name)) {
					for (int j = 0; j < row.getLastCellNum(); j++) {
						// Print excel data in console
						DataFormatter formatter = new DataFormatter();
						cell_values.add(formatter.formatCellValue(row.getCell(j)));
					}
					break outerloop;
				} else
					continue;
			}
		}

	return cell_values;

	}
	@AfterMethod // to generate the extent report

	public void tearDown(ITestResult result) throws IOException {

		if (result.getStatus() == ITestResult.FAILURE) {
			
			logger.log(LogStatus.FAIL, "Test Case Failed is " + result.getName());
			logger.log(LogStatus.FAIL, "Test Case Failed is " + result.getThrowable());

		} else if (result.getStatus() == ITestResult.SUCCESS)
		{
			System.out.println("In Pass");
			logger.log(LogStatus.PASS, "Success.");
		}
		else 
		{
			System.out.println("In skip");
			logger.log(LogStatus.SKIP, "Test case skipped.");
		}
		extent.endTest(logger); // to end the Current logger state
		extent.flush(); // To clear all extent report Status
		}
}

	
	/*
	 * public static void readExcel(String filePath,String fileName,String
	 * sheetName) throws IOException { //Create an object of File class to open xlsx
	 * file
	 * 
	 * File file = new File(filePath+"\\"+fileName);
	 * 
	 * //Create an object of FileInputStream class to read excel file
	 * 
	 * FileInputStream inputStream = new FileInputStream(file);
	 * 
	 * Workbook Workbook = null;
	 * 
	 * //Find the file extension by splitting file name in substring and getting
	 * only extension name
	 * 
	 * String fileExtensionName = fileName.substring(fileName.indexOf("."));
	 * 
	 * //Check condition if the file is xlsx file
	 * 
	 * if(fileExtensionName.equals(".xlsx")){
	 * 
	 * //If it is xlsx file then create object of XSSFWorkbook class
	 * 
	 * Workbook = new XSSFWorkbook(inputStream);
	 * 
	 * }
	 * 
	 * //Check condition if the file is xls file
	 * 
	 * else if(fileExtensionName.equals(".xls")){
	 * 
	 * //If it is xls file then create object of HSSFWorkbook class
	 * 
	 * Workbook = new HSSFWorkbook(inputStream);
	 * 
	 * }
	 * 
	 * //Read sheet inside the workbook by its name
	 * 
	 * Sheet sheet = Workbook.getSheet(sheetName);
	 * 
	 * //Find number of rows in excel file
	 * 
	 * int rowCount = sheet.getLastRowNum()-sheet.getFirstRowNum();
	 * 
	 * //Create a loop over all the rows of excel file to read it
	 * 
	 * for (int i = 0; i < rowCount+1; i++) {
	 * 
	 * Row row = sheet.getRow(i);
	 * 
	 * //Create a loop to print cell values in a row
	 * 
	 * for (int j = 0; j < row.getLastCellNum(); j++) {
	 * 
	 * //Print Excel data in console
	 * 
	 * System.out.print(row.getCell(j).getStringCellValue()+"|| ");
	 * 
	 * }
	 * 
	 * System.out.println(); }
	 * 
	 * }
	 * 
	 * }
	 */
	
	
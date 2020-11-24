package MSP_API;

import java.io.IOException;
import org.json.simple.JSONObject;
import Common.Test_Base;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class MSEC_Bills extends MSEC_Chart

{
	public static String fileName = "Db-data-for-EPC.xlsx"; 
	public static String class_name = "MESC-boat";
	
	public static void GET_MSEC_District()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();	
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/msce/districts?stateCode=MMR010");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
	public void inq(String BillerCode, String detail) throws IOException
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();	
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");		
		
		JSONObject requestParams = new JSONObject();    
	    requestParams.put("BillerCode", BillerCode);
        requestParams.put("detail", detail);

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/msce/districts?stateCode=MMR010");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
		 
	}
		
	/*
	 * public void Biller_Txn(String token, String Partnercode, String billerType,
	 * String txn_amount, String detail ) throws Exception{
	 * 
	 * request.header("Content-Type", "application/json");
	 * 
	 * JSONObject requestParams = new JSONObject();
	 *  requestParams.put("Token",token); 
	 *  requestParams.put("PartnerCode", Partnercode);
	 * requestParams.put("PartnerRefNo",
	 * "AUTO1StopGP"+TestBase.getRandomNumberString());
	 * requestParams.put("BillerCode", billerType);
	 * requestParams.put("TransactionAmount", txn_amount);
	 * requestParams.put("Detail", detail);
	 * System.out.println("request string"+requestParams.toString());
	 * 
	 * request.body(requestParams.toString()); Response response = request
	 * .post(prop.getProperty("APIURLforMaketxn"));
	 * 
	 * System.out.println("endpoint is:"+prop.getProperty("APIURLforMaketxn"));
	 * String responseInString = response.asString();
	 * System.out.println("Response in string is:"+responseInString);
	 * 
	 * JsonPath js = new JsonPath(responseInString); ebaTransaction =
	 * js.get("EBARefNo"); ebaTranserrorcode = js.getString("ErrorCode");
	 * ebaTranserrormessage = js.getString("ErrorMessage"); ebaPartnerAmount =
	 * js.getString("PartnerBalance");
	 * 
	 * 
	 * // System.out.println("EBARefNo:"+js.get("EBARefNo"));
	 * System.out.println("Response Code:"+ebaTranserrorcode); //
	 * System.out.println("PartnerRefNo:"+js.get("PartnerRefNo")); //
	 * System.out.println("PartnerAmount:"+js.get("PartnerAmount")); //
	 * System.out.println("TransactionAmount:"+js.get("TransactionAmount")); //
	 * System.out.println("PartnerBalance:"+js.get("PartnerBalance"));
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * }
	 */
}

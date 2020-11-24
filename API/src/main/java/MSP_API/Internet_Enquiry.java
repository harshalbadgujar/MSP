package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Internet_Enquiry extends Internet
{
	public static String hiwifi_RequestID;
	public static String telenorData_RequestID;
	public static String hiwifi_Mob_RequestID;
	public static String mmNetPrepaid_RequestID;
	public static String telenorFiber_RequestID;
	public static String telenorWireless_RequestID;
	public static String mmAWA_RequestID;
	public static String teleData_transactionAmount;
	public static String tele_Fiber_txn_Amount;
	
	public static void enq_HiWifi()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification requestL = RestAssured.given();
	    
	    JSONObject requestParamsL = new JSONObject();
	    requestParamsL.put("billerCode", "HiWiFi");
	    requestParamsL.put("detail", "{'Deno':'1000','MobileNumber':'09421133241'}");
	    requestL.header("Content-Type", "application/json");
	    requestL.header("Authorization", login_token);
	    requestL.body(requestParamsL.toJSONString());
	    
	    Response response = requestL.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
	    hiwifi_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(hiwifi_RequestID);
	    
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
	
	public static void enq_TelenorDataPack()
	{
	    RequestSpecification requestL = RestAssured.given();
	    
	    JSONObject requestParamsL = new JSONObject();
	    requestParamsL.put("billerCode", "TelenorDataPack");
	    requestParamsL.put("detail", "{'Deno':'899','MobileNumber':'09421133241'}");
	    requestL.header("Content-Type", "application/json");
	    requestL.header("Authorization", login_token);
	    requestL.body(requestParamsL.toJSONString());
	    
	    Response response = requestL.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
	    telenorData_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(telenorData_RequestID);
	    
	    teleData_transactionAmount = response.jsonPath().get("transactionAmount");
	    System.out.println(teleData_transactionAmount);
	    
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	    
	}
	
	public static void enq_HIWIFI_W0_Mobile()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "HiWiFi");
	    requestParams.put("detail", "{'Deno':'1000'}");
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    httpRequest.body(requestParams.toJSONString());
	    
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
	    String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
	    hiwifi_Mob_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(hiwifi_Mob_RequestID);
	    JsonPath extractor = response.jsonPath();	
	    responseCode = extractor.getString("responseCode");

	}
	
	public static void enq_MyanmarNetPrepaid()
	{
		RequestSpecification httpRequest = RestAssured.given();
		
        JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "MyanmarNetPrepaid");
        requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09421133241'}");
        httpRequest.header("Content-Type", "application/json");
        httpRequest.header("Authorization", login_token);
        httpRequest.body(requestParams.toJSONString());
        
        Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry");
	    String responseBody = response.getBody().asString();
		System.out.println(responseBody);
	    mmNetPrepaid_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(mmNetPrepaid_RequestID);
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");

	}
	
	public static void enq_telenor_Fiber()
	{
        RequestSpecification httpRequest = RestAssured.given();
        JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "TelenorFiber");
        requestParams.put("detail", "{'RegisteredMobileNo':'09791001051'}");
        httpRequest.header("Content-Type", "application/json");
        httpRequest.header("Authorization", login_token);
        httpRequest.body(requestParams.toJSONString());
        Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry");
	    String responseBody = response.getBody().asString();
		System.out.println(responseBody);
	    telenorFiber_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(telenorFiber_RequestID);
	    tele_Fiber_txn_Amount = response.jsonPath().getString("transactionAmount");
	    System.out.println(tele_Fiber_txn_Amount);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	    
	}
	
	public static void enq_Telenor_Wireless()
	{
        RequestSpecification httpRequest = RestAssured.given();
        JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "TelenorWireless");
        requestParams.put("detail", "{'RegisteredMobileNo':'09791001086'}");
        httpRequest.header("Content-Type", "application/json");
        httpRequest.header("Authorization", login_token);
        httpRequest.body(requestParams.toJSONString());
        Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry");
	    String responseBody = response.getBody().asString();
		System.out.println(responseBody);
	    telenorWireless_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(telenorWireless_RequestID);
	    String tWireless_transactionAmount = response.jsonPath().getString("transactionAmount");
	    System.out.println(tWireless_transactionAmount);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void enq_MyanmarNetAWaThone()
	{
        RequestSpecification httpRequest = RestAssured.given();
        JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "TelenorWireless");
        requestParams.put("detail", "{'RegisteredMobileNo':'09791001086'}");
        httpRequest.header("Content-Type", "application/json");
        httpRequest.header("Authorization", login_token);
        httpRequest.body(requestParams.toJSONString());
        Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry");
	    String responseBody = response.getBody().asString();
		System.out.println(responseBody);
	    mmAWA_RequestID = response.jsonPath().get("requestUid");
	    System.out.println(mmAWA_RequestID);
	    String mmAWAWireless_transactionAmount = response.jsonPath().getString("transactionAmount");
	    System.out.println(mmAWAWireless_transactionAmount);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

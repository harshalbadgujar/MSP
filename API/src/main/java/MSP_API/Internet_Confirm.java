package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Internet_Confirm extends Internet_Enquiry
{
	public static void confirm_HiWifi()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "HiWiFi");
	    requestParams.put("enquiryRequestId", hiwifi_RequestID);
	    requestParams.put("transactionAmount", "1000.00");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09777749700'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_Tele_DaraPack()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorDataPack");
	    requestParams.put("enquiryRequestId", telenorData_RequestID);
	    requestParams.put("transactionAmount", "899");
	    requestParams.put("detail", "{'Deno':'899','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_HiWiFi_Mobile()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "HiWiFi");
	    requestParams.put("enquiryRequestId", hiwifi_Mob_RequestID);
	    requestParams.put("transactionAmount", "1000");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09795404895'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_MyanmarNetPrepaid()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "MyanmarNetPrepaid");
	    requestParams.put("enquiryRequestId", mmNetPrepaid_RequestID);
	    requestParams.put("transactionAmount", "1000");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_Telenor_Fiber()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorFiber");
	    requestParams.put("enquiryRequestId", telenorFiber_RequestID);
	    requestParams.put("transactionAmount", "1000");
	    requestParams.put("detail", "{'CustomerID':'5002355','Amount':'75000','Devices':'868465034206555','product_id':'10'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_Telenor_Wireless()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorWireless");
	    requestParams.put("enquiryRequestId", telenorWireless_RequestID);
	    requestParams.put("transactionAmount", "1000");
	    requestParams.put("detail", "{'CustomerID':'5002380','Amount':'7000','Devices':'868465034206550','product_id':'8'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void confirm_MyanmarNetAWaThone()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorWireless");
	    requestParams.put("enquiryRequestId", telenorWireless_RequestID);
	    requestParams.put("transactionAmount", "1000");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

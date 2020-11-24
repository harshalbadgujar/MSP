package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Eload_Datapack_Enquiry extends Eload_Deno_Confirm
{
	public static String teleData_Eload_RequestID;
	public static String MPTDataPack_RequestID;
	public static String OoredooDataPack_RequestID;
	public static String MyTelDataPack_RequestID;
	
	
	public static void enq_TelenorDataPack()
	{   
		// Request to enquiry eload datapack > Telenor datapack
		
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorDataPack");
	    requestParams.put("detail", "{'Deno':'799','MobileNumber':'09777749700'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of TelenorDataPack: " + response.body().asString());
        teleData_Eload_RequestID = response.jsonPath().get("requestUid");
        System.out.println(teleData_Eload_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
		
	}
	
	public static void enq_MPTDataPack() 
	{
		// Request to enquiry eload datapack > MPTDataPack
		
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "MPTDataPack");
	    requestParams.put("detail", "{'packageCode':'Night_Bolt-ons_1G'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of MPTDataPack: " + response.body().asString());
        MPTDataPack_RequestID = response.jsonPath().get("requestUid");
        System.out.println(MPTDataPack_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void enq_OoredooDataPack()
	{
// Request to enquiry eload datapack > OoredooDataPack
		
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "OoredooDataPack");
        requestParams.put("detail", "{'Deno':'999','MobileNumber':'09964233241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of OoredooDataPack: " + response.body().asString());
        OoredooDataPack_RequestID = response.jsonPath().get("requestUid");
        System.out.println(OoredooDataPack_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	public static void enq_MyTelDataPack()
	{
// Request to enquiry eload datapack > MyTelDataPack
		
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "MyTelDataPack");
        requestParams.put("detail", "{'Package':'1000 MB','Deno':'1050','MobileNumber':'09691009765'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of MyTelDataPack: " + response.body().asString());
        MyTelDataPack_RequestID = response.jsonPath().get("requestUid");
        System.out.println(MyTelDataPack_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

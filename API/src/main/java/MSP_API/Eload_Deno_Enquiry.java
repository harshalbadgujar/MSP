package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Eload_Deno_Enquiry extends Movies_Confirm
{
	public static String mpt_RequestID;
	public static String tele_Eload_RequestID;
	
	// Request to enquiry for eload deno > MPTeLoad
	public static void enq_MPTeLoad()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "MPTeLoad");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09421022637'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of MPTeLoad: " + response.body().asString());
        mpt_RequestID = response.jsonPath().get("requestUid");
        System.out.println(mpt_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Request to enquiry for eload deno > telenorEload
	public static void enq_TelenoreLoad()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenoreLoad");
	    requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09795404895'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of Telenor Eload: " + response.body().asString());
        tele_Eload_RequestID = response.jsonPath().get("requestUid");
        System.out.println(tele_Eload_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Eload_Deno_Confirm extends Eload_Deno_Enquiry
{
	// Request to confirm MPTeLoad
	public static void confirm_MPTeLoad()
	{
		//RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "MPTeLoad");
        requestParams.put("enquiryRequestId", mpt_RequestID);
        requestParams.put("transactionAmount", "1000");
        requestParams.put("detail", "{'Deno':'1000','MobileNumber':'09421022637'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Request to confirm Telenor_eload
	public static void confirm_telenor_eload()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "TelenoreLoad");
        requestParams.put("enquiryRequestId", tele_Eload_RequestID);
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
	
}

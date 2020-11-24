package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Gifts_Enquiry extends Eload_DataPack_Confirm
{
	public static String swsgd_RequestID;
	public static String iTunes_ReqID;
	public static String viberout_ReqID;
	
	// Request to enquiry Gifts enquiry > SWSGD
	public static void enq_SWSGD()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "SWSGD");
        requestParams.put("detail", "{'Deno':'10'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of SWSGD: " + response.body().asString());
        swsgd_RequestID = response.jsonPath().get("requestUid");
        System.out.println(swsgd_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Request to enquiry Gifts enquiry > iTunes
	public static void enq_ITunes()
	{
		RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "iTunes");
	    requestParams.put("detail", "{'Deno':'5'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of iTunes: " + response.body().asString());
        iTunes_ReqID = response.jsonPath().get("requestUid");
        System.out.println(iTunes_ReqID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	// Request to enquiry Gifts enquiry > Viberout
		public static void enq_viberout()
		{
			RequestSpecification httpRequest = RestAssured.given();
		    
		    JSONObject requestParams = new JSONObject();
	        requestParams.put("billerCode", "ViberOut");
	        requestParams.put("detail", "{'Deno':'1'}");
		    
		    httpRequest.header("Content-Type", "application/json");
		    httpRequest.header("Authorization", login_token);
		    
		    httpRequest.body(requestParams.toJSONString());
		    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
	        System.out.println("Response body of Viberout: " + response.body().asString());
	        viberout_ReqID = response.jsonPath().get("requestUid");
	        System.out.println(viberout_ReqID);
		    
			JsonPath extractor = response.jsonPath();
			responseCode = extractor.getString("responseCode");
		}
}

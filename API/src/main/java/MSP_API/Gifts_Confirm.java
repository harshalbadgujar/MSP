package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Gifts_Confirm extends Gifts_Enquiry
{
	// Request to confirm SWSGD
	public static void confirm_SWSGD()
	{
		//RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
        RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "SWSGD");
	    requestParams.put("enquiryRequestId", swsgd_RequestID);
	    requestParams.put("transactionAmount", "11476.02");
	    requestParams.put("detail", "{'Deno':'10'}");
	   	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
				
		httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
	
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");	
	}	
	
	// Request to confirm iTunes
		public static void confirm_iTunes()
		{
			//RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
	        RequestSpecification httpRequest = RestAssured.given();
		    
		    JSONObject requestParams = new JSONObject();
		    requestParams.put("billerCode", "iTunes");
		    requestParams.put("enquiryRequestId", iTunes_ReqID);
		    requestParams.put("transactionAmount", "7701.25");
		    requestParams.put("detail", "{'Deno':'5'}");
	        
		    httpRequest.header("Content-Type", "application/json");
		    httpRequest.header("Authorization", login_token);
					
			httpRequest.body(requestParams.toJSONString());
		    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
		    String responseBody =response.getBody().asString();
			System.out.println(responseBody);
		
			JsonPath extractor = response.jsonPath();
			responseCode = extractor.getString("responseCode");	
		}	
		
		// Request to confirm viberOut
				public static void confirm_viberOut()
				{
					//RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
					
			        RequestSpecification httpRequest = RestAssured.given();
				    
				    JSONObject requestParams = new JSONObject();
				    requestParams.put("billerCode", "ViberOut");
				    requestParams.put("enquiryRequestId", iTunes_ReqID);
				    requestParams.put("transactionAmount", "7701.25");
				    requestParams.put("detail", "{'Deno':'5'}");
			        
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

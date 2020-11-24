package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Eload_DataPack_Confirm extends Eload_Datapack_Enquiry
{
	// Request to confirm TelenorDatapack
	public static void confirm_TelenorDataPack()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
        RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "TelenorDataPack");
	    requestParams.put("enquiryRequestId", teleData_Eload_RequestID);
	    requestParams.put("note", "");
	    requestParams.put("transactionAmount", "799.00");
	    requestParams.put("detail", "{'Deno':'799','MobileNumber':'09777749700'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
				
		httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
	
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");		
	}
	
	// Request to confirm MPTDataPack
	public static void confirm_MPTDataPack()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
								
        RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "MPTDataPack");
	    requestParams.put("enquiryRequestId", MPTDataPack_RequestID);
	    requestParams.put("transactionAmount", "899.00");
	    requestParams.put("detail", "{'endUserId':'09442627391','packageCode':'Night_Bolt-ons_1G','Price':'899.0'}");
	   	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
				
		httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
	
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");	
	}
	
	// Request to confirm OoredooDataPack
		public static void confirm_OoredooDataPack()
		{
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
									
	        RequestSpecification httpRequest = RestAssured.given();
		    
		    JSONObject requestParams = new JSONObject();
		    requestParams.put("billerCode", "OoredooDataPack");
		    requestParams.put("enquiryRequestId", OoredooDataPack_RequestID);
		    requestParams.put("transactionAmount", "999.0");
		    requestParams.put("detail", "{'MSISDN':'09972649400','OfferId':'95100105'}");
		   	    
		    httpRequest.header("Content-Type", "application/json");
		    httpRequest.header("Authorization", login_token);
					
			httpRequest.body(requestParams.toJSONString());
		    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
		    String responseBody =response.getBody().asString();
			System.out.println(responseBody);
		
			JsonPath extractor = response.jsonPath();
			responseCode = extractor.getString("responseCode");	
		}
		

		// Request to confirm MyTelDataPack
			public static void confirm_MyTelDataPack()
			{
				RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
										
		        RequestSpecification httpRequest = RestAssured.given();
			    
			    JSONObject requestParams = new JSONObject();
			    requestParams.put("billerCode", "MyTelDataPack");
			    requestParams.put("enquiryRequestId", MyTelDataPack_RequestID);
			    requestParams.put("transactionAmount", "1000");
			    requestParams.put("detail", "{'Package':'1000 MB','Deno':'1050','MobileNumber':'09694504895'}");
			   	    
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

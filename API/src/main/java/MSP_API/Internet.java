package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Internet extends User
{
	public static void get_Internet_List()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();		

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");		

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/GetBillerList");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);	
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
	
	public static void enquiry_Fees()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		  
		  RequestSpecification httpRequest = RestAssured.given();
		  
		  JSONObject requestParams = new JSONObject();
		  requestParams.put("billerCode", "TelenorWireless");
	      requestParams.put("amount", "5000");  
	        
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
		  httpRequest.body(requestParams.toJSONString());
		  
		  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Fees"); 
		  String responseBody =response.getBody().asString(); System.out.println(responseBody);
		  
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
	}
	
}

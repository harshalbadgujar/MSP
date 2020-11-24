package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class User extends MSEC_Chart
{
	public static void user_Details()
	{		
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		  
		  RequestSpecification httpRequest = RestAssured.given();
		  
		  JSONObject requestParams = new JSONObject();
		  requestParams.put("companyId", "008");
	      requestParams.put("customerId", customer_ID);        
	      requestParams.put("mobileCountryCode", "95");
	      requestParams.put("mobileNo", "0922228888");
	      requestParams.put("requestBy", "1");
	      requestParams.put("walletUniqueId", walletUniqueId);
		  
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
		  httpRequest.body(requestParams.toJSONString());
		  
		  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/gip/api/v1/wallet/detail"); 
		  String responseBody =response.getBody().asString(); System.out.println(responseBody);		
		  
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
	}	
	
		public static void txn_Search_History()
		{
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			  
			  RequestSpecification httpRequest = RestAssured.given();
			  
			  JSONObject requestParams = new JSONObject();
			  requestParams.put("getTransactionBy", "2");
		      requestParams.put("customerId", customer_ID);        
		      requestParams.put("mobileCountryCode", "95");
		      requestParams.put("yearMonth", "202006");
		      requestParams.put("statusId", "2");
		      requestParams.put("walletUniqueId", walletUniqueId);
		      requestParams.put("companyId", "008");
		      requestParams.put("pageNo", "1");
		      requestParams.put("pageSize", "3");
		      
		      httpRequest.header("Content-Type", "application/json");
			  httpRequest.header("Authorization", "Bearer " + login_token);
			  httpRequest.header("Accept-Language", "en-US");
			  httpRequest.body(requestParams.toJSONString());
			  
			  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/gip/api/v2/transaction/searchHistory"); 
			  String responseBody =response.getBody().asString(); System.out.println(responseBody);
			  
				 JsonPath extractor = response.jsonPath();
				 responseCode = extractor.getString("responseCode");
		}
		
		public static void get_Greeting_Message()
		{
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
			RequestSpecification httpRequest = RestAssured.given();		

			httpRequest.header("Content-Type", "application/json");
			httpRequest.header("Authorization", "Bearer " + login_token);
			httpRequest.header("Accept-Language", "en-US");		

			Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/motd");
			String responseBody = response.getBody().asString();
			System.out.println(responseBody);
			
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
		}
		
		public static void user_Donate_list()
		{
			//UAT/AppController/v1/Partner/Meters/"+""+ID+"/nickname
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
			RequestSpecification httpRequest = RestAssured.given();		

			httpRequest.header("Content-Type", "application/json");
			httpRequest.header("Authorization", "Bearer " + login_token);
			httpRequest.header("Accept-Language", "en-US");		

			Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/GetTopDonationList?CustomerId="+""+customer_ID+"&TotalRecord=5&DurationCode=M");
			String responseBody = response.getBody().asString();
			System.out.println(responseBody);
			
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
		
		}
}

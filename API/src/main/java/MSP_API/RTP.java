package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class RTP extends Eload_DataPack_Confirm
{
	public static String rtpCode;
	
	// Creating RTP request
	public static void create_RTP()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		  RequestSpecification httpRequest = RestAssured.given();
		  
		  JSONObject requestParams = new JSONObject();
		  requestParams.put("payerMobileNo", "09798304852");
		  requestParams.put("amount", 10);
	      requestParams.put("expirationDateUTC", "2020-07-13T13:47:40.471Z");
	      requestParams.put("memo", "Payment for rent");
		  
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
		  httpRequest.body(requestParams.toJSONString());
		  
		  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/rtp"); 
		  String responseBody =response.getBody().asString();
		  System.out.println(responseBody);

		  JsonPath extractor = response.jsonPath(); 
		  rtpCode = extractor.get("rtpCode");
		  System.out.println(rtpCode);
	      responseCode = extractor.getString("responseCode");            
	}
	
	// Request to pay RTP
	public static void pay_RTP()
	{
		  RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		  RequestSpecification httpRequest = RestAssured.given();
		  
		  JSONObject requestParams = new JSONObject();
	      requestParams.put("rtpCode", rtpCode);
		  
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
		  httpRequest.body(requestParams.toJSONString());
		  
		  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/rtp/pay"); 
		  String responseBody =response.getBody().asString();
		  System.out.println(responseBody);

		  JsonPath extractor = response.jsonPath(); 
		  //rtpCode = extractor.get("rtpCode");
		  //System.out.println(rtpCode);
	      //responseCode = extractor.getString("responseCode");  
	}
}

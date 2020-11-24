package Common;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Auth_token extends Mobile_Number
{
	public static String token;
	public static String mobile_No = "0922228888";
	//0922228888 
	//0900100480
	//@Test
	public static void xAuth ()
	{
		RestAssured.baseURI = "https://us-central1-mandalay-smart-wallet.cloudfunctions.net";
		
		RequestSpecification httpRequest = RestAssured.given();
		
	   JSONObject requestParams = new JSONObject();
	   //requestParams.put("uid", mno);
	   requestParams.put("uid", mobile_No);
	    
	    httpRequest.header("Content-Type","application/json");
	    
	    httpRequest.body(requestParams.toJSONString());
	    
	   Response response = httpRequest.request(Method.POST,"/apis/getUserToken");
	  // String responseBody = response.getBody().asString();
	  	  
	   JsonPath extractor = response.jsonPath();
	  token = extractor.get("token");
	 //System.out.println(token);
	}

}

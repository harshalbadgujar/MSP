package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class POST_Transfer extends POST_Login
{
	public static void transfer()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		
		requestParams.put("note","");
		requestParams.put("amount", "100");
		requestParams.put("receiverMobileNo", "0920112233");
		
		httpRequest.header("Content-Type", "application/json");
		//httpRequest.header("Authorization", "Bearer " + token);
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/transactions");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);	
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
				 
	}
}

package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class GET_Message_Details extends GET_Marketing_Messages_List
{
	public static void get_MSG_Details()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");		
		
		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/messages/26566");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
}

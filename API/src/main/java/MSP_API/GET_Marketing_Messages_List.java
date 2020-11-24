package MSP_API;

import org.json.simple.JSONObject;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class GET_Marketing_Messages_List extends Reload
{
	public static void get_Marketing_msg_List()
	{		
		try 
		{
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
			RequestSpecification httpRequest = RestAssured.given();

			JSONObject requestParams = new JSONObject();
			httpRequest.header("Content-Type", "application/json");
			httpRequest.header("Authorization", "Bearer " + login_token);
			httpRequest.header("Accept-Language", "en-US");
			
			
			Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/messages/search?pageNo=1&size=100");
			String responseBody = response.getBody().asString();
			System.out.println(responseBody);
			
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}

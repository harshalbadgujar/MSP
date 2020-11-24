package Common;

import org.json.simple.JSONObject;

import MSP_API.POST_Login;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Reload_123_Services extends POST_Login
{
	public static void reload_123()
	{
RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		
		requestParams.put("amount", "5000");
		requestParams.put("cardType", "");
		requestParams.put("channel", "2");
		requestParams.put("companyId", "008");
		requestParams.put("currencyCode","MMK");
		requestParams.put("mobileNo", mno);
		requestParams.put("walletUniqueId", walletUniqueId);
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v1/topup/initial");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		/*
		 * JsonPath extractor = response.jsonPath(); walletUniqueId =
		 * extractor.get("walletUniqueId");
		 */		
	}
}

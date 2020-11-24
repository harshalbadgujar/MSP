package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Reload extends POST_Login
{
	public static String reload_feeAmount;
	public static int reload_transactionId;
	// Reload with 123 services
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
		requestParams.put("mobileNo", mobile_No);
		requestParams.put("walletUniqueId", walletUniqueId);
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v1/topup/initial");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");	
		reload_transactionId = transactionId;
		transactionId = extractor.getInt("transactionId");	
		feeAmount = extractor.getString("feeAmount");	
		reload_feeAmount = feeAmount;
	}
	// Reload with MPU services
	public static void reload_MPU()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();
		JSONObject requestParamsMPU = new JSONObject();
		
        requestParamsMPU.put("amount", "5000");
        requestParamsMPU.put("cardType", "MC");
        requestParamsMPU.put("channel", "1");
        requestParamsMPU.put("companyId", "008");
        requestParamsMPU.put("mobileNo", mobile_No);
        requestParamsMPU.put("currencyCode", "MMK");
        requestParamsMPU.put("walletUniqueId", walletUniqueId);
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);

		httpRequest.body(requestParamsMPU.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v1/topup/initial");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");	
	}
	// Reload with Wave pay services
		public static void reload_WavePay()
		{
			RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
			
			RequestSpecification httpRequest = RestAssured.given();
			JSONObject requestParamsWP = new JSONObject();
			
	        requestParamsWP.put("amount", "5000");
	        requestParamsWP.put("cardType", "VS");
	        requestParamsWP.put("channel", "1");
	        requestParamsWP.put("companyId", "008");
	        requestParamsWP.put("mobileNo", mobile_No);
	        requestParamsWP.put("currencyCode", "MMK");
	        requestParamsWP.put("walletUniqueId", walletUniqueId);
			
			httpRequest.header("Content-Type", "application/json");
			httpRequest.header("Authorization", "Bearer " + login_token);

			httpRequest.body(requestParamsWP.toJSONString());

			Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v1/topup/initial");
			String responseBody = response.getBody().asString();
			System.out.println(responseBody);
			JsonPath extractor = response.jsonPath();
			responseCode = extractor.getString("responseCode");	
		}
}

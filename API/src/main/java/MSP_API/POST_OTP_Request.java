package MSP_API;

import org.json.simple.JSONObject;
import org.testng.annotations.Test;

import Common.Auth_token;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class POST_OTP_Request extends Auth_token
{
	public static String otpPrefix;
	//@Test
	public static void request_OTP()
	{
		

		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";

		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		requestParams.put("companyId", "008");
		requestParams.put("deviceId", "3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2");
		requestParams.put("email", "user00812@gmail.com");
		requestParams.put("mobileCountryCode", "95");
		//requestParams.put("mobileNo", "09"+number);
		requestParams.put("mobileNo", mno);
		requestParams.put("requestBy", "1");
		requestParams.put("", "1");

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v2/OTP/Request");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);

		
		JsonPath extractor = response.jsonPath(); otpPrefix = extractor.get("otpPrefix");
	   // System.out.println("OTP Prefix"+otpPrefix);
		

	}
}

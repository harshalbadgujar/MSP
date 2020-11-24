package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class SET_Passcode extends POST_OTP
{
	public static void set_Passcode()
	{
		
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		//https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT

		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		requestParams.put("companyId", "008");
		requestParams.put("deviceId", "3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2");
		requestParams.put("email", "");
				
		requestParams.put("mobileCountryCode", "09");
		//requestParams.put("mobileNo", "09"+number);
		requestParams.put("mobileNo", mno);
		requestParams.put("passcode", "111111");
		requestParams.put("requestBy", "1");
		

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.PUT, "/UAT/AppController/v1/gip/api/v2/passcode");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);

		
		

	}
}

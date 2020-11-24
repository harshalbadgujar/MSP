package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;


public class POST_Register_Passport extends POST_OTP
{
	public static void register_Passport()
	{
		
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		//https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com/UAT

		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		requestParams.put("companyId", "008");
		//requestParams.put("deviceId", "3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2");
		requestParams.put("email", "");
		requestParams.put("firstNameEng", "iDev Tester");
		requestParams.put("firstNameLocal", "iDev Tester");
		requestParams.put("idNumber",number);
		requestParams.put("languageCode", "EN");		
		requestParams.put("mobileCountryCode", "09");
		//requestParams.put("mobileNo", "09"+number);
		requestParams.put("mobileNo", mno);
		
		requestParams.put("nationalityId", "7");
		requestParams.put("otpVerificationId", otpVerificationId);
		
		requestParams.put("registerChannelId", "1");
		requestParams.put("typeOfId", "3");
					

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/customer/registration");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);

		
		/*
		 * JsonPath extractor = response.jsonPath(); otpPrefix =
		 * extractor.get("otpPrefix"); System.out.println(otpPrefix);
		 */
		 
	}
}

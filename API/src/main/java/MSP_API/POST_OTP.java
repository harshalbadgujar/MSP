package MSP_API;

import org.json.simple.JSONObject;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class POST_OTP extends Common.Connect_mssql
{
	public static String otpVerificationId;
	public static void otp ()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";

		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		requestParams.put("companyId", "008");
		//requestParams.put("deviceId", "3C4FB659BF1F8CFD-584A-42A4-A8F9-D524A7C6C3A2");
		requestParams.put("email", "user0050128@gmail.com");
		requestParams.put("mobileCountryCode", "95");
		requestParams.put("mobileNo", mno);
		//requestParams.put("otp", );
		requestParams.put("otp",Otp_DB);
		requestParams.put("otpPrefix", otpPrefix);
		requestParams.put("requestBy", "1");
		
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v2/OTP");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		System.out.println("Otp");

		
		
		JsonPath extractor = response.jsonPath();
		otpVerificationId =	extractor.get("otpVerificationId"); System.out.println(otpVerificationId);
		//System.out.println("Otp verification ID : "+otpVerificationId);
		
		 
	
	}
}

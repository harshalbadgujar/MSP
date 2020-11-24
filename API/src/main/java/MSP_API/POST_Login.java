
package MSP_API;

import static org.testng.Assert.assertEquals;

import org.json.simple.JSONObject;

import Common.Connect_mssql;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class POST_Login extends SET_Passcode
{
	//public static int walletUniqueId;
	public static int customer_ID;
	public static String login_token ;
	public static void login()
	{
		
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		
		requestParams.put("deviceId", "9781B7A7-4286-4E5E-890C-6E67C613F5A0");
		requestParams.put("deviceOS", "ios");
		requestParams.put("deviceToken", "100bafbb2fb0a1e910e4799a6ddb3a66b1cc6dc6bb6fb38201d34696e61fd63b");
		requestParams.put("email", "");
		requestParams.put("mobileCountryCode","95");
		//requestParams.put("mobileNo", mno);
		requestParams.put("mobileNo",mobile_No);
		requestParams.put("passcode", "111111");
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/customer/login");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		 JsonPath extractor = response.jsonPath();
		 walletUniqueId = extractor.get("walletUniqueId");
		 customer_ID = extractor.getInt("customerId");
		 responseCode = extractor.getString("responseCode");

		  login_token = extractor.get("token");
		  responseCode = extractor.getString("responseCode");
		  walletUniqueId = extractor.getInt("walletUniqueId");
		  customerId = extractor.getInt("customerId");
		  walletTypeId = extractor.getInt("walletTypeId");
		  walletType = extractor.getString("walletType");		  
		  System.out.println("WalletUnique code: "+walletUniqueId+"\n"+"Customer ID :"+customerId+"\n"+"Wallet type id: "+walletTypeId+"\n"+"Wallet type: "+walletType);
		
	}
}

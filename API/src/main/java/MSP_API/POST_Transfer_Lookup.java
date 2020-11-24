package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class POST_Transfer_Lookup extends POST_Transfer
{
	public static void transfer_LookUp()
	{
RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();

		JSONObject requestParams = new JSONObject();
		
		requestParams.put("amount","50");
		requestParams.put("companyId", "008");
		requestParams.put("currencyCode", "MMK");
		
		requestParams.put("receiverMobile", "0920112233");
		requestParams.put("receiverMobileCode", "95");
		requestParams.put("senderMobile", "0920445566");
		requestParams.put("senderMobileCode", "95");
		requestParams.put("transferTypeId", 1);
		requestParams.put("walletUniqueId", 61970);
		
		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);

		httpRequest.body(requestParams.toJSONString());

		Response response = httpRequest.request(Method.POST, "/UAT/AppController/v1/gip/api/v2/transfer/lookup");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
}

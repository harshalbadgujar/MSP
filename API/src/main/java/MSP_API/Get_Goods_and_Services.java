package MSP_API;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Get_Goods_and_Services extends GET_Donate_List
{
	public static void get_Merchant_Category()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();		

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");		

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/merchatscategories");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);	
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
	
	public static void get_Merchant_By_Id()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		
		RequestSpecification httpRequest = RestAssured.given();		

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");	

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/merchants?categoryId=1");
		String responseBody1 = response.getBody().asString();
		System.out.println(responseBody1);	
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
}

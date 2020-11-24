package MSP_API;


import java.util.*;
import org.json.simple.JSONObject;
import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class MSEC_Chart extends Get_Goods_and_Services {
	public static String responseBody;
    public static int i;
    public static String ID;
	public static void GET_Meters() 
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";

		RequestSpecification httpRequest = RestAssured.given();
		// JSONObject requestParams = new JSONObject();

		httpRequest.header("Content-Type", "application/json");
		httpRequest.header("Authorization", "Bearer " + login_token);
		httpRequest.header("Accept-Language", "en-US");

		Response response = httpRequest.request(Method.GET, "/UAT/AppController/v1/Partner/Meters/Search");
		String responseBody = response.getBody().asString();
		System.out.println(responseBody);

		// Extract id value from response
		Map<String, String> get_meter = response.jsonPath().getMap("meters[0]");
	   ID = String.valueOf(get_meter.get("id"));
		//System.out.println("output interger" + " " + ID);
		int i = Integer.parseInt(ID);
		System.out.println("output interger" + " " + i);
		
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}

	
	  public static void GET_monthly_details() 
	  { 
		  RestAssured.baseURI ="https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	 
	  RequestSpecification httpRequest = RestAssured.given();
	  
	  httpRequest.header("Content-Type", "application/json");
	  httpRequest.header("Authorization", "Bearer " + login_token);
	  httpRequest.header("Accept-Language", "en-US");
	  
	  Response response = httpRequest.request(Method.GET,"/UAT/AppController/v1/Partner/Meters/"+""+ID+"/MonthlyUsage"); 
	  String responseBody = response.getBody().asString(); 
	  System.out.println(responseBody);
	  
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");

	  } 
	  public static void PATCH_Update_NickName()
	  {
		  RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	  
	  RequestSpecification httpRequest = RestAssured.given();
	  
	  JSONObject requestParams = new JSONObject();
	  requestParams.put("nickname","Condo21");
	  
	  httpRequest.header("Content-Type", "application/json");
	  httpRequest.header("Authorization", "Bearer " + login_token);
	  httpRequest.header("Accept-Language", "en-US");
	  httpRequest.body(requestParams.toJSONString());
	  
	  Response response = httpRequest.request(Method.PATCH,"/UAT/AppController/v1/Partner/Meters/"+""+ID+"/nickname"); 
	  String responseBody =response.getBody().asString();
	  System.out.println(responseBody);
	  
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	  
	  }
	
}

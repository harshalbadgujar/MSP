package MSP_API;

import java.util.Map;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Customer extends User
{
	public static int i;
	public static int addressId;
	
	// Getting Address list
	public static void get_Address_List()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
		  
		  RequestSpecification httpRequest = RestAssured.given();
		  		  
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
				  
		  Response response = httpRequest.request(Method.GET,"/UAT/AppController/v1/customer/addresses"); 
		  String responseBody =response.getBody().asString();
		  System.out.println(responseBody);
		  
		  Map<String, String> get_meter = response.jsonPath().getMap("addresses[0]");
		  String addressID = String.valueOf(get_meter.get("addressId"));
		  i = Integer.parseInt(addressID);
		  
			 JsonPath extractor = response.jsonPath();
			 responseCode = extractor.getString("responseCode");
	}
	
	// getting address details using address ID
	public static void get_Address_Details()
	{			
	  RequestSpecification httpRequest = RestAssured.given();
	  		  
	  httpRequest.header("Content-Type", "application/json");
	  httpRequest.header("Authorization", "Bearer " + login_token);
	  httpRequest.header("Accept-Language", "en-US");
			  
	  Response response = httpRequest.request(Method.GET,"/UAT/AppController/v1/customer/address/"+""+i); 
	  String responseBody =response.getBody().asString();
	  System.out.println(responseBody);
	  
		 JsonPath extractor = response.jsonPath();
		 responseCode = extractor.getString("responseCode");
	}
	
	// Adding new address in address list
	public static void add_Address()
	{
	  RequestSpecification httpRequest = RestAssured.given();
	  
	  JSONObject requestParams = new JSONObject();
	  requestParams.put("name","Condo1");
	  requestParams.put("mobileNumber",mobile_No );
	  requestParams.put("address","xxx");
	  requestParams.put("city","BKK");
	  requestParams.put("isPrimary",true);
	  
	  httpRequest.header("Content-Type", "application/json");
	  httpRequest.header("Authorization", "Bearer " + login_token);
	  httpRequest.header("Accept-Language", "en-US");
	  httpRequest.body(requestParams.toJSONString());
	  
	  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/customer/address"); 
	  String responseBody =response.getBody().asString();
	  System.out.println(responseBody);

	  JsonPath extractor = response.jsonPath(); 
	  addressId = extractor.get("addressId");
	  System.out.println(addressId);
      responseCode = extractor.getString("responseCode");
	}
	
	// Setting any one address as primary address using address id
	public static void set_Address_Primary()
	{
		 RequestSpecification httpRequest = RestAssured.given();
		 
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
				  
		  Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/customer/address/primary/"+""+addressId); 
		  String responseBody =response.getBody().asString();
		  System.out.println(responseBody);
		  JsonPath extractor = response.jsonPath();
		  responseCode = extractor.getString("responseCode");
	}
	
	// Updating address details using address id
	public static void update_Address_Details()
	  {
	 RequestSpecification httpRequest = RestAssured.given();
	  
	  JSONObject requestParams = new JSONObject();
	  requestParams.put("addressId",addressId);
	  requestParams.put("name","AD1 UATTT123" );
	  requestParams.put("mobileNumber",mobile_No);
	  requestParams.put("address","EDIT XXX  SSS");
	  requestParams.put("city","BKK"); requestParams.put("isPrimary",true);
	  
	  httpRequest.header("Content-Type", "application/json");
	  httpRequest.header("Authorization", "Bearer " + login_token);
	  httpRequest.header("Accept-Language", "en-US");
	  httpRequest.body(requestParams.toJSONString());
	  
	  Response response = httpRequest.request(Method.PUT,"/UAT/AppController/v1/customer/address/");
	  String responseBody =response.getBody().asString();
	  System.out.println(responseBody); }
	 
	// Deleting address using an address id
	public static void delete_Address()
	{
		  RequestSpecification httpRequest = RestAssured.given();
  		  
		  httpRequest.header("Content-Type", "application/json");
		  httpRequest.header("Authorization", "Bearer " + login_token);
		  httpRequest.header("Accept-Language", "en-US");
				  
		  Response response = httpRequest.request(Method.DELETE,"/UAT/AppController/v1/customer/address/"+""+addressId); 
		  String responseBody =response.getBody().asString();
		  System.out.println(responseBody);
		  JsonPath extractor = response.jsonPath();
		  responseCode = extractor.getString("responseCode");
		}
	
}

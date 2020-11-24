package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Movies_Confirm extends Movies_Enquiry
{
	// Confirm request of movies > canal plus biller
	public static void confirm_Canal_Plus()
	{
		//RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "CanalPlus");
        requestParams.put("enquiryRequestId", canaPlus_RequestID);
        requestParams.put("transactionAmount", "4900");
        requestParams.put("detail", "{'Type':'PackageChange','Process':'VerifyRenewalOffer','CardNumber':'014502763789','IdBase':'Myandev','SubscriberNumber':'2352351','ContractNumber':'1','Package':'RACCT19|RACCT19','Duration':'1','SessionID':'a3abcb46828cff79b151fa50193684fedfbef44d53','Amount':'4900.00000'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	// Confirm request of movies > Vivu biller
	public static void confirm_Vivu()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "Viu");
	    requestParams.put("enquiryRequestId", vivu_RequestID);
	    requestParams.put("transactionAmount", "1500");
	    requestParams.put("detail", "{'Deno':'1500','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	// Confirm request of movies > Mahar biller
	public static void confirm_Mahar()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "Mahar");
	    requestParams.put("enquiryRequestId", mahar_RequestID);
	    requestParams.put("transactionAmount", "1999");
	    requestParams.put("detail", "{'Deno':'1999','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Confirm request of movies > Lalakyi biller
	public static void confirm_Lalakyi()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "LaLaKyi");
	    requestParams.put("enquiryRequestId", lalakyi_RequestID);
	    requestParams.put("transactionAmount", "505");
	    requestParams.put("detail", "{'Deno':'500','MobileNumber':'09421133241'}");
	    
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Confirm"); 
	    String responseBody =response.getBody().asString();
		System.out.println(responseBody);
		
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

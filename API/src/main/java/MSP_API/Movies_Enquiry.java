package MSP_API;

import org.json.simple.JSONObject;

import io.restassured.RestAssured;
import io.restassured.http.Method;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Movies_Enquiry extends Internet_Confirm
{
	public static String canaPlus_RequestID;
	public static String vivu_RequestID;
	public static String mahar_RequestID;
	public static String lalakyi_RequestID;
	
	// Requset to enquiry for Movies > Canal plus biller
	public static void enq_Canal_Plus()
	{
		RestAssured.baseURI = "https://fmm27xh7a6.execute-api.ap-southeast-1.amazonaws.com";
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "CanalPlus");
	    requestParams.put("detail", "{'Type':'PackageChange','Process':'VerifyRenewalOffer','CardNumber':'014502763789','IdBase':'Myandev','SubscriberNumber':'2352351','ContractNumber':'1','Package':'RACCT19|RACCT19','Duration':'1','SessionID':'a3abcb46828cff79b151fa50193684fedfbef44d53'}");
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of CanalPlus: " + response.body().asString());
        canaPlus_RequestID = response.jsonPath().get("requestUid");
        System.out.println(canaPlus_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Requset to enquiry for Movies > Vivu biller
	
	public static void enq_Vivu()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
        requestParams.put("billerCode", "Viu");
        requestParams.put("detail", "{'Deno':'1500','MobileNumber':''}");
        
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of Vivu: " + response.body().asString());
        vivu_RequestID = response.jsonPath().get("requestUid");
        System.out.println(vivu_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Requset to enquiry for Movies > Mahar biller
	public static void enq_Mahar()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "Mahar");
	    requestParams.put("detail", "{'Deno':'1999','MobileNumber':'09421133241'}");
        
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of Mahar: " + response.body().asString());
        mahar_RequestID = response.jsonPath().get("requestUid");
        System.out.println(mahar_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
	
	// Requset to enquiry for Movies > lalakyi biller
	public static void enq_lalakyi()
	{
	    RequestSpecification httpRequest = RestAssured.given();
	    
	    JSONObject requestParams = new JSONObject();
	    requestParams.put("billerCode", "LaLaKyi");
	    requestParams.put("detail", "{'Deno':'500','MobileNumber':'09421133241'}");
        
	    httpRequest.header("Content-Type", "application/json");
	    httpRequest.header("Authorization", login_token);
	    httpRequest.body(requestParams.toJSONString());
	    Response response = httpRequest.request(Method.POST,"/UAT/AppController/v1/Partner/Enquiry"); 
        System.out.println("Response body of Mahar: " + response.body().asString());
        lalakyi_RequestID = response.jsonPath().get("requestUid");
        System.out.println(lalakyi_RequestID);
	    
		JsonPath extractor = response.jsonPath();
		responseCode = extractor.getString("responseCode");
	}
}

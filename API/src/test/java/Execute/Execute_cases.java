package Execute;

import java.io.IOException;

import org.testng.Assert;
import org.testng.annotations.Test;

import Common.Auth_token;
import Common.Connect_mssql;
import Common.Connection_Mysql;
import Common.Test_Base;
import MSP_API.Customer;
import MSP_API.Eload_DataPack_Confirm;
import MSP_API.Eload_Datapack_Enquiry;
import MSP_API.Eload_Deno_Confirm;
import MSP_API.Eload_Deno_Enquiry;
import MSP_API.GET_Donate_List;
import MSP_API.GET_Marketing_Messages_List;
import MSP_API.GET_Message_Details;
import MSP_API.GET_Unread_Count_Messsage;
import MSP_API.Get_Goods_and_Services;
import MSP_API.Gifts_Confirm;
import MSP_API.Gifts_Enquiry;
import MSP_API.Internet;
import MSP_API.Internet_Confirm;
import MSP_API.Internet_Enquiry;
import MSP_API.MSEC_Bills;
import MSP_API.MSEC_Chart;
import MSP_API.Movies_Confirm;
import MSP_API.Movies_Enquiry;
import MSP_API.POST_Login;
import MSP_API.POST_Transfer;
import MSP_API.POST_Transfer_Lookup;
import MSP_API.RTP;
import MSP_API.Reload;
import MSP_API.User;

public class Execute_cases extends Test_Base
{

	
	  @Test(priority = 1) public void generated_Random_MNO() 
	  {
		  System.out.println("========================================Generated MNO=========================================="); 
		  logger = extent.startTest("Generated number");
		//Mobile_Number.generate_MNO();
	  }
	  
	  
	  @Test(priority = 2) public void Authentication()
	  { 
		  logger = extent.startTest("Generated xAuth");
		  Auth_token.xAuth(); 
	  }
	  
	  @Test (priority = 3) public void POST_OTP_Request() throws IOException
	  {
	  System.out.println("========================================Request OTP==========================================");
	  logger = extent.startTest("Request to OTP");
	  // MSP_API.POST_OTP_Request.request_OTP(); 
	  }
	  
	  @Test (priority = 4) public void DB() throws IOException
	  {
	  System.out.println("========================================Database==========================================");
	  logger = extent.startTest("Connected to database");
	  // Connect_mssql cs = new Connect_mssql(); //cs.DB_Connection();
	  }
	  
	  @Test(priority = 5) public void POST_OTP() throws IOException 
	  {
	  System.out.println("========================================OTP=========================================="); 
	  logger = extent.startTest("Generated OTP");
	  //MSP_API.POST_OTP.otp(); 
	  }
	  
	  @Test (priority = 6) public void reg_Passport() throws IOException 
	  {
	  System.out.println("========================================Registered with passport==========================================");
	  logger = extent.startTest("register user with valid passport");
	  //POST_Register_Passport.register_Passport(); 
	  }
	  
	  @Test (priority = 7) public void set_Pass() throws IOException
	  { 
		  System.out.println("========================================Set Passcode==========================================");
		  logger = extent.startTest("Set passcode with registered user");
	  //SET_Passcode.set_Passcode();
	  }
	   	 
	  @Test (priority = 8) public void login() throws IOException
	  {
	  System.out.println("========================================login==========================================" );
	  logger = extent.startTest("Login with valid user");
	  POST_Login.login();
	  Assert.assertEquals(responseCode,"000");
	  Assert.assertEquals(walletUniqueId,62120);
	//  Assert.assertEquals(customerId,187763);
	  Assert.assertEquals(walletTypeId,1);
	  Assert.assertEquals(walletType,"Customer");	 
	  }
	  
	  @Test (priority = 9) public void reload_123() throws IOException
	  {
	  System.out.println("========================================Reload 123=======================================");
	  logger = extent.startTest("Reload with 123");
	  Reload.reload_123();
	  Assert.assertEquals(responseCode,"000");
	  Assert.assertEquals(feeAmount,Reload.reload_feeAmount);
	  Assert.assertEquals(transactionId,Reload.reload_transactionId);
	  }	  
		
		  @Test (priority = 10) public void reload_MPU() throws IOException 
		  {
		  System.out.println("========================================Reload MPU=========================================="); 
		  logger = extent.startTest("Reload with MPU");
		  Reload.reload_123(); 
		  Assert.assertEquals(responseCode,"000"); 
		  }
		  
		  @Test (priority = 11) public void reload_Wavepay() throws IOException 
		  {
		  System.out.println("========================================Reload Wavepay=========================================="); 
		  logger = extent.startTest("Reload with wavepay");
		  Reload.reload_123();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 12) public void get_Marketing_msg_List() throws IOException
		  { 
			  System.out.println("========================================Marketing msg list=========================================="); 
			  logger = extent.startTest("Marketing messages list");
			  GET_Marketing_Messages_List.get_Marketing_msg_List();
			  Assert.assertEquals(responseCode,"000"); 
		  }
		  
		  @Test (priority = 13) public void get_MSG_Detail() throws IOException
		  {
		  System.out.println("========================================Marketing msg details=========================================="); 
		  logger = extent.startTest("Marketing messages details");
		  GET_Message_Details.get_MSG_Details();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 14) public void get_Unread_MSG_Count() throws IOException 
		  {
		  System.out.println("========================================Unread Marketing msg Count==========================================");
		  logger = extent.startTest("Unread Marketing messages count");
		  GET_Unread_Count_Messsage.get_Unread_msg_Cnt();
		  Assert.assertEquals(responseCode,"000"); 
		  }
		  
		  @Test (priority = 15) public void transfer() throws IOException
		  {
		  System.out.println("========================================Transfer==========================================" );
		  logger = extent.startTest("Transfer with valid amount and number");
		  POST_Transfer.transfer();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 16) public void transfer_Lookup() throws IOException
		  {
		  System.out.println("========================================Transfer Look Up==========================================" );
		  logger = extent.startTest("Transfer look up with valid amount");
		  POST_Transfer_Lookup.transfer_LookUp();
		  Assert.assertEquals(responseCode,"000");
		  }		  
		 
		  @Test (priority = 17) public void donate_List() throws IOException
		  {
		  System.out.println("========================================Donate List==========================================" );
		  logger = extent.startTest("Donate amount with valid details");
		  GET_Donate_List.donate_List();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 18) public void goods_Merchant_Category() throws IOException
		  {
		  System.out.println("========================================Merchant Category==========================================" );
		  logger = extent.startTest("Merchant category");
		  Get_Goods_and_Services.get_Merchant_Category();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 19) public void goods_By_Merchant_ID() throws IOException
		  {
		  System.out.println("========================================Merchant by Category ID==========================================" );
		  logger = extent.startTest("Merchant category ID with valid details");
		  Get_Goods_and_Services.get_Merchant_By_Id();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 20) public void get_Meters() throws IOException
		  {
		  System.out.println("========================================Get Meters==========================================" );
		  logger = extent.startTest("Get meters with valid details");
		  MSEC_Chart.GET_Meters();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 21) public void get_Monthly_details() throws IOException
		  {
		  System.out.println("========================================Get Monthly details==========================================" );
		  logger = extent.startTest("Get monthly details with valid details");
		  MSEC_Chart.GET_monthly_details();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 22) public void patch_Update_Nickname()throws IOException
		  {
		  System.out.println("========================================Update NickName==========================================" );
		  logger = extent.startTest("Update nickname with valid details");
		  MSEC_Chart.PATCH_Update_NickName();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 23) public void get_MSEC_District()throws IOException
		  {
		  System.out.println("========================================MSEC District==========================================" );
		  logger = extent.startTest("Get MSEC district");
		  MSEC_Bills.GET_MSEC_District();
		  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 24) public void inquiry()throws IOException
		  {
		  System.out.println("========================================MSEC Inquiry==========================================" );
		  logger = extent.startTest("MSEC inquiry with vallid biller");
		  MSEC_Bills mb = new MSEC_Bills();
		  //Assert.assertEquals(responseCode,"000");		  
		  }  
	 
		  @Test (priority = 25) public void user_Details()throws IOException
		  {
		  System.out.println("========================================User Details==========================================" );
		  logger = extent.startTest("Get user details with valid user");
		  User.user_Details();	  
		  Assert.assertEquals(responseCode,"000");
		  }  
		  
		  @Test (priority = 26) public void txn_search_History()throws IOException
		  {
		  System.out.println("========================================Txn search history==========================================" );
		  logger = extent.startTest("Transaction history");
		   User.txn_Search_History();
		   Assert.assertEquals(responseCode,"000");
		  }  
		  
		  @Test (priority = 27) public void get_Greeting_Message()throws IOException
		  {
		  System.out.println("========================================Get greeting message==========================================" );
		   User.get_Greeting_Message();
		   Assert.assertEquals(responseCode,"000");
		  }  
		  
		  @Test (priority = 28) public void user_Donate_List()throws IOException
		  {
		  System.out.println("========================================User donate list==========================================" );
		   User.user_Donate_list();
		   Assert.assertEquals(responseCode,"000");
		  }  
		  
		  @Test (priority = 29) public void get_Internet_list()throws IOException
		  {
		  System.out.println("========================================get Internet list==========================================" );
		   Internet.get_Internet_List();
		   Assert.assertEquals(responseCode,"000");
		  }  
		  
		  @Test (priority = 30) public void enquiry_Fees()throws IOException
		  {
		  System.out.println("========================================Internet enquiry_Fees==========================================" );
		   Internet.enquiry_Fees();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 31) public void get_Address_List()throws IOException
		  {
		  System.out.println("========================================Customer > get address list==========================================" );
		   Customer.get_Address_List();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 32) public void get_Address_Detail()throws IOException
		  {
		  System.out.println("========================================Customer > get address Details==========================================" );
		   Customer.get_Address_Details();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 33) public void add_Address()throws IOException
		  {
		  System.out.println("========================================Add address==========================================" );
		   Customer.add_Address();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 34) public void set_Primary_Address()throws IOException
		  {
		  System.out.println("========================================Set primary address==========================================" );
		   Customer.set_Address_Primary();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 35) public void update_Address()throws IOException
		  {
		  System.out.println("========================================Update address==========================================" );
		   Customer.update_Address_Details();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
		  @Test (priority = 36) public void delete_Address()throws IOException
		  {
		  System.out.println("========================================Delete address==========================================" );
		   Customer.delete_Address();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 37) public void enq_HiWiFi()throws IOException
		  {
		  System.out.println("========================================Internet Enquiry HiWiFi==========================================" );
		   Internet_Enquiry.enq_HiWifi();
		   Assert.assertEquals(responseCode,"000");
		  } 	  

		  @Test (priority = 38) public void confirm_HiWiFi()throws IOException
		  {
		  System.out.println("========================================Confirm Internet HiWiFi==========================================" );
		  Internet_Confirm.confirm_HiWifi();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 39) public void enq_TelenorDataPack()throws IOException
		  {
		  System.out.println("========================================Enquiry Telenor datapack==========================================" );
		  Internet_Enquiry.enq_TelenorDataPack();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 40) public void enq_HIWIFI_W0_Mobile()throws IOException
		  {
		  System.out.println("========================================Enquiry Internet HiWiFi wo mobile==========================================" );
		  Internet_Enquiry.enq_HIWIFI_W0_Mobile();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 41) public void enq_MyanmarNetPrepaid()throws IOException
		  {
		  System.out.println("========================================Enquiry Internet MyanmarNet Prepaid==========================================" );
		  Internet_Enquiry.enq_MyanmarNetPrepaid();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 42) public void enq_telenor_Fiber()throws IOException
		  {
		  System.out.println("========================================Enquiry Internet Telenor fiber==========================================" );
		  Internet_Enquiry.enq_telenor_Fiber();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 43) public void enq_telenor_Wireless()throws IOException
		  {
		  System.out.println("========================================Enquiry Internet Telenor wireless==========================================" );
		  Internet_Enquiry.enq_Telenor_Wireless();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 44) public void enq_MyanmarNetAWaThone()throws IOException
		  {
		  System.out.println("========================================Enquiry Internet MyanmarNetAWaThone==========================================" );
		  Internet_Enquiry.enq_MyanmarNetAWaThone();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 45) public void confirm_TeleData()throws IOException
		  {
		  System.out.println("========================================Confirm Tele data pack==========================================" );
		  Internet_Confirm.confirm_Tele_DaraPack();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 46) public void confirm_HiWiFi_mobile()throws IOException
		  {
		  System.out.println("========================================Internet Confirm HiWiFi mobile==========================================" );
		   Internet_Confirm.confirm_HiWiFi_Mobile();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 47) public void confirm_MyanmarNetPrepaid()throws IOException
		  {
		  System.out.println("========================================Internet Confirm MyanmarNet prepaid==========================================" );
		   Internet_Confirm.confirm_MyanmarNetPrepaid();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 48) public void confirm_Telenor_Fiber()throws IOException
		  {
		  System.out.println("========================================Internet Confirm Telenor fiber==========================================" );
		   Internet_Confirm.confirm_Telenor_Fiber();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 49) public void confirm_Telenor_Wireless()throws IOException
		  {
		  System.out.println("========================================Internet Confirm Telenor wireless==========================================" );
		   Internet_Confirm.confirm_Telenor_Wireless();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 50) public void confirm_MyanmarNetAWaThone()throws IOException
		  {
		  System.out.println("========================================Internet Confirm TMyanmarNet AWA Thone==========================================" );
		   Internet_Confirm.confirm_MyanmarNetAWaThone();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 51) public void movies_enq_CanalPlus()throws IOException
		  {
		  System.out.println("========================================Movies Enquiry canal plus==========================================" );
		   Movies_Enquiry.enq_Canal_Plus();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 52) public void movies_Confirm_CanalPlus()throws IOException
		  {
		  System.out.println("========================================Movies Confirm canal plus==========================================" );
		   Movies_Confirm.confirm_Canal_Plus();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 53) public void movies_enq_vivu()throws IOException
		  {
		  System.out.println("========================================Movies Enquiry Vivu==========================================" );
		   Movies_Enquiry.enq_Vivu();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 54) public void movies_Confirm_Vivu()throws IOException
		  {
		  System.out.println("========================================Movies Confirm Vivu==========================================" );
		   Movies_Confirm.confirm_Vivu();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 55) public void movies_enq_mahar()throws IOException
		  {
		  System.out.println("========================================Movies Enquiry mahar==========================================" );
		   Movies_Enquiry.enq_Mahar();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 56) public void movies_Confirm_mahar()throws IOException
		  {
		  System.out.println("========================================Movies Confirm Mahar==========================================" );
		   Movies_Confirm.confirm_Mahar();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 57) public void movies_enq_Lalakyi()throws IOException
		  {
		  System.out.println("========================================Movies Enquiry lalakyi==========================================" );
		   Movies_Enquiry.enq_lalakyi();
		   Assert.assertEquals(responseCode,"000");
		  } 
		  
		  @Test (priority = 58) public void movies_Confirm_lalakyi()throws IOException
		  {
		  System.out.println("========================================Movies Confirm lalakyi==========================================" );
		   Movies_Confirm.confirm_Lalakyi();
		   Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 59) public void eload_enq_MPTeLoad()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry MPTeLoad==========================================" );
		   Eload_Deno_Enquiry.enq_MPTeLoad();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 60) public void eLoad_Confirm_MPTeLoad()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm MPTeLoad==========================================");
			  Eload_Deno_Confirm.confirm_MPTeLoad();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 61) public void eload_enq_telenor_eload()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry Telenor eload==========================================" );
		   Eload_Deno_Enquiry.enq_TelenoreLoad();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 62) public void eLoad_Confirm_telenor_eload()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm Telenor eload==========================================");
			  Eload_Deno_Confirm.confirm_telenor_eload();
			  Assert.assertEquals(responseCode,"000");
		  }
			 
		  @Test (priority = 63) public void eload_enq_TeleDataPack()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry TeleDataPack==========================================" );
		   Eload_Datapack_Enquiry.enq_TelenorDataPack();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 64) public void eLoad_Confirm_TeleDataPack()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm TeleDataPack==========================================");
			  Eload_DataPack_Confirm.confirm_TelenorDataPack();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 65) public void eload_enq_MPTDataPack()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry MPTDataPack==========================================" );
		   Eload_Datapack_Enquiry.enq_MPTDataPack();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 66) public void eLoad_Confirm_MPTDataPack()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm MPTDataPack==========================================");
			  Eload_DataPack_Confirm.confirm_MPTDataPack();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 67) public void eload_enq_OoredooDataPack()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry OoredooDataPack==========================================" );
		   Eload_Datapack_Enquiry.enq_OoredooDataPack();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 68) public void eLoad_Confirm_OoredooDataPack()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm OoredooDataPack==========================================");
			  Eload_DataPack_Confirm.confirm_OoredooDataPack();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 69) public void eload_enq_MyTelDataPack()throws IOException
		  {
		  System.out.println("========================================Eload Enquiry MyTelDataPack==========================================" );
		   Eload_Datapack_Enquiry.enq_MyTelDataPack();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 70) public void eLoad_Confirm_MyTelDataPack()throws IOException
		  { 
			  System.out.println("========================================Eload Confirm MyTelDataPack==========================================");
			  Eload_DataPack_Confirm.confirm_MyTelDataPack();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 71) public void enq_gifts_SWSGD()throws IOException
		  {
		  System.out.println("======================================== Enquiry Gifts SWSGD==========================================" );
		   Gifts_Enquiry.enq_SWSGD();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 72) public void confirm_gifts_SWSGD()throws IOException
		  { 
			  System.out.println("======================================== Confirm Gifts SWSGD==========================================");
			  Gifts_Confirm.confirm_SWSGD();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 73) public void enq_gifts_iTunes()throws IOException
		  {
		  System.out.println("======================================== Enquiry Gifts iTunes==========================================" );
		   Gifts_Enquiry.enq_ITunes();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 74) public void confirm_gifts_iTunes()throws IOException
		  { 
			  System.out.println("======================================== Confirm Gifts iTunes==========================================");
			  Gifts_Confirm.confirm_iTunes();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 75) public void enq_gifts_viberOut()throws IOException
		  {
		  System.out.println("======================================== Enquiry Gifts viberOut==========================================" );
		   Gifts_Enquiry.enq_viberout();
		   Assert.assertEquals(responseCode,"000");
		  } 	  
			
		  @Test (priority = 76) public void confirm_gifts_viberOut()throws IOException
		  { 
			  System.out.println("======================================== Confirm Gifts viberOut==========================================");
			  Gifts_Confirm.confirm_viberOut();
			  Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 77) public void reload_1234()throws IOException
		  { 
			  System.out.println("========================================Reload 123 Service==========================================");
			//  Reload.reload_123();
			//  Assert.assertEquals(responseCode,"000");
		  }

		 @Test (priority = 78) public void create_RTP()throws IOException
		  { 
			 System.out.println("========================================Create RTP==========================================");
			 RTP.create_RTP();
			 Assert.assertEquals(responseCode,"000");
		  }
		  
		  @Test (priority = 79) public void pay_RTP()throws IOException
		  { 
			 System.out.println("========================================Pay RTP==========================================");
			 RTP.pay_RTP();
			 Assert.assertEquals(responseCode,"000");
		  }
		 
		  @Test (priority = 80) public void my_Workbench()throws IOException
		  { 
			 System.out.println("========================================My sql workbench==========================================");
			 Connection_Mysql.conn();
			 //Assert.assertEquals(responseCode,"000");
		  }
}  

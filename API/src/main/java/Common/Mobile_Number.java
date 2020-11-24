package Common;

import java.util.Random;

public class Mobile_Number extends Test_Base
{
	public static String mno;
	public static int number;
	
	public static void generate_MNO()
	{
	
		//public static int number;
	
	{
	Random mobile = new Random();
	// generate mobile number 
	  number = mobile.nextInt(899999999) + 100000000;
	//System.out.print(number);
	mno = "09"+number;			
			
	System.out.println("09"+number);
	
	}
	}
}

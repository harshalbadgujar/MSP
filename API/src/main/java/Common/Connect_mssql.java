package Common;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import MSP_API.POST_OTP_Request;

public class Connect_mssql extends POST_OTP_Request 
{
	public static String Otp_DB;
	public static String prefix_DB;
	
	static ResultSet rs;
	// static ArrayList<String> data = new ArrayList<>();
	static Connection connection;

	public static void DB_Connection() {
		// long mno = 097777746;
		// BigInteger mno = new BigInteger("097777750");

		String connectionUrl = "jdbc:sqlserver://172.31.3.36;databaseName=GIP_UAT;user=qa_aloha;password=qa_aloha@12";

		ResultSet resultSet = null;

		try (Connection connection = DriverManager.getConnection(connectionUrl);
				Statement statement = connection.createStatement();) {

			// Create and execute a SELECT SQL statement.
			// String selectSql = "select * from dbo.OTP where MobileNo = '097777746' and
			// OTP_Prefix ="+"'"+otpPrefix+"'";

			String selectSql = "select * from dbo.OTP where MobileNo = " + "'" + mno + "' and OTP_Prefix  =" + "'"
					+ otpPrefix + "'";

			resultSet = statement.executeQuery(selectSql);

			// Print results from select statement
			{
				while (resultSet.next()) {
					System.out.println(resultSet.getString(5) + " " + resultSet.getString(6));

					Otp_DB = (resultSet.getString(6));
					prefix_DB = (resultSet.getString(5));

					// System.out.println("OTP++++=="+Otp_DB);
					// System.out.println(prefix_DB);

				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


}

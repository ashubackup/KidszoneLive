package datacollector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import api.Loaderr;
public class CheckUser 
{
	public static String checkUser(String ani)
	{
		System.out.println("ani in : " + ani);
		String res = null;
		
		try {
			
			PreparedStatement pstmt1 = Loaderr.newConnection.prepareStatement("Select * from tbl_subscription where ani='"+ani+"'");
			System.out.println("1111...");
			
			ResultSet resultSet1 = pstmt1.executeQuery();
			if(resultSet1.next())
			{
				String user = resultSet1.getString("ani");
				System.out.println("user exist..." + user);
				PreparedStatement pstmt2 = Loaderr.newConnection.prepareStatement("SELECT * FROM tbl_subscription WHERE ani='"+ani+"' AND DATE(nextBilledDate)>=DATE(CURDATE())"
						+ "");
				ResultSet resultSet2 = pstmt2.executeQuery();
				if(resultSet2.next())
				{
				
					res="Done";
				}
				else
				{
					
					//Billing Pending
					res="Billing_Pending";
				}
			}else
			{
				System.out.println("User Not Found!	");
				//User Not Exist
				res="Not_Found";
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		/*
		 * String result=null; try { PreparedStatement p1 = Loaderr.userconn.
		 * prepareStatement("select * from tbl_subscription where ani='"+ani+"' ");
		 * ResultSet r1 = p1.executeQuery(); if(r1.next()) {
		 * System.out.println("User Exist"); PreparedStatement p2 = Loaderr.userconn.
		 * prepareStatement("select * from tbl_subscription where ani='"
		 * +ani+"' and Date(NOW())<= Date(next_billed_date)"); ResultSet r2 =
		 * p2.executeQuery(); if(r2.next()) { System.out.println("Also Recharged");
		 * //Get User result="Done"; } else { System.out.println("Billing Pending");
		 * //Billing Pending result="Billing_Pending"; } } else {
		 * System.out.println("User Not Found..."); //User Not Exist result="Not_Found";
		 * }
		 * 
		 * }catch(Exception e) { e.printStackTrace(); }
		 */
		
		return res;
	}
}
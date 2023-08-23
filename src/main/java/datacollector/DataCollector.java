package datacollector;

import java.sql.*;
import java.util.*;

import org.json.*;

import api.*;
import dbconnection.DbConnection;
import model.*;
import net.sf.uadetector.*;
import net.sf.uadetector.service.UADetectorServiceFactory;

public class DataCollector {

	public static List<String> getMainCategorys() {
		
		
		List<String > list=new ArrayList<>();
		String query="select * from tbl_cat where status in('1')";
		ResultSet rs=getResultSet(query);
			try {
				while(rs.next())
				{
					list.add(rs.getString("category_name"));
				}
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
	return list;
	}

	public static ResultSet getVideosByCatname(String catname) {
		
		String query="select * from tbl_videos where category='"+catname+"'";
		
		return getResultSet(query);
			
	}

	private static ResultSet getResultSet(String query)
	{
		ResultSet rs=null;
	Connection con=Loaderr.conn;
		try {
			if(con==null) con=DbConnection.getDbConn();
			PreparedStatement ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		}catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return rs;
		
	}

	public static Map<String, String> getVideoById(String id) {
		
		Map<String , String > map=new LinkedHashMap<String, String>();
		String query="Select * from tbl_videos where videoid='"+id+"' and status='1'";
		ResultSet rs=getResultSet(query);
		try {
			if(rs.next())
			{
				map.put("name", rs.getString("name"));
				map.put("vurl", rs.getString("vurl"));
				map.put("category", rs.getString("category"));
				map.put("imgurl", rs.getString("imgurl"));
				map.put("url", rs.getString("url"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

	public static ResultSet getBannersUrl() {
		ResultSet rs=null;
		try {
			
			String query="select * from tbl_videos where banner_url='3' order by datetime desc";
			Statement st=Loaderr.conn.createStatement();
			rs=st.executeQuery(query);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return rs;
	}


	public static void insertUserDevice(String agent,String ani) {
		
		
		UserAgentStringParser parser= UADetectorServiceFactory.getResourceModuleParser();
			
			ReadableUserAgent ra=parser.parse(agent);
		  OperatingSystem os=ra.getOperatingSystem();
		  String device = os.getFamilyName().toUpperCase();
			
			try {
				
				String query="insert into tbl_user_device (ani,device) values('"+ani+"','"+device+"')";
				PreparedStatement ps=Loaderr.conn.prepareStatement(query);
				ps.executeUpdate();
				
			}catch(Exception e)
			{
				
				e.printStackTrace();
			}
		}
	
	public static String addActivity(Model param) {

		JSONObject jo = new JSONObject();
		try {

			String query = "insert into tbl_user_activity (ani,portal,time,status) values('" + param.getAni() + "','"
					+ param.getPortal() + "','"+param.getTime()+"','"+param.getStatus()+"')";
			
			PreparedStatement ps = Loaderr.conn.prepareStatement(query);
	

			System.out.println("User Activity ===> "+query);

			int status = ps.executeUpdate(); 	

			jo.put("status", status);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jo.toString();
	}

	public static ResultSet getGamesByCatname(String catname) {

  
	
	  String query="select * from tbl_games where status='1' ";
	  System.out.println(query);
		return getResultSet(query);
	}
	
	
 public static String  getGamebyId(String id) {
		
	 try {
		 String query="select gameurl from tbl_games where gameid='"+id+"'";
		 ResultSet rs=getResultSet(query);
		 rs.next();
		 return rs.getString(1);		
	} catch (Exception e) {
		System.out.println(e);
	}

	 return null;
	}
	
}

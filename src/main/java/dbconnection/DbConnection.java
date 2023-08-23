package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	public static Connection getDbConn() {
		Connection conn=null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=DriverManager.getConnection("jdbc:mysql://91.205.172.123:3306/kidszonewithgame?autoReconnect=true","root","gloadmin123");
//			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/kidszone?autoReconnect=true","root","gloadmin123");
			System.out.println("DB connect Connection "+conn);
		} catch (Exception e) {
			
			e.printStackTrace();
			
			}
		return conn;
	}
	
	public static Connection getUserCheckDbConn() {
		Connection conn=null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=DriverManager.getConnection("jdbc:mysql://91.205.172.123:3306/gameomania?autoReconnect=true","root","gloadmin123");
//			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gameomania?autoReconnect=true","root","gloadmin123");
			System.out.println("DB connect Connection "+conn);
		} catch (Exception e) {
			
			e.printStackTrace();
			
			}
		return conn;
	}
	
	public static Connection getPostgres()
	{
		Connection conn=null;
		
		try
		{
			Class.forName("org.postgresql.Driver");
			conn=DriverManager.getConnection("jdbc:postgresql://91.205.172.123:5432/ndoto_services?autoReconnect=true","postgres","Gloadmin@123");
			System.out.println("Postgres connected");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	
	//**************New Conneciton ********
	public static Connection getNewConnection()
	{
		Connection connection=null;
		System.out.println("new db is connected....");
		
		try
		{
			Class.forName("org.postgresql.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://5.189.166.187:3306/kidsportal?autoReconnect=true ","root","gloadmin123");
			System.out.println("Postgres connected");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return connection;
	}
	
}

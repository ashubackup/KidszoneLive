package api;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.DbConnection;

/**
 * Servlet implementation class Loaderr
 */
public class Loaderr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static Connection conn=null;
	public static Connection userconn=null;
	public static Connection newConnection = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loaderr() {
        super();
        // TODO Auto-generated constructor stub
    }
   @Override
public void init() throws ServletException {
	
	   conn=DbConnection.getDbConn();
	   userconn=DbConnection.getPostgres();
//	   userconn=DbConnection.getUserCheckDbConn();
	   
	   // new connection
	   newConnection =  DbConnection.getNewConnection();
	   
	super.init();
}

}

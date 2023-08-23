package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.jasper.tagplugins.jstl.core.Param;

import datacollector.DataCollector;
import model.Model;

/**
 * Servlet implementation class ApiServlet
 */
@WebServlet("/ApiServlet")
public class ApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Model param=new Model();
    public ApiServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out=response.getWriter();
		
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("1")){  //Add Activity
			
           param.setTime(request.getParameter("time"));
           param.setPortal(request.getParameter("portal"));
           param.setAni(request.getParameter("ani"));
           param.setStatus(request.getParameter("status"));
			
			DataCollector.addActivity(param);
			
		}
		else if(action.equalsIgnoreCase("2"))   //add Comment 
		{
			param=new Model();
			param.setAni(request.getParameter("ani"));
			param.setVid(request.getParameter("vid"));
			param.setMessage(request.getParameter("msg"));
			
			System.out.println("hello call it !" +param.getAni()+param.getVid()+param.getMessage());
			
			out.println("1");
		}	
	}
}
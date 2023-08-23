package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Message.Message;

import datacollector.CheckUser;

/**
 * Servlet implementation class LoginNDoto
 */
@WebServlet("/redirect")
public class LoginNDoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginNDoto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("control in loginNdoto...");
		
		HttpSession session = request.getSession();
		try
		{
			String ani = request.getParameter("msisdn");
			System.out.println("Entered id is "+ani);
			// 234 9805702978
			
			if(ani==null)
			{
				String empty="empty";
				request.setAttribute("empty", empty);
				request.getRequestDispatcher("landing.jsp").forward(request, response);
				return;
			}
			
			//234
			String substring = ani.substring(0, 3);
					
			String s2=null;
			
			if(substring.equals("234"))
			{
				//9805702978
				//s2 = ani.substring(3, ani.length());
				s2= ani;
				System.out.println("ani in if " + s2);
			}
			else if(ani.startsWith("0"))
			{
				
				//s2= ani.substring(1, ani.length());
				ani = ani.substring(1, ani.length());
				s2 = 234+ani;
				System.out.println("adding 234 ---" + s2);
				
				System.out.println(s2);
			}
			else
			{
				
				System.out.println("else block aniiiiii " + s2);
				s2= 234+ani;
				System.out.println("else block " + s2);
			}
			
			String result = CheckUser.checkUser(s2);
			
			System.out.println("result : " + result);

			if(result.equals("Done"))
			{
				session.setAttribute("user", s2);
				response.sendRedirect("index.jsp");
			}
			else if(result.equals("Not_Found"))
			{
				response.sendRedirect("https://promo.ydafrica.com/promo/kidzone?cli=-1");
			}
			else if(result.equals("Billing_Pending"))
			{
				Message m = new Message("Recharge Pending","alert-danger");
				request.setAttribute("m", m);
				request.getRequestDispatcher("landing.jsp").forward(request, response);
			}

		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
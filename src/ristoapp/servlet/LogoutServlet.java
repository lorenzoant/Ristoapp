package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/logoutservlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getSession().removeAttribute("RISTORANTELOGGATO");
		request.getSession().removeAttribute("CREDENZIALI");
		
		response.getWriter().append("<html><head><meta http-equiv='refresh' content='1;url=login.jsp'/></head><body>Logout eseguito...</body></html>");
		
		System.out.println("User logout");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

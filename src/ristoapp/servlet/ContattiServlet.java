package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.InvioEmail;
import ristoapp.bean.ClientiBean;

/**
 * Servlet implementation class ContattiServlet
 */
@WebServlet("/ContattiServlet")
public class ContattiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContattiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		System.out.println(whatsend);
		if(whatsend.equalsIgnoreCase("contattaci")) {
			try {
				ClientiBean cliente = new ClientiBean();
				
				String email = request.getParameter("email");
				String testo = request.getParameter("descrizione");
				System.out.println(email);
				System.out.println(testo);
				
				InvioEmail email1 = new InvioEmail();
				email1.contatti(email,testo);//invio l'email all'utente con il codice
				response.sendRedirect("contatti.jsp");
			}catch(Exception e) {
				System.out.println("errore");
				e.printStackTrace();
			}
			
			
		}
		else {
			response.sendRedirect("bacheca.jsp");
		}
	}

}

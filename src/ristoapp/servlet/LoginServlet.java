package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.db.SaveMySQL;
import ristoapp.bean.ClientiBean;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Login ok.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("invia")) {
			//cliccando il bottone invia del form login
			
			//lettura campi da request
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//salvataggio dei valori nel Bean
			ClientiBean cliente = new ClientiBean();
			
			cliente.setEmail(email);
			cliente.setPassHash(password);
			
			//il Bean deve essere salvato in sessione
			//request.getSession().removeAttribute("CREDENZIALI");
			//request.getSession().setAttribute("CREDENZIALI", cliente);
			
			//cliente = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			SaveMySQL verifica = new SaveMySQL();
			
			try {
				ClientiBean id = new ClientiBean();
				id = verifica.ControlloLogin(cliente);
				//System.out.println(id.getEmail() + " " + id.getPassHash() + " " + id.getIDCliente() + " " + id.getLivAutorizzazioni());
				//request.getSession().removeAttribute("CREDENZIALI");
				request.getSession().setAttribute("CREDENZIALI", id);
				
				//apro la pagina che mi interessa
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd;
				System.out.println("-------- UTENTE LOGGATO --------");
				System.out.println("ID: " + id.getIDCliente());
				System.out.println("Liv Autorizzazioni: " + id.getLivAutorizzazioni());
				if(id.getLivAutorizzazioni() == -1) {
					System.out.println("Credenziali sbagliate");
					rd = sc.getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
				else if(id.getLivAutorizzazioni() == 0){
					System.out.println("Interfaccia cliente");
					rd = sc.getRequestDispatcher("/bacheca.jsp");
					rd.forward(request, response);
				}
				else if(id.getLivAutorizzazioni() == 1){
					System.out.println("Interfaccia ristoratore");
					rd = sc.getRequestDispatcher("/ilmioristorante.jsp");
					rd.forward(request, response);
				}
				else if(id.getLivAutorizzazioni() == 2){
					System.out.println("Interfaccia amministratore");
					rd = sc.getRequestDispatcher("/dashboard.jsp");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
				//apro la pagina che mi interessa
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
		}
	}
}

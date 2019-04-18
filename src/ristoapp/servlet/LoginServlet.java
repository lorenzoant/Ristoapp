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
import ristoapp.bean.RistorantiBean;
import ristoapp.Sha;

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
			Sha encrypt = new Sha();
			
			String email = request.getParameter("email");
			String password = encrypt.sha1(request.getParameter("password"));//cripto la password con sha1
			//System.out.println(password);
			
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
				ClientiBean loggedUser = new ClientiBean();
				loggedUser = verifica.ControlloLogin(cliente);
				//System.out.println(id.getEmail() + " " + id.getPassHash() + " " + id.getIDCliente() + " " + id.getLivAutorizzazioni());
				request.getSession().removeAttribute("CREDENZIALI");
				request.getSession().setAttribute("CREDENZIALI", loggedUser);
				
				//apro la pagina che mi interessa
				//ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd;
				if(loggedUser.getIDCliente() != -1) {//login avvenuto con successo
					System.out.println("-------- UTENTE LOGGATO --------");
					System.out.println("ID: " + loggedUser.getIDCliente());
					System.out.println("Liv Autorizzazioni: " + loggedUser.getLivAutorizzazioni());
				}
				
				if(loggedUser.getLivAutorizzazioni() == -1) {//errore nelle credenziali
					System.out.println("Credenziali sbagliate");
					request.setAttribute("errorMessage", "errore");
			        rd = request.getRequestDispatcher("/login.jsp");
					//rd = sc.getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
				else if(loggedUser.getLivAutorizzazioni() == 0){//utente loggato cliente
					System.out.println("Interfaccia cliente");
					response.sendRedirect("bacheca.jsp");
				}
				else if(loggedUser.getLivAutorizzazioni() == 1){//utente loggato ristorante
					RistorantiBean risto = verifica.getInfoRistoranteDalProprietario(loggedUser); // Prelevo info del suo ristorante
					System.out.println("IDRistorante: " + risto.getIDRistorante());
					if(risto.getIDRistorante() == 0) {
						// L'utente ha appena completato la registrazione, deve ancora registrare il ristorante
						request.getSession().removeAttribute("RISTORANTELOGGATO");
						response.sendRedirect("erroregenerico.jsp");
					}
					else {
						System.out.println("Interfaccia ristoratore");
						response.sendRedirect("aggiornainforistoratoreservlet"); // Richiamo servlet per prelevare le informazioni sul ristorante
					}	
				}
				else if(loggedUser.getLivAutorizzazioni() == 2){//utente loggato admin
					System.out.println("Interfaccia amministratore");
					response.sendRedirect("dashboard.jsp");
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

package ristoapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.GeneraCodice;
import ristoapp.bean.ClientiBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/modificaaccountservlet")
public class ModificaAccountServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
  
    public ModificaAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Account modificato.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						
			// Prendo alcune info essenziali dal vecchio piatto prima della modifica
			//ClientiBean vecchiocliente = (ClientiBean)request.getSession().getAttribute("CLIENTEDAMODIFICARE");
			ClientiBean utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			// Lettura campi da request e manipolazione prima di inserirli nel database
			String Email = request.getParameter("Email");
			String Nome = request.getParameter("Nome");
			String Cognome = request.getParameter("Cognome");
			String Indirizzo = request.getParameter("Indirizzo");
			String Comune = request.getParameter("Comune");
			//String Lingua = request.getParameter("Lingua");
			
			Boolean NotificaEmail = true; 
			if(request.getParameter("NotificaEmail") == null) NotificaEmail = false;
			
			Boolean  Geolocalizzazione = true; 
			if(request.getParameter("Geolocalizzazione") == null) Geolocalizzazione = false;
			
			
			// Salvataggio dei valori nel Bean
			ClientiBean cliente = new ClientiBean();
			cliente.setIDCliente(utenteLoggato.getIDCliente());
			cliente.setEmail(Email);
			cliente.setCognome(Cognome);
			cliente.setNome(Nome);
			cliente.setIndirizzo(Indirizzo);
			cliente.setComune(Comune);
			//cliente.setLingua(Lingua);
			cliente.setNotificaEmail(NotificaEmail);
			cliente.setGeolocalizzazione(Geolocalizzazione);
			
			// Aggiorno il piatto nel database
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiornare nel database
				saveOnDb.modificaCliente(cliente);
				request.getSession().removeAttribute("CLIENTEDAMODIFICARE");
				
				//response.sendRedirect("ilmioristorantecaricamento.jsp"); // Richiamo servlet per prelevare le informazioni sul ristorante
			} 
			catch (Exception e) {
				// Problema nel database, reindirizzo alla pagine di errore generico
				e.printStackTrace();
				
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}
			
		}	
	}

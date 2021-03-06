package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
			boolean NotificaEmail = true; 
			if(request.getParameter("NotificaEmail") == null) NotificaEmail = false;
			
			boolean  Geolocalizzazione = true; 
			if(request.getParameter("Geolocalizzazione") == null) Geolocalizzazione = false;
			
			
			// Salvataggio dei valori nel Bean
			ClientiBean cliente = new ClientiBean();
			cliente.setLivAutorizzazioni(utenteLoggato.getLivAutorizzazioni());
			cliente.setPuntiFedelta(utenteLoggato.getPuntiFedelta());
			cliente.setIDCliente(utenteLoggato.getIDCliente());
			cliente.setEmail(request.getParameter("email"));
			cliente.setCognome(request.getParameter("cognome"));
			cliente.setNome(request.getParameter("nome"));
			cliente.setIndirizzo(request.getParameter("indirizzo"));
			cliente.setComune(request.getParameter("comune"));
			cliente.setLingua(utenteLoggato.getLingua());
			cliente.setNotificaEmail(NotificaEmail);
			cliente.setGeolocalizzazione(Geolocalizzazione);
			
			// Aggiorno il piatto nel database
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiornare nel database
				saveOnDb.modificaCliente(cliente);
				request.getSession().removeAttribute("CREDENZIALI");
				request.getSession().setAttribute("CREDENZIALI",  cliente);
				response.sendRedirect("bacheca.jsp");
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

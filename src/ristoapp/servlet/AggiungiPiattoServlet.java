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

import ristoapp.bean.ClientiBean;
import ristoapp.bean.PiattiBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/aggiungipiattoservlet")
public class AggiungiPiattoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;   
 
    public AggiungiPiattoServlet() {
        super();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Se l'utente ha usato GET probabilmente non è loggato -> login
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("aggiunginuovopiatto")) { // Aggiungo piatto al database
			
			// Lettura campi da request e manipolazione prima di inserirli nel database
			int IDFRistorante = 0;
			ClientiBean utenteLoggato = null;
			try {
				// Identifico l'utente e il suo ristorante
				utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
				RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
				if(utenteLoggato.getLivAutorizzazioni() == 1 && utenteLoggato.getIDCliente() == risto.getIDFCliente()) {
					IDFRistorante = risto.getIDRistorante();
				}else {
					// Utente non autorizzato o non loggato
					throw new Exception("User not logged");
				}
			}
			catch (Exception e) {
				// Nessun ristoratore loggato
				System.out.println("AggiungiPiattoServlet: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
			
			
			int IDFCatPiatto = 0;
			try {
				IDFCatPiatto = Integer.parseInt(request.getParameter("categoria"));
			}catch (Exception e){
				IDFCatPiatto = 0;
			}
			
			double Prezzo = 10;
			try {
				Prezzo = Double.parseDouble(request.getParameter("prezzo"));
			}catch (Exception e){
				Prezzo = 10;
			}
			
			Boolean Disponibile = true; 
			if(request.getParameter("disponibile") == null) Disponibile = false;
			
			
			// Salvataggio dei valori nel Bean
			PiattiBean piatto = new PiattiBean();
			
			piatto.setIDFRistorante(IDFRistorante);
			piatto.setIDFCatPiatto(IDFCatPiatto);
			piatto.setNome(request.getParameter("nome"));
			piatto.setPrezzo(Prezzo);
			piatto.setDisponibile(Disponibile);
			piatto.setDescrizione(request.getParameter("descrizione"));
			piatto.setUrl(request.getParameter("url"));
			piatto.setAllergeni(request.getParameter("allergeni"));
			
			
			// Salvo nel database il piatto creato
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiungere il piatto nel database
				saveOnDb.inserisciPiatto(piatto);
				
				response.sendRedirect("aggiornainforistoratoreservlet"); // Richiamo servlet per prelevare le informazioni sul ristorante
			} 
			catch (Exception e) {
				// Problema nel database, reindirizzo alla pagine di errore generico
				e.printStackTrace();
				
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}
		}
		
		
		else if(whatsend.equalsIgnoreCase("modificapiatto")) { // Prelevo informazioni per modificare il piatto
			
			int idPiattoDaModificare = Integer.parseInt(request.getParameter("piattoDaModificare"));
			
			// Prelevo i piatti dalla sessione e cerco quello da modificare (tramite id)
			// per prendere le informazioni da caricare nella pagina jsp di modifica
			RistorantiBean risto = (RistorantiBean)request.getSession().getAttribute("RISTORANTELOGGATO");
			ArrayList<PiattiBean> piatti = risto.getPiatti();
			
			for(PiattiBean piatto:piatti){
				if(piatto.getIDPiatto() == idPiattoDaModificare) {
					// Ho trovato il piatto da modificare
					// Salvo in sessione per aprirlo nella JSP
					request.getSession().removeAttribute("PIATTODAMODIFICARE");
					request.getSession().setAttribute("PIATTODAMODIFICARE", piatto);
					
					// Reindirizzo a modifica piatto
					response.sendRedirect("modificapiatto.jsp");
					return;
				}
			}
			
			// Se non ho trovato il piatto ritorno a il mio ristorante
			response.sendRedirect("ilmioristorante.jsp");
		}
		
		
		else if(whatsend.equalsIgnoreCase("aggiornapiatto")) { // Aggiorno sul database con le nuove informazioni ricevute
			
			// Prendo alcune info essenziali dal vecchio piatto prima della modifica
			PiattiBean vecchiopiatto = (PiattiBean)request.getSession().getAttribute("PIATTODAMODIFICARE");
			
			// Lettura campi da request e manipolazione prima di inserirli nel database
			int IDFCatPiatto = 0;
			try {
				IDFCatPiatto = Integer.parseInt(request.getParameter("categoria"));
			}catch (Exception e){
				IDFCatPiatto = 0;
			}
			
			double Prezzo = 10;
			try {
				Prezzo = Double.parseDouble(request.getParameter("prezzo"));
			}catch (Exception e){
				Prezzo = 10;
			}
			
			Boolean Disponibile = true; 
			if(request.getParameter("disponibile") == null) Disponibile = false;
			
			
			// Salvataggio dei valori nel Bean
			PiattiBean piatto = new PiattiBean();
			
			piatto.setIDPiatto(vecchiopiatto.getIDPiatto());
			piatto.setIDFRistorante(vecchiopiatto.getIDFRistorante());
			piatto.setIDFCatPiatto(IDFCatPiatto);
			piatto.setNome(request.getParameter("nome"));
			piatto.setPrezzo(Prezzo);
			piatto.setDisponibile(Disponibile);
			piatto.setDescrizione(request.getParameter("descrizione"));
			piatto.setUrl(request.getParameter("url"));
			piatto.setAllergeni(request.getParameter("allergeni"));
			
			// Aggiorno il piatto nel database
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiornare nel database
				saveOnDb.aggiornaPiatto(piatto);
				request.getSession().removeAttribute("PIATTODAMODIFICARE");
				
				response.sendRedirect("aggiornainforistoratoreservlet"); // Richiamo servlet per prelevare le informazioni sul ristorante
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
}

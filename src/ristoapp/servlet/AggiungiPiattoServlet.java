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
		response.getWriter().append("Devi comunicare con post");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("aggiunginuovopiatto")) {
			
			// Lettura campi da request e manipolazione prima di inserirli nel database
			int IDFRistorante = 0;
			ClientiBean utenteLoggato = null;
			try {
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
				response.sendRedirect("ilmioristorante.jsp");
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

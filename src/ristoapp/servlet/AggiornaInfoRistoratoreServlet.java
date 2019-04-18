package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.ClientiBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/aggiornainforistoratoreservlet")
public class AggiornaInfoRistoratoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AggiornaInfoRistoratoreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Controllo se chi accede a questa pagina ha l'autorizzazione
		if(request.getSession() != null && request.getSession().getAttribute("CREDENZIALI") != null){	
			
			ClientiBean utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
	  		
			if(utenteLoggato.getLivAutorizzazioni() == 1){
				
	  			// Ristoratore autorizzato, scarico le nuove informazioni	
	  			SaveMySQL getNewInfo = new SaveMySQL();
	  			try {
		  			RistorantiBean risto = getNewInfo.getInfoRistoranteDalProprietario(utenteLoggato); // Prelevo info del suo ristorante
		  			risto.setRistorantePiatti(getNewInfo.prelevaPiattRistorante(risto)); // Prelevo piatti del ristorante	
		  			risto.setPrenotazioni(getNewInfo.prelevaPrenotazioniRistoranteTraDueDate(risto)); // Prelevo prenotazioni del ristorante
		  			
		  			request.getSession().removeAttribute("PIATTODAMODIFICARE");
		  			request.getSession().removeAttribute("RISTORANTELOGGATO");
		  			request.getSession().setAttribute("RISTORANTELOGGATO", risto);
		  			System.out.println(" -> Info ristorante aggiornate");
	  			}
	  			catch (Exception e) {
					// Nessun ristoratore loggato, quini la query ha generato errori
	  				response.sendRedirect("login.jsp");
	  		  		return;
				}
	  			
	  			// Tutte le informazioni sul ristoratore sono state aggiornate con successo
	  			response.sendRedirect("ilmioristorante.jsp");
	  			return;
	  		}
	  		response.sendRedirect("login.jsp");
	  		return;
		}
		else{
			// L'utente non  loggato
			response.sendRedirect("login.jsp");
			return;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

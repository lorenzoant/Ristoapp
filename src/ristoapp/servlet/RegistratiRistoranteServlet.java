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
import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

/**
 * Servlet implementation class RegistratiRistoranteServlet
 */
@WebServlet("/registratiristoranteservlet")
public class RegistratiRistoranteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistratiRistoranteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Registrazione eseguita");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		
		if (whatsend.equalsIgnoreCase("aggiunginuovoristorante")) {
			
			// Lettura campi da request e manipolazione prima di inserirli nel database
			ClientiBean utenteLoggato = null;
			
			utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			if (utenteLoggato == null) {
				System.out.println("AggiungiRistoranteServlet: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
			
			//cliccando il bottone Invia nel form
			int categoria = 0;
			try {
				categoria = Integer.parseInt(request.getParameter("categoria"));
			}catch (Exception e){
				categoria = 0;
			}
			
			boolean climatizzazione = true;
			if(request.getParameter("ser-climatizzazione") == null) climatizzazione = false;
			
			boolean animali = true;
			if(request.getParameter("ser-animali") == null) animali = false;
			
			boolean wifi = true;
			if(request.getParameter("ser-wifi") == null) wifi = false;
		
			boolean disabili = true;
			if(request.getParameter("ser-disabili") == null) disabili = false;
			
			boolean parcheggio = true;
			if(request.getParameter("ser-parcheggio") == null) parcheggio = false;
			
			//salvataggio valori nel bean
			RistorantiBean ristorante = new RistorantiBean();
			
			ristorante.setNome(request.getParameter("nome_ristorante"));
			ristorante.setIndirizzo(request.getParameter("indirizzo"));
			ristorante.setTelefono(request.getParameter("telefono"));
			ristorante.setEmail(request.getParameter("email"));
			ristorante.setComune(request.getParameter("comuni"));
			ristorante.setDescrizione(request.getParameter("descrizione"));
			ristorante.setSerClimatizzazione(climatizzazione);
			ristorante.setSerAnimali(animali);
			ristorante.setSerWifi(wifi);
			ristorante.setSerDisabili(disabili);
			ristorante.setSerParcheggio(parcheggio);
			ristorante.setIDFCatCucina(categoria);
			ristorante.setIDFCliente(utenteLoggato.getIDCliente());
			ristorante.setCoordinataLat(0);
			ristorante.setCoordinataLon(0);
			ristorante.setSerScegliTavolo(false);
			
			// Salvo nel database il piatto creato
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiungere il ristorante nel database
				saveOnDb.inserisciRistorante(ristorante);
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

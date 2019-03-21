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
		
		String whatsend = request.getParameter("whatseend");
		
		if (whatsend.equalsIgnoreCase("aggiunginuovoristorante")) {
			
			// Lettura campi da request e manipolazione prima di inserirli nel database
			ClientiBean utenteLoggato = null;
			try {
				utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");

			}
			catch (Exception e) {
				// Nessun ristoratore loggato
				System.out.println("AggiungiRistoranteServlet: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
						
			//cliccando il bottone Invia nel form
			String nome_ristorante = request.getParameter("nome_ristorante");
			String indirizzo = request.getParameter("indirizzo");
			String telefono = request.getParameter("telefono");
			String email = request.getParameter("email");
			String comuni = request.getParameter("comuni");
			int categoria = Integer.parseInt(request.getParameter("categoria"));
			String descrizione = request.getParameter("descrizione");
			
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
			
			ristorante.setNome(nome_ristorante);
			ristorante.setIndirizzo(indirizzo);
			ristorante.setTelefono(telefono);
			ristorante.setEmail(email);
			ristorante.setComune(comuni);
			ristorante.setDescrizione(descrizione);
			ristorante.setSerClimatizzazione(climatizzazione);
			ristorante.setSerAnimali(animali);
			ristorante.setSerWifi(wifi);
			ristorante.setSerDisabili(disabili);
			ristorante.setSerParcheggio(parcheggio);
			ristorante.setIDFCatCucina(categoria);
			ristorante.setIDFCliente(utenteLoggato.getIDCliente());
			
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

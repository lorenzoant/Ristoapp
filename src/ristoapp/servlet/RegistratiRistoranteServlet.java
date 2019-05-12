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
import ristoapp.JSONReader;
import org.json.JSONObject;

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
			
			int posti = 0;
			try {
				posti = Integer.parseInt(request.getParameter("posti"));
			}catch (Exception e){
				posti = 0;
			}
			
			double lat = 0;
			try {
				lat = Double.parseDouble(request.getParameter("latitudine"));
			}catch (Exception e){
				lat = 0;
			}
			
			double lon = 0;
			try {
				lon = Double.parseDouble(request.getParameter("longitudine"));
			}catch (Exception e){
				lon = 0;
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
			ristorante.setUrl(request.getParameter("url"));
			ristorante.setSerClimatizzazione(climatizzazione);
			ristorante.setSerAnimali(animali);
			ristorante.setSerWifi(wifi);
			ristorante.setSerDisabili(disabili);
			ristorante.setSerParcheggio(parcheggio);
			ristorante.setIDFCatCucina(categoria);
			ristorante.setNumeroPosti(posti);
			ristorante.setIDFCliente(utenteLoggato.getIDCliente());
			ristorante.setCoordinataLat(lat);
			ristorante.setCoordinataLon(lon);
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
			
		}else if (whatsend.equalsIgnoreCase("modificaristorante")) {
				
			ClientiBean utenteLoggato = null;
			
			utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			
			if (utenteLoggato == null) {
				System.out.println("ModificaRistoranteServlet: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}
				
			int categoria = 0;
			try {
				categoria = Integer.parseInt(request.getParameter("categoria"));
			}catch (Exception e){
				categoria = 0;
			}
			
			int posti = 0;
			try {
				posti = Integer.parseInt(request.getParameter("posti"));
			}catch (Exception e){
				posti = 0;
			}
			
			double lat = 0;
			System.out.println(request.getParameter("latitudine"));
			try {
				lat = Double.parseDouble(request.getParameter("latitudine"));		
			}catch (Exception e){
				lat = 0;
			}
			
			double lon = 0;
			try {
				lon = Double.parseDouble(request.getParameter("lotitudine"));
			}catch (Exception e){
				lon = 0;
				System.out.println(e);
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
			ristorante.setUrl(request.getParameter("url"));
			ristorante.setSerClimatizzazione(climatizzazione);
			ristorante.setSerAnimali(animali);
			ristorante.setSerWifi(wifi);
			ristorante.setSerDisabili(disabili);
			ristorante.setSerParcheggio(parcheggio);
			ristorante.setIDFCatCucina(categoria);
			ristorante.setNumeroPosti(posti);
			ristorante.setIDFCliente(utenteLoggato.getIDCliente());
			ristorante.setCoordinataLat(lat);
			ristorante.setCoordinataLon(lon);
			ristorante.setSerScegliTavolo(false);
			
			// Salvo nel database il piatto creato
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiungere il ristorante nel database
				saveOnDb.modificaRistorante(ristorante);
				
	  			request.getSession().removeAttribute("RISTORANTELOGGATO");
	  			request.getSession().setAttribute("RISTORANTELOGGATO", ristorante);
	  			System.out.println(" -> Info ristorante aggiornate");
	  			
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


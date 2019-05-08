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
import ristoapp.bean.CarteBean;
import ristoapp.db.SaveMySQL;


@WebServlet("/aggiungicartaservlet")
public class AggiungiCartaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AggiungiCartaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Se l'utente ha usato GET probabilmente non è loggato -> login
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		if(whatsend.equalsIgnoreCase("aggiunginuovacarta")) { // Aggiungo piatto al database
			ClientiBean utenteLoggato = null;
			try {
				// Identifico l'utente e il suo ristorante
				utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			}
			catch (Exception e) {
				// Nessun ristoratore loggato
				System.out.println("aggiunginuovacarta: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}				
		
		
			int IDFCatCarta = 0;
			try {
				IDFCatCarta = Integer.parseInt(request.getParameter("categoria"));
			}catch (Exception e){
				IDFCatCarta = 0;
			}
			String NomeCarta = request.getParameter("nomecarta");
			
			int PAN = 0;
			try {
				PAN = Integer.parseInt(request.getParameter("pan"));
			}catch (Exception e){
				PAN = 0;
			}
			
			int CVV = 0;
			try {
				CVV = Integer.parseInt(request.getParameter("cvv"));
			}catch (Exception e){
				CVV = 0;
			}
			
			String DataScadenza = request.getParameter("data");
			
			
			CarteBean carta= new CarteBean();
			carta.setIDFCatCarta(IDFCatCarta);
			carta.setIDFCliente(utenteLoggato.getIDCliente());
			carta.setNomeCarta(NomeCarta);
			carta.setPAN(PAN);
			carta.setCVV(CVV);
			carta.setDataScadenza(DataScadenza);
			

			SaveMySQL db = new SaveMySQL();
			
			try {
				db.aggiungiCarta(carta);
				response.sendRedirect("profilo.jsp");
			} 
			catch (Exception e) {
				System.out.println("Errore in scrittura sul databass");
				e.printStackTrace();
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}
			
		}
	}

}

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
import ristoapp.bean.PrenotazioniBean;
import ristoapp.db.SaveMySQL;


@WebServlet("/pagamentoservlet")
public class PagamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PagamentoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Se l'utente ha usato GET probabilmente non è loggato -> login
		//response.sendRedirect("login.jsp");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		if(whatsend.equalsIgnoreCase("paga")) { // Aggiorno lo stato del pagamento
			ClientiBean utenteLoggato = null;
			try {
				// Identifico l'utente
				utenteLoggato = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			}
			catch (Exception e) {
				// Utente non loggato
				System.out.println("paga: user not logged");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}				
			
			PrenotazioniBean prenotazione= new PrenotazioniBean();

			prenotazione.setIDFCliente(utenteLoggato.getIDCliente());
			prenotazione.setIDPrenotazione(Integer.parseInt(request.getParameter("idpren")));

			SaveMySQL db = new SaveMySQL();
			
			try {
				db.setPagamento(prenotazione);
				response.sendRedirect("profilo.jsp");
			} 
			catch (Exception e) {
				System.out.println("Errore in scrittura sul database");
				e.printStackTrace();
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}
			
		}
	}
}

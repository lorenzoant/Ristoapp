package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ristoapp.bean.ClientiBean;
import ristoapp.bean.PrenotazioniBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/nuovaprenotazioneservlet")
public class NuovaPrenotazioneServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public NuovaPrenotazioneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("You got caught by the POST police, you are not allowed to use a GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("creaprenotazione")) {
			String data = request.getParameter("data");
			String ora = request.getParameter("ora");
			String posti = request.getParameter("posti");
			int categoria = Integer.parseInt(request.getParameter("categoria"));
			
			//ClientiBean cliente= (ClientiBean) request.getSession().getAttribute("CREDENZIALI");
			PrenotazioniBean prenotazione= new PrenotazioniBean();
			prenotazione.setIDFCliente(1/*cliente.getIDCliente()*/);
			prenotazione.setData(data);
			prenotazione.setOra(ora);
			prenotazione.setNumeroPersone(posti);
			prenotazione.setIDFCatPrenotazione(categoria);
			prenotazione.setStatoPagamento(false);
			//int idristorante=  (int) request.getSession().getAttribute("idristorante");
			prenotazione.setIDFRistorante(1/*idristorante*/);
			int IDPren = 0;
			SaveMySQL db = new SaveMySQL();
			try {
				IDPren=db.nuovaPrenotazione(prenotazione);
			} catch (Exception e) {
				System.out.println("Errore in scrittura sul databass");
				e.printStackTrace();
			}
			
			request.getSession().removeAttribute("IDPREN");
			request.getSession().setAttribute("IDPREN", IDPren);
			
			response.getWriter().append("Prenotazione inviata al ristorante...");
		}
	}
}

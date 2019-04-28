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
			prenotazione.setStatoPagamento(0);
			//int idristorante=  (int) request.getSession().getAttribute("idristorante");
			prenotazione.setIDFRistorante(1/*idristorante*/);
			int IDPren = 0;
			SaveMySQL db = new SaveMySQL();
			
			try {
				IDPren=db.nuovaPrenotazione(prenotazione);
			} 
			catch (Exception e) {
				System.out.println("Errore in scrittura sul databass");
				e.printStackTrace();
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
			}
			
			request.getSession().removeAttribute("IDPREN");
			request.getSession().setAttribute("IDPREN", IDPren);
			request.getSession().removeAttribute("TipoPren");
			request.getSession().setAttribute("TipoPren", categoria);
			
			response.sendRedirect("inseriscidettaglipren.jsp");
		}
		if(whatsend.equalsIgnoreCase("dettaglipren")) {
			ArrayList<PiattiBean> rs;
			SaveMySQL db= new SaveMySQL();
			//int risto= Integer.parseInt(request.getSession().getAttribute("idristorante").toString());
			int risto=1;
			try {
				rs=  db.prelevaPiattRistorante(risto);
				for(int i=0; i<rs.size(); i++){
					
					if(rs.get(i).getDisponibile()==true){
						//TODO: inserire dettaglipren
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
			}
			
			
		}
		//TODO: Prevedi nodettagli
		if(whatsend.equalsIgnoreCase("nodettagli")) {
			System.out.println("Reindirizzamento");
			ServletContext sc = request.getSession().getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/prenotazionecompletata.jsp");
			
		}	
			
			
	}
}

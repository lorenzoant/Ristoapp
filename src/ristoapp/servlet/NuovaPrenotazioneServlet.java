package ristoapp.servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ristoapp.bean.ClientiBean;

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
			String idristorante= request.getParameter("ristorante"); //creare campo hidden per raccogliere l'id del ristorante
			
			ClientiBean cliente= (ClientiBean) request.getSession().getAttribute("CREDENZIALI");
			
			response.getWriter().append("Prenotazione inviata al ristorante...");
		}
	}
}

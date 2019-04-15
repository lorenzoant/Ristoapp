package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.Sha;
import ristoapp.bean.ClientiBean;
import ristoapp.db.SaveMySQL;


@WebServlet("/accountservlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AccountServlet() {
    	super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Devi comunicare con post");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whatsend = request.getParameter("whatsend");
		if(whatsend.equalsIgnoreCase("registrautente")) {

			
			Sha encrypt = new Sha();
			
			ServletContext sc;
			RequestDispatcher rd;
			
			
			String Email = request.getParameter("Email");
			String PassHash = request.getParameter("PassHash");
			String PassHash1 = request.getParameter("PassHash1");
			String Nome = request.getParameter("Nome");
			String Cognome = request.getParameter("Cognome");
			String Indirizzo = request.getParameter("Indirizzo");
			String Comune = request.getParameter("Comune");
			String Lingua = request.getParameter("Lingua");
			
			Boolean NotificaEmail = true; 
			if(request.getParameter("NotificaEmail") == null) NotificaEmail = false;
			
			Boolean  Geolocalizzazione = true; 
			if(request.getParameter("Geolocalizzazione") == null) Geolocalizzazione = false;
			
			if(!PassHash1.equals(PassHash)){
				
				request.setAttribute("errorMessage", "errore");
				rd = request.getRequestDispatcher("/account.jsp");
				rd.forward(request, response);
				
			}
			
			else{
				// Salvataggio dei valori n el Bean
				ClientiBean cliente = new ClientiBean();
			
				cliente.setEmail(Email);
				cliente.setPassHash(encrypt.sha1(PassHash));
				cliente.setCognome(Cognome);
				cliente.setNome(Nome);
				cliente.setIndirizzo(Indirizzo);
				cliente.setComune(Comune);
				cliente.setLingua(Lingua);
				cliente.setNotificaEmail(NotificaEmail);
				cliente.setGeolocalizzazione(Geolocalizzazione);
				
				//Salvo in sessione
				
				request.getSession().removeAttribute("Cliente");
				request.getSession().setAttribute("Cliente",cliente);
				
				ClientiBean cb = new  ClientiBean();
				cb = (ClientiBean) request.getSession().getAttribute("Cliente");
				
				//Salvo in db
				
				SaveMySQL saveOnDb = new SaveMySQL();
				try {
					saveOnDb.inserisciCliente(cb);
					response.sendRedirect("login.jsp");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					sc = request.getSession().getServletContext();																								
					rd = sc.getRequestDispatcher("account.jsp");																																		
					rd.forward(request, response);	
				}
			}	
	}
}
}
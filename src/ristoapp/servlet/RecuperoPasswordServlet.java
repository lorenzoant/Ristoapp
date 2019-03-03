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
import ristoapp.db.SaveMySQL;
import ristoapp.InvioEmail;
import ristoapp.ControlloCaptcha;

@WebServlet("/recuperopasswordservlet")
public class RecuperoPasswordServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public RecuperoPasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Ti è stata inviata una email.<br>Controlla nello spam se non la trovi.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("recupera")) {
			//risposta captcha valida
			ControlloCaptcha controllo = new ControlloCaptcha();
			if(controllo.isCaptchaValid("6LccHZUUAAAAALytemiMW8qlVTC4x66lwc40bCHk", request.getParameter("g-recaptcha-response"))){
				//cliccando il bottone invia del form login
				
				//lettura campi da request
				String email = request.getParameter("email");
				
				//salvataggio dei valori nel Bean
				ClientiBean cliente = new ClientiBean();
				
				cliente.setEmail(email);
				
				//il Bean deve essere salvato in sessione
				request.getSession().removeAttribute("CREDENZIALI");
				request.getSession().setAttribute("CREDENZIALI", cliente);
				
				cliente = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
				SaveMySQL verifica = new SaveMySQL();
				
				try {
					ClientiBean password = new ClientiBean();
					password = verifica.RecuperoPassword(cliente);
					request.getSession().removeAttribute("CREDENZIALI");
					
					//apro la pagina che mi interessa
					ServletContext sc = request.getSession().getServletContext();
					RequestDispatcher rd;
		
					if(password.getPassHash() == "") {//utente non trovato
						System.out.println("Utente non trovato");
						rd = sc.getRequestDispatcher("/recuperopassword.jsp");
						rd.forward(request, response);
					}
					else {//password presa
						//System.out.println("Password: " + password.getPassHash() + " (prova, da nascondere)");
						System.out.println("Invio email");
						//invio email
						InvioEmail email1 = new InvioEmail();
						email1.invia(cliente.getEmail(), password.getPassHash());
						rd = sc.getRequestDispatcher("/login.jsp");
						rd.forward(request, response);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					//apro la pagina che mi interessa
					ServletContext sc = request.getSession().getServletContext();
					RequestDispatcher rd = sc.getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
			}
			else {
				//risposta captcha non valida
				request.setAttribute("errorMessage", "errore");
				RequestDispatcher rd = request.getRequestDispatcher("/recuperopassword.jsp");
				rd.forward(request, response);
				System.out.println("Sei un robot!");
			}
		}
	}
}

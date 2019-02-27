package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.ClientiBean;

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
			//cliccando il bottone invia del form recupera password
			
			//lettura campi da request
			String email = request.getParameter("email");
			
			//salvataggio dei valori nel Bean
			ClientiBean cliente = new ClientiBean();
			
			cliente.setEmail(email);
		}
	}
}

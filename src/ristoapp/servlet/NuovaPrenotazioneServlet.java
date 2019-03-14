package ristoapp.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			
			
			
			String p1 = request.getParameter("tipoprenotazione");
			String p2 = request.getParameter("data");
			String p3 = request.getParameter("ora");
			String p4 = request.getParameter("posti");
			response.getWriter().append("Prenotazione inviata al ristorante...");
		}
	}
}

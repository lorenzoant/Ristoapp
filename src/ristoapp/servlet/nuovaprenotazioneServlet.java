package ristoapp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class nuovaprenotazioneServlet
 */
@WebServlet("/nuovaprenotazioneServlet")
public class nuovaprenotazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nuovaprenotazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String p1 = request.getParameter("tipoprenotazione");
		String p2 = request.getParameter("data");
		String p3 = request.getParameter("ora");
		String p4 = request.getParameter("posti");
		System.out.println (
                "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" +" +
                    "http://www.w3.org/TR/html4/loose.dtd\">\n" +
                "<html> \n" +
                  "<head> \n" +
                    "<meta http-equiv=\"Content-Type\" content=\"text/html; " +
                      "charset=ISO-8859-1\"> \n" +
                    "<title> Crunchify.com JSP Servlet Example  </title> \n" +
                  "</head> \n" +
                  "<body> <div align='center'> \n" +
                    "<style= \"font-size=\"12px\" color='black'\"" + "\">" +
                      "tipo: " + p1 + " <br> " + 
                      "data: " + p2 +
                  "</font></body> \n" +
                "</html>" );
			
		}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

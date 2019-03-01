package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.PiattiBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

@WebServlet("/aggiungipiattoservlet")
public class AggiungiPiattoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;   
 
    public AggiungiPiattoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Devi comunicare con post");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("aggiunginuovopiatto")) {
			
			// Lettura campi da request
			int IDFRistorante = 0; // = da prendere dalla sessione
			int IDFCatPiatto = 0; // = categoriaNome
			String Nome = request.getParameter("nome");
			double Prezzo = 10;
			try {
				Prezzo = Double.parseDouble(request.getParameter("prezzo"));
			}catch (Exception e){
				Prezzo = 10;
			}
			Boolean Disponibile = true; 
			if(request.getParameter("disponibile") == null) Disponibile = false;
			String Descrizione = request.getParameter("descrizione");
			String Url = request.getParameter("url");
			String Allergeni = request.getParameter("allergeni");
			
			//TODO: bisogna inserire l'id categoria
			//TODO: bisogna associare l'id del ristorante
			
			
			// Salvataggio dei valori nel Bean
			PiattiBean piatto = new PiattiBean();
			
			piatto.setIDFRistorante(IDFRistorante);
			piatto.setIDFCatPiatto(IDFCatPiatto);
			piatto.setNome(Nome);
			piatto.setPrezzo(Prezzo);
			piatto.setDisponibile(Disponibile);
			piatto.setDescrizione(Descrizione);
			piatto.setUrl(Url);
			piatto.setAllergeni(Allergeni);
			
			// Il bean deve essere salvato in sessione
			//request.getSession().removeAttribute("PIATTO");
			//request.getSession().setAttribute("PIATTO", piatto);
			// Leggo i dati della sessione
			//PiattiBean piatto = new PiattiBean();
			//piatto = (PiattiBean)request.getSession().getAttribute("PIATTO");
			
			// Salvo nel database il piatto creato
			SaveMySQL saveOnDb = new SaveMySQL();
			
			try {
				// Provo ad aggiungere il piatto nel database
				saveOnDb.inserisciPiatto(piatto);
				//request.getSession().removeAttribute("PIATTO");
				
				//TODO: reindirizzare alla lista di tutti i piatti
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/aggiungipiatto.jsp");
				rd.forward(request, response);
			} 
			catch (Exception e) {
				// Problema nel database, reindirizzo alla pagine di errore generico
				e.printStackTrace();
				
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/erroregenerico.jsp");
				rd.forward(request, response);
			}
		}
		
		
	}
}

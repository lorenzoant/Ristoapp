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
	
		response.getWriter().append("ciao");
		String whatsend = request.getParameter("whatsend");
		//response.getWriter().append(request.getParameter("disponibile"));
		
		if(whatsend.equalsIgnoreCase("aggiunginuovopiatto")) {
			
			// Lettura campi da request
			int idpiatto = 1; // si incrementa automaticamente
			int idfRistorante = 1; // utilizzare quello del ristoratore loggato
			String categoriaNome = request.getParameter("categoria");
			int idfCatPiatto = 0; // = categoriaNome
			String nome = request.getParameter("nome");
			String prezzo = request.getParameter("prezzo");
			Boolean disponibile = request.getParameter("disponibile");
			String descrizione = request.getParameter("descrizione");
			String url = request.getParameter("url");
			String allergeni = request.getParameter("allergeni");
			
			// Salvataggio dei valori n el Bean
			PiattiBean piatto = new PiattiBean();
			RistorantiBean ristorante = new RistorantiBean();
			company.setCompanyEmployess(companyEmployess);
			
			piatto.setNome(nome);
			//piatto.setPrezzo(prezzo);
			piatto.setDescrizione(descrizione);
			piatto.setUrl(url);
			piatto.setAllergeni(allergeni);
			
			// Il bean deve essere salvato in sessione
			if(request.getSession() != null && request.getAttribute("RISTORANTE") != null) {
				piatto = (PiattiBean)request.getSession().getAttribute("bo");
				ArrayList<RistorantiBean> = company.getCompanyEmploeyess();
				RistorantiBean employeetoremove = new RistorantiBean();
				for(Employeebean cl:companyEmploeyess) {
					if(cl.getIdEmployee().equalsIgnoreCase(idemployee)) {
						employeetoremove = cl;
					}
				}
			}
			companyemplotess.remove(employeetoremove);
			companyEmployees.add(employee);
			company.setCompanyEmployees(companyEmployess)
			
			request.getSession().removeAttribute("employee");
			request.getSession().setAttribute("employee", employee);1111
			
			// Il bean deve essere salvato in sessione
			request.getSession().removeAttribute("PIATTO");
			request.getSession().setAttribute("PIATTO", piatto);
			
			// Apro la pagina che mi interessa
			ServletContext sc = request.getSession().getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/aggiungipiatto.jsp");
			
		}
		*/
	}
}

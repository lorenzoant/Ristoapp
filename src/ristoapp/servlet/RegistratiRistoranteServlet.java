package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.CategoriaCucinaBean;
import ristoapp.bean.ClientiBean;
import ristoapp.bean.PiattiBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.db.SaveMySQL;

/**
 * Servlet implementation class RegistratiRistoranteServlet
 */
@WebServlet("/registratiristoranteservlet")
public class RegistratiRistoranteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistratiRistoranteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Registrazione eseguita");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("ciao");
		String whatsend = request.getParameter("whatseend");
		
		if (whatsend.equalsIgnoreCase("company")) {
			//cliccando il bottone Invia nel form
			String account = request.getParameter("account");
			String nome_ristorante = request.getParameter("nome_ristorante");
			String indirizzo = request.getParameter("indirizzo");
			String telefono = request.getParameter("telefono");
			String email = request.getParameter("email");
			String comuni = request.getParameter("comuni");
			String descrizione = request.getParameter("descrizione");
			String climatizzazione = request.getParameter("ser-climatizzazione");
			String animali = request.getParameter("ser-animali");
			String wifi = request.getParameter("ser-wifi");
			String disabili = request.getParameter("ser-disabili");
			String parcheggio = request.getParameter("ser-parcheggio");
			
			//salvataggio valori nel bean
			RistorantiBean ristorante = new RistorantiBean();
			CategoriaCucinaBean catcucina = new CategoriaCucinaBean();
			company.setCompanyEmployess(companyEmployess);
			
			ristorante.setNome(nome_ristorante);
			ristorante.setIndirizzo(indirizzo);
			ristorante.setTelefono(telefono);
			ristorante.setEmail(email);
			ristorante.setComune(comuni);
			ristorante.setDescrizione(descrizione);
			ristorante.setSerClimatizzazione(climatizzazione);
			ristorante.setSerAnimali(animali);
			ristorante.setSerWifi(wifi);
			ristorante.setSerDisabili(disabili);
			ristorante.setSerParcheggio(parcheggio);
			
			//il bean deve essere salvato in sessione
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
			
			// Il bean deve essere salvato in sessione
			companyemplotess.remove(employeetoremove);
			companyEmployees.add(employee);
			company.setCompanyEmployees(companyEmployess)
			
			request.getSession().removeAttribute("employee");
			request.getSession().setAttribute("employee", employee);
			
			request.getSession().removeAttribute("REGRISTO");
			request.getSession().setAttribute("REGRISTO", ristorante);
			
			//apro la pagina
			ServletContext sc = request.getSession().getServletContext();
			RequestDispacher rd = sc.getRequestDispatcher("/registratiristorante.jsp");		
			re.forward(request, response);
			
		}else if (whatsend.equalsIgnoreCase("saveInDB")) {
			Companybean company = new companybean();
			company = (companybean)request.getSession().getAttribute("COMPANY");
			SaveMySQL savecompany = new SaveMySql();
			
			savecompany.inserisciPiatto(comapny);
			request.getSession().removeAttribute("COMPANY");
			
			ServletContext sc = request.getSession().getServletContext();
			RequestDispacher rd = sc.getRequestDispatcher("/opera");
			rd.forward(request, response)
		}
		
		doGet(request, response);
	}

}

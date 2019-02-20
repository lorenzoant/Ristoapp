package ristoapp.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ristoapp.bean.CategoriaCucinaBean;
import ristoapp.bean.ClientiBean;
import ristoapp.bean.RistorantiBean;

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
			ClientiBean cliente = new ClientiBean();
			ArrayList<>
			
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
			if (request.getSession() != null && request.getSession().getAttribute("REGRISTO") != null) {
				ristorante = (RistorantiBean)request.getSession().getAttribute("");
				ArrayList<RistorantiBean> = 
			}
			

			
			request.getSession().removeAttribute("REGRISTO");
			request.getSession().setAttribute("REGRISTO", ristorante);
			
			//apro la pagina
			ServletContext sc = request.getSession().getServletContext();
			RequestDispacher rd = sc.getRequestDispatcher("/registratiristorante.jsp");
			rd.forwa
			
		}
		
		doGet(request, response);
	}

}

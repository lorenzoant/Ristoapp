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

import ristoapp.Sha;
import ristoapp.GeneraCodice;

/**
 * Servlet implementation class ModificaPasswordServlet
 */
@WebServlet("/modificapasswordservlet")
public class ModificaPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String whatsend = request.getParameter("whatsend");
		
		if(whatsend.equalsIgnoreCase("modifica")) {
			//lettura campi da request
			int codice = Integer.parseInt(request.getParameter("codice"));
			String password = request.getParameter("password");
			String password2 = request.getParameter("password2");
			
			//salvataggio dei valori nel Bean
			ClientiBean cliente = new ClientiBean();
			
			//prendo le credenziali (email)
			cliente = (ClientiBean)request.getSession().getAttribute("CREDENZIALI");
			
			//System.out.println(cliente.getCodicePass() + cliente.getEmail());
			//System.out.println(password + " " + password2);
			if(password.equals(password2)) {//le due password coincidono
				if (codice == cliente.getCodicePass()) {//i codici coincidono
					SaveMySQL verifica = new SaveMySQL();
					
					try {
						//request.getSession().removeAttribute("CREDENZIALI");
						
						Sha encrypt = new Sha();
						GeneraCodice rand = new GeneraCodice();
						cliente.setPassHash(encrypt.sha1(password));//cripto la nuova password
						cliente.setCodicePass(rand.Genera());//genero un nuovo codice
						System.out.println(cliente.getPassHash() + " " + cliente.getCodicePass());
						
						if(verifica.ModificaPassword(cliente) == 1) {//successo
							//apro la pagina che mi interessa, login
							System.out.println("Modifica password avvenuta con successo");
							response.sendRedirect("login.jsp");
						}
						else {
							System.out.println("Modifica password fallita");
							request.setAttribute("errorMessage", "errore3");
							RequestDispatcher rd = request.getRequestDispatcher("/modificapassword.jsp");
							rd.forward(request, response);
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						//apro la pagina che mi interessa
						ServletContext sc = request.getSession().getServletContext();
						RequestDispatcher rd = sc.getRequestDispatcher("/modificapassword.jsp");
						rd.forward(request, response);
					}
				}
				else {
					System.out.println("Codice errato");
					request.setAttribute("errorMessage", "errore1");
					RequestDispatcher rd = request.getRequestDispatcher("/modificapassword.jsp");
					rd.forward(request, response);
				}
			}
			else {
				//password differenti
				System.out.println("Password differenti!");
				request.setAttribute("errorMessage", "errore2");
				RequestDispatcher rd = request.getRequestDispatcher("/modificapassword.jsp");
				rd.forward(request, response);
			}
		}
	}

}

package ristoapp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

<<<<<<< HEAD
import ristoapp.bean.ClientiBean;
=======
import company_management.bean.CompanyBean;
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
import ristoapp.bean.PiattiBean;
import ristoapp.bean.ClientiBean;

public class SaveMySQL {

	// Parametri di accesso al database
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://lorenzoantoniazzi.ddns.net/theristoapp";
	private static final String DB_USER = "ristoapp";
	private static final String DB_PASSWORD = "$@x9Wq7XTjN#-J^v";
	
	
	private static Connection getDBConnection() throws Exception {
		
		// Funzione per creare la connessione
		System.out.println("------------- MySQL JDBC Connection -------------");
		Connection dbConnection = null;
		
		// Carico il driver
		try {
			Class.forName(DB_DRIVER);
		}
		catch (ClassNotFoundException e){
			System.out.println("ERROR loading MySQL JDBC Driver");
			throw new Exception(e.getMessage());
		}
		
		// Apro la connessione
		try {
			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
			System.out.println("MySQL connection success");
		}
		catch (SQLException e){
			System.out.println("MySQL connection failed");
			throw new Exception(e.getMessage());
		}
		
		// Ritorno l'oggetto creato
		return dbConnection;
	}// End getDBConnection()
	
	
	//inserisciPiatto
	public void inserisciPiatto(PiattiBean piatto) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "INSERT INTO Piatti(IDPiatto, IDFRistorante, IDFCatPiatto, Nome, Prezzo, Disponibile, Descrizione, Foto, Allergeni) VALUES('" +
					piatto.getIDPiatto() + "','" + 
					piatto.getIDFRistorante() + "','" + 
					piatto.getIDFCatPiatto() + "','" + 
					piatto.getNome() + "','" + 
					piatto.getPrezzo() + "','" + 
					piatto.getDisponibile() + "','" + 
					piatto.getDescrizione() + "','" + 
					piatto.getUrl() + "','" + 
					piatto.getAllergeni() + "');";
			
			// Committo sul server
			stmt.executeUpdate(sql);
			
			// Nel caso volessi lavorare anche sugli array:
			/*ArrayList<RecensionePiattiBean> recensioniPiatti = PiattiBean.getRecensioniPiatti();
			
			for(RecensionePiattiBean recensione:recensioniPiatti) {
				sql = "INSERT INTO faccio la insert ma in questo caso non serve";
			}
			
			stmt.executeUpdate(sql);*/
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL connection inserisciPiatto() failed");
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}// End inserisciPiatto()
	
<<<<<<< HEAD
<<<<<<< HEAD
	
	//prelevaInfoPiattoDaId
	public PiattiBean prelevaInfoPiattoDaId(int idpiatto) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = ""; 
					
			// Eseguo query
			ResultSet result = stmt.executeQuery(sql);
			
			return (PiattiBean)result;
			
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL connection prelevaInfoPiattoDaId() failed");
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}// End prelevaInfoPiattoDaId()
	
	
	//prelevaInfoPiatti
	public ArrayList<PiattiBean> prelevaInfoPiatti() throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
=======
	//Controllo Credenziali Login
	public void ControlloLogin(ClientiBean cliente) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		int id = -1;
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
=======
	//Controllo Credenziali Login
	public ClientiBean ControlloLogin(ClientiBean cliente) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
<<<<<<< HEAD
<<<<<<< HEAD
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "SELECT * FROM Piatti;"; 
					
			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);
			
			// Estraggo dati
			ArrayList<PiattiBean> piattiList = new ArrayList<PiattiBean>();
			while(resultList.next()){
				PiattiBean piatto = new PiattiBean();
				piatto.setIDPiatto(Integer.parseInt(resultList.getString("IDPiatto")));
				piatto.setIDPiatto(Integer.parseInt(resultList.getString("IDFRistorante")));
				piatto.setIDPiatto(Integer.parseInt(resultList.getString("IDPiatto")));
				piatto.setIDPiatto(Integer.parseInt(resultList.getString("IDPiatto")));
				piatto.setIDPiatto(Integer.parseInt(resultList.getString("IDPiatto")));
			}
			
			return (PiattiBean)piattiList;
			
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL connection prelevaInfoPiatti() failed");
=======
			// Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
=======
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "SELECT IDCliente FROM Clienti WHERE Email = '" + cliente.getEmail() + "' AND PassHash = '" + cliente.getPassHash() + "';";
			
			// Committo sul server e prendo il valore dell'ID se esiste
<<<<<<< HEAD
			id = stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
			System.out.println(id);//stampo l'ID, operazione inutile DA CANCELLARE, messo per evitare il warning
=======
			ResultSet ricerca = stmt.executeQuery(sql);
			
			while(ricerca.next()) {
				ClientiBean id = new ClientiBean();
				id.setIDCliente(IDCliente);
			}
			return id;
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL connection ControlloLogin() failed");
<<<<<<< HEAD
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
=======
			if(conn != null) {
				conn.rollback();
			}
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
<<<<<<< HEAD
<<<<<<< HEAD
	}// End prelevaInfoPiatti()
		
	
	public void inserisciCliente(ClientiBean cliente) throws Exception{
			
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "INSERT INTO Clienti(IDCliente, Email, PassHash, nome, cognome, LivAutorizzazioni, Indirizzo, Comune, Lingua, NotificaEmail, Geolocalizzazione, PuntiFedeltà) VALUES('" +
					cliente.getIDCliente() + "','" + 
					cliente.getEmail() + "','" + 
					cliente.getPassHash() + "','" + 
					cliente.getNome() + "','" + 
					cliente.getCognome() + "','" + 
					cliente.getLivAutorizzazioni() + "','" + 
					cliente.getIndirizzo() + "','" + 
					cliente.getComune() + "','" + 
					cliente.getLingua() + "','" + 
					cliente.getNotificaEmail() + "','" + 
					cliente.getGeolocalizzazione() + "','" + 
					cliente.getPuntiFedelta() + "');";
			
			// Committo sul server
			stmt.executeUpdate(sql);
		}
		catch (SQLException e) {
			System.out.println("MySQL connection inserisciCliente() failed");
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}// End inserisciCliente()
		
	
	public void modificaCliente(ClientiBean cliente) throws Exception{
			
		Statement stmt = null;
		Connection conn = null;
=======
=======
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
	}// End ControlloLogin()
	
	//Controllo Esistenza Email per recupero password
	public void RecuperoPassword(ClientiBean cliente) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		String password = null;
<<<<<<< HEAD
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
=======
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
<<<<<<< HEAD
<<<<<<< HEAD
			// Disattivo auto commit al databse: decido da codice quando committare
=======
			// Disattivo auto commit al database: decido da codice quando committare
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
=======
			// Disattivo auto commit al database: decido da codice quando committare
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
<<<<<<< HEAD
<<<<<<< HEAD
			String sql = "UPDATE Clienti SET" +
					"Email = '" + cliente.getEmail()+ "'," +  
					"PassHash = '" + cliente.getPassHash()+ "'," + 
					"Nome = '" + cliente.getNome()+ "'," +  
					"Cognome = '" + cliente.getCognome()+ "'," +  
					"Indirizzo = '" + cliente.getIndirizzo()+ "'," + 
					"Comune = '" + cliente.getComune()+ "'," + 
					"NotificaEmail = '" + cliente.getNotificaEmail()+ "'," +
					"Geolocalizzazione = '" + cliente.getGeolocalizzazione()+ "'," +
					"WHERE IDCliente = '" + cliente.getIDCliente() + "'"; 
			
			// Committo sul server
			stmt.executeUpdate(sql);
		}
		catch (SQLException e) {
			System.out.println("MySQL connection modificaCliente() failed");
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	}// End modificaCliente()
	
	
	public void eliminaCliente(ClientiBean cliente) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "DELETE FROM Clienti" +
					"WHERE IDCliente = '" + cliente.getIDCliente() + "'"; 
			
			// Committo sul server
			stmt.executeUpdate(sql);
		}
		catch (SQLException e) {
			System.out.println("MySQL connection eliminaCliente() failed");
=======
=======
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
			String sql = "SELECT PassHash FROM Clienti WHERE Email = '" + cliente.getEmail() + "';";
			
			// Committo sul server e prendo il valore della password se esiste
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				password = rs.getString("PassHash");
			}
			System.out.println(password);//stampo la password, operazione inutile DA CANCELLARE, messo per evitare il warning
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL connection RecuperoPassword() failed");
<<<<<<< HEAD
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
=======
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
			if(conn != null) {
				conn.rollback();
			}
			throw new Exception(e.getMessage());
		}
		finally {
			// Chiudo la connessione
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
<<<<<<< HEAD
<<<<<<< HEAD
	}// End eliminaCliente()
	
=======
	}// End RecuperoPassword()
>>>>>>> b5b4ceaa2daa038f5470a08ac72ee9af2fedb93a
=======
	}// End RecuperoPassword()
>>>>>>> ca534302ea861edc1df137f1063422ecd6718dfd
}

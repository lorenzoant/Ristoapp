package ristoapp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ristoapp.bean.ClientiBean;
import ristoapp.bean.PiattiBean;

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
	
	
	public void inserisciPiatto(PiattiBean piatto) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "INSERT INTO Piatti (IDFRistorante, IDFCatPiatto, Nome, Prezzo, Disponibile, Descrizione, Foto, Allergeni) VALUES ('" + 
					piatto.getIDFRistorante() + "','" + 
					piatto.getIDFCatPiatto() + "','" + 
					piatto.getNome() + "','" + 
					piatto.getPrezzo() + "','"; 
					if(piatto.getDisponibile()) sql += "1','";
					else sql += "0','";
			sql +=	piatto.getDescrizione() + "','" + 
					piatto.getUrl() + "','" + 
					piatto.getAllergeni() + "');";
			
			// Committo sul server
			stmt.executeUpdate(sql);
			
			System.out.println("MySQL inserisciPiatto() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL inserisciPiatto() failed");
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
	
	
	public PiattiBean prelevaInfoPiattoDaId(int idpiatto) throws Exception{
		//TODO: sistemare sta roba
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
	
	
	public ArrayList<PiattiBean> prelevaInfoPiatti() throws Exception{
		//TODO: sistemare sta roba
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
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
			
			return (ArrayList<PiattiBean>)piattiList;
			
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL prelevaInfoPiatti() failed");
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
			
			System.out.println("MySQL inserisciCliente() confirmed");
		}
		catch (SQLException e) {
			System.out.println("MySQL inserisciCliente() failed");
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
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			// Creo stringa sql
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
			
			System.out.println("MySQL modificaCliente() confirmed");
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
			
			System.out.println("MySQL eliminaCliente() confirmed");
		}
		catch (SQLException e) {
			System.out.println("MySQL connection eliminaCliente() failed");
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
	}// End eliminaCliente()
	
	
	//Controllo Credenziali Login
	//public ArrayList<ClientiBean> ControlloLogin(ClientiBean cliente) throws Exception{
	public ClientiBean ControlloLogin(ClientiBean cliente) throws Exception{
		
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "SELECT * FROM Clienti WHERE Email = '" + cliente.getEmail() + "' AND PassHash = '" + cliente.getPassHash() + "'";
			//System.out.println(sql);
			
			// Committo sul server e prendo il valore dell'ID se esiste
			ResultSet ricerca = stmt.executeQuery(sql);
			//ArrayList<ClientiBean> DbList = new ArrayList<ClientiBean>();
			ClientiBean id = new ClientiBean();
			
			if(ricerca.next()) {//credenziali corrette
				id.setIDCliente(ricerca.getInt("IDCliente"));
				id.setEmail(ricerca.getString("Email"));
				id.setNome(ricerca.getString("Nome"));
				id.setCognome(ricerca.getString("Cognome"));
				id.setLivAutorizzazioni(ricerca.getInt("LivAutorizzazioni"));
				id.setIndirizzo(ricerca.getString("Indirizzo"));
				id.setComune(ricerca.getString("Comune"));
				id.setLingua(ricerca.getString("Lingua"));
				id.setNotificaEmail(ricerca.getBoolean("NotificaEmail"));
				id.setGeolocalizzazione(ricerca.getBoolean("Geolocalizzazione"));
				id.setPuntiFedelta(ricerca.getInt("PuntiFedelta"));
				//DbList.add(id);
				//System.out.println(id.getIDCliente() + " " + id.getLivAutorizzazioni());
			}
			else {//credenziali sbagliate
				id.setIDCliente(-1);
				id.setLivAutorizzazioni(-1);
			}
			//return DbList;
			return id;
		}
		catch (SQLException e) {
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
	}// End ControlloLogin()
	
	//Controllo Esistenza Email per recupero password
	public ClientiBean RecuperoPassword(ClientiBean cliente) throws Exception{
		Statement stmt = null;
		Connection conn = null;
		
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();
			
			// Creo stringa sql
			String sql = "SELECT PassHash FROM Clienti WHERE Email = '" + cliente.getEmail() + "';";
			
			// Committo sul server e prendo il valore della password se esiste
			ResultSet ricerca = stmt.executeQuery(sql);
			ClientiBean password = new ClientiBean();
			
			if(ricerca.next()) {//credenziali corrette
				password.setPassHash(ricerca.getString("PassHash"));
				//System.out.println(password.getPassHash());
			}
			else {//credenziali sbagliate
				password.setPassHash("");
			}
			return password;
		}
		catch (SQLException e) {
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
	}// End RecuperoPassword()
}

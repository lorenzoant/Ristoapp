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
	
	
	//inserisciPiatto
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
			System.out.println("MySQL connection prelevaInfoPiatti() failed");
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
	
}

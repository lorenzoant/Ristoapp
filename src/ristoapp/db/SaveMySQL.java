package ristoapp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import ristoapp.bean.PiattiBean;

public class SaveMySQL {

	// Parametri di accesso al database
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://localhost:3306/ristoapp_db";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "toor";
	
	
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
					piatto.getFoto() + "','" + 
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
	
}

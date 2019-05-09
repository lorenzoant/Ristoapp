package ristoapp.db;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


import ristoapp.bean.ClientiBean;
import ristoapp.bean.PiattiBean;
import ristoapp.bean.PrenotazioniBean;
import ristoapp.bean.PrenotazioniDettagliBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.bean.CarteBean;
import ristoapp.bean.QueryIntroitiBean;
import ristoapp.bean.QueryPiattiPrenotatiBean;
import ristoapp.bean.QueryStatisticheBean;


public class SaveMySQL {

	// Parametri di accesso al database
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_CONNECTION = "jdbc:mysql://lorenzoantoniazzi.ddns.net/theristoapp";
	private static final String DB_USER = "ristoapp";
	private static final String DB_PASSWORD = "$@x9Wq7XTjN#-J^v";


	public static Connection getDBConnection() throws Exception {

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
	
	public PrenotazioniBean prelevaPrenotazione(int idpren) throws Exception{ // Tazza

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Prenotazioni WHERE IDPren = " + idpren + " ORDER BY Data DESC;";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<PrenotazioniBean> prenotazioniList = new ArrayList<PrenotazioniBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				PrenotazioniBean prenotazione = new PrenotazioniBean();
				prenotazione.setIDPrenotazione(resultList.getInt("IDPrenotazione"));
				prenotazione.setIDFRistorante(resultList.getInt("IDFRistorante"));
				prenotazione.setIDFCatPrenotazione(resultList.getInt("IDFCatPrenotazione"));
				prenotazione.setIDFCliente(resultList.getInt("IDFCliente"));
				prenotazione.setData(resultList.getString("Data"));
				prenotazione.setOra(resultList.getString("Ora"));
				prenotazione.setStatoPagamento(resultList.getBoolean("StatoPagamento"));
				prenotazione.setNumeroPersone(resultList.getString("NumeroPersone"));
				prenotazioniList.add(prenotazione);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() confirmed");
			return (ArrayList<PrenotazioniBean>)prenotazioniList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() failed");
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
	}// End prelevaPrenotazione()


	public ArrayList<PrenotazioniBean> prelevaPrenotazioniCliente(ClientiBean cliente) throws Exception{ // Tazza

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Prenotazioni WHERE IDFCliente = " + cliente.getIDCliente() + " ORDER BY Data DESC;";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<PrenotazioniBean> prenotazioniList = new ArrayList<PrenotazioniBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				PrenotazioniBean prenotazione = new PrenotazioniBean();
				prenotazione.setIDPrenotazione(resultList.getInt("IDPrenotazione"));
				prenotazione.setIDFRistorante(resultList.getInt("IDFRistorante"));
				prenotazione.setIDFCatPrenotazione(resultList.getInt("IDFCatPrenotazione"));
				prenotazione.setIDFCliente(resultList.getInt("IDFCliente"));
				prenotazione.setData(resultList.getString("Data"));
				prenotazione.setOra(resultList.getString("Ora"));
				prenotazione.setStatoPagamento(resultList.getBoolean("StatoPagamento"));
				prenotazione.setNumeroPersone(resultList.getString("NumeroPersone"));
				prenotazioniList.add(prenotazione);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() confirmed");
			return (ArrayList<PrenotazioniBean>)prenotazioniList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() failed");
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
	}// End prelevaPrenotazioniCliente()
	

	public int nuovaPrenotazione(PrenotazioniBean prenotazione) throws Exception {
		Statement stmt = null;
		Connection conn = null;
		//Creo un resultset per prendere l'id alla fine
		ResultSet rs = null;
		int id=0;
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			int bol = 0;
			
			if(prenotazione.getStatoPagamento())
				bol=1;

			String sql = "INSERT INTO Prenotazioni (IDPrenotazione, IDFRistorante, IDFCatPrenotazione, IDFCliente, Data, Ora, StatoPagamento, NumeroPersone) VALUES ('" +
						prenotazione.getIDPrenotazione() + "','" +
						prenotazione.getIDFRistorante() + "','" +
						prenotazione.getIDFCatPrenotazione() + "','" +
						prenotazione.getIDFCliente() + "','" +
						prenotazione.getData() + "','" +
						prenotazione.getOra() + "','" +
						bol + "','" +
						prenotazione.getNumeroPersone() + "');";

			// Committo sul server

			stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
			rs= stmt.getGeneratedKeys();
			if(rs.next())
			id= rs.getInt(1);
			System.out.println("MySQL nuovaPrenotazione() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL nuovaPrenotazione() failed");
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
			System.out.println("il tuo id � "+ id);
			return id;
	}//End nuovaPrenotazione()


	public void inserisciDettagli(ArrayList<PrenotazioniDettagliBean> dettagli) throws Exception{
		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			
			for(int i=0; i<dettagli.size(); i++) {
			
			String sql = "INSERT INTO PrenotazioniDettagli (IDFOrdine, IDFPiatto, Prezzo, Sconto, Quantita) VALUES ('" +
						dettagli.get(i).getIDFOrdine() + "','" +
						dettagli.get(i).getIDFPiatto() + "','" +
						dettagli.get(i).getPrezzo() + "','" +
						dettagli.get(i).getSconto() + "','" +
						dettagli.get(i).getQuantita() + "');";

				// Committo sul server
				stmt.executeUpdate(sql);
			}
			

			System.out.println("MySQL inserisciDettagli() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL inserisciDettagli() failed");
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
	}//End inserisciDettagli()
	
	public double prezzopiatto(int piatto) throws Exception{  // TAZZA

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT Prezzo FROM Piatti WHERE IDPiatto = " + piatto + ";";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			resultList.next();

			System.out.println("MySQL prelevaPiattRistorante() confirmed");
			return resultList.getDouble("Prezzo");
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPiattRistorante() failed");
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
	}// End prezzopiatto()


	public ArrayList<PiattiBean> prelevaPiattRistorante(int risto) throws Exception{  // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Piatti WHERE IDFRistorante = " + risto + ";";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<PiattiBean> piattiList = new ArrayList<PiattiBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				PiattiBean piatto = new PiattiBean();
				piatto.setIDPiatto(resultList.getInt("IDPiatto"));
				piatto.setIDFRistorante(resultList.getInt("IDFRistorante"));
				piatto.setIDFCatPiatto(resultList.getInt("IDFCatPiatto"));
				piatto.setNome(resultList.getString("Nome"));
				piatto.setPrezzo(resultList.getDouble("Prezzo"));
				piatto.setDisponibile(resultList.getBoolean("Disponibile"));
				piatto.setDescrizione(resultList.getString("Descrizione"));
				piatto.setUrl(resultList.getString("Foto"));
				piatto.setAllergeni(resultList.getString("Allergeni"));
				piattiList.add(piatto);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaPiattRistorante() confirmed");
			return (ArrayList<PiattiBean>)piattiList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPiattRistorante() failed");
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
	}// End prelevaPiattRistorante()


	public void modificaPrenotazione(PrenotazioniBean prenotazione) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Prenotazioni SET" +
					"IDFRistorante = '" + prenotazione.getIDFRistorante()+ "'," +
					"IDFCatPrenotazione = '" + prenotazione.getIDFCatPrenotazione()+ "'," +
					//"IDFCliente = '" + prenotazione.getIDFCliente()+ "'," +
					"Data = '" + prenotazione.getData()+ "'," +
					"Ora = '" + prenotazione.getOra()+ "'," +
					"NumeroPersone = '" + prenotazione.getNumeroPersone()+ "'," +
					"WHERE IDPrenotazione = '" + prenotazione.getIDPrenotazione() + "'";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL modificaPrenotazione() confirmed");
		}
		catch (SQLException e) {
			System.out.println("MySQL modificaPrenotazione() failed");
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
	}// End modificaPrenotazione()


	public void eliminaPrenotazione(PrenotazioniBean prenotazione) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "DELETE FROM Prenotazioni" +
					"WHERE IDPrenotazione = '" + prenotazione.getIDPrenotazione() + "'";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL eliminaPrenotazione() confirmed");
		}
		catch (SQLException e) {
			System.out.println("MySQL eliminaPrenotazione() failed");
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
	}// End eliminaPrenotazione()



	public void inserisciPiatto(PiattiBean piatto) throws Exception{ // Vellons

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


	public void aggiornaPiatto(PiattiBean piatto) throws Exception{ // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Piatti SET "
					+ "IDFCatPiatto = " +  piatto.getIDFCatPiatto()
					+ ", Nome = '" + piatto.getNome()
					+ "', Prezzo = '" + piatto.getPrezzo()
					+ "', Disponibile = '";
					if(piatto.getDisponibile()) sql += "1',";
					else sql += "0',";
					sql += " Descrizione = '" + piatto.getDescrizione()
					+ "', Foto = '" + piatto.getUrl()
					+ "', Allergeni = '" + piatto.getAllergeni()
					+ "' WHERE IDPiatto = " + piatto.getIDPiatto() + ";";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL aggiornaPiatto() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL aggiornaPiatto() failed");
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
	}// End aggiornaPiatto()


	public RistorantiBean getInfoRistoranteDalProprietario(ClientiBean ristoratore) throws Exception{ // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Ristoranti WHERE IDFCliente = " + ristoratore.getIDCliente() + ";";
			ResultSet result = stmt.executeQuery(sql);
			RistorantiBean risto = new RistorantiBean();

			if(result.next()) { // Prelevo i dati dalla prima riga del risultato
				risto.setIDRistorante(result.getInt("IDRistorante"));
				risto.setIDFCatCucina(result.getInt("IDFCatCucina"));
				risto.setIDFCliente(result.getInt("IDFCliente"));
				risto.setNome(result.getString("Nome"));
				risto.setCoordinataLat(result.getInt("CoordinataLat"));
				risto.setCoordinataLon(result.getDouble("CoordinataLon"));
				risto.setIndirizzo(result.getString("Indirizzo"));
				risto.setTelefono(result.getString("Telefono"));
				risto.setEmail(result.getString("Email"));
				risto.setComune(result.getString("Comune"));
				risto.setDescrizione(result.getString("Descrizione"));
				risto.setSerScegliTavolo(result.getBoolean("SerScegliTavolo"));
				risto.setSerClimatizzazione(result.getBoolean("SerClimatizzazione"));
				risto.setSerAnimali(result.getBoolean("SerAnimali"));
				risto.setSerWifi(result.getBoolean("SerWifi"));
				risto.setSerDisabili(result.getBoolean("SerDisabili"));
				risto.setSerParcheggio(result.getBoolean("SerParcheggio"));

				System.out.println("MySQL getInfoRistoranteDalProprietario() confirmed");
				return risto;
			}
			else {
				// Restituisco oggetto vuoto
				return risto;
			}

		}
		catch (SQLException e) {
			System.out.println("MySQL getInfoRistoranteDalProprietario() failed");
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
	}// End getInfoRistoranteDalProprietario()


	public ArrayList<PiattiBean> prelevaPiattRistorante(RistorantiBean risto) throws Exception{  // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Piatti WHERE IDFRistorante = " + risto.getIDRistorante() + ";";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<PiattiBean> piattiList = new ArrayList<PiattiBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				PiattiBean piatto = new PiattiBean();
				piatto.setIDPiatto(resultList.getInt("IDPiatto"));
				piatto.setIDFRistorante(resultList.getInt("IDFRistorante"));
				piatto.setIDFCatPiatto(resultList.getInt("IDFCatPiatto"));
				piatto.setNome(resultList.getString("Nome"));
				piatto.setPrezzo(resultList.getDouble("Prezzo"));
				piatto.setDisponibile(resultList.getBoolean("Disponibile"));
				piatto.setDescrizione(resultList.getString("Descrizione"));
				piatto.setUrl(resultList.getString("Foto"));
				piatto.setAllergeni(resultList.getString("Allergeni"));
				piattiList.add(piatto);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaPiattRistorante() confirmed");
			return (ArrayList<PiattiBean>)piattiList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPiattRistorante() failed");
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
	}// End prelevaPiattRistorante()


	public ArrayList<PrenotazioniBean> prelevaPrenotazioniRistoranteTraDueDate(RistorantiBean risto) throws Exception{ // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");	
			Date today = Calendar.getInstance().getTime(); // Oggi
			Date range1 = Calendar.getInstance().getTime();
			Date range2 = Calendar.getInstance().getTime(); 
			range1.setTime(today.getTime() - (long)7*1000*60*60*24); // Andando nel passato
			range2.setTime(today.getTime() + (long)30*1000*60*60*24); // Andando nel futuro
			
			String range1_str = df.format(range1);
			String range2_str = df.format(range2);
			
			// Creo stringa sql per prenotazioni ultima settimana
			String sql = "SELECT * FROM Prenotazioni WHERE IDFRistorante = " + risto.getIDRistorante() + " AND Data BETWEEN ' " + range1_str + "' AND '" + range2_str + "' ORDER BY Data DESC;";
			System.out.println(sql);
			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<PrenotazioniBean> prenotazioniList = new ArrayList<PrenotazioniBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				PrenotazioniBean prenotazione = new PrenotazioniBean();
				prenotazione.setIDPrenotazione(resultList.getInt("IDPrenotazione"));
				prenotazione.setIDFRistorante(resultList.getInt("IDFRistorante"));
				prenotazione.setIDFCatPrenotazione(resultList.getInt("IDFCatPrenotazione"));
				prenotazione.setIDFCliente(resultList.getInt("IDFCliente"));
				prenotazione.setData(resultList.getString("Data"));
				prenotazione.setOra(resultList.getString("Ora"));
				prenotazione.setStatoPagamento(resultList.getBoolean("StatoPagamento"));
				prenotazione.setNumeroPersone(resultList.getString("NumeroPersone"));
				prenotazioniList.add(prenotazione);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() confirmed");
			return (ArrayList<PrenotazioniBean>)prenotazioniList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaPrenotazioniRistoranteTraDueDate() failed");
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
	}// End prelevaPrenotazioniRistoranteTraDueDate()


	public ArrayList<QueryPiattiPrenotatiBean> prelevaDettagliPrenotazioneConPiatti(int idPrenotazione) throws Exception{ // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM PrenotazioniDettagli INNER JOIN Piatti ON IDFPiatto = IDPiatto"
					+ " WHERE IDFOrdine = " + idPrenotazione + ";";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<QueryPiattiPrenotatiBean> prenotazioniList = new ArrayList<QueryPiattiPrenotatiBean>();

			while(resultList.next()){
				// Scorro tutte le righe del risultato
				QueryPiattiPrenotatiBean p = new QueryPiattiPrenotatiBean();
				p.setIDPrenotazioneDett(resultList.getInt("IDPrenotazioneDett"));
				p.setIDFOrdine(resultList.getInt("IDFOrdine"));
				p.setIDFPiatto(resultList.getInt("IDFPiatto"));
				p.setPrezzo(resultList.getFloat("Prezzo"));
				p.setSconto(resultList.getInt("Sconto"));
				p.setQuantita(resultList.getInt("Quantita"));
				p.setIDFCatPiatto(resultList.getInt("IDFCatPiatto"));
				p.setNome(resultList.getString("Nome"));
				p.setUrl(resultList.getString("Foto"));
				prenotazioniList.add(p);// Aggiungo al vettore
			}

			System.out.println("MySQL prelevaDettagliPrenotazioneConPiatti() confirmed");
			return (ArrayList<QueryPiattiPrenotatiBean>)prenotazioniList;
		}
		catch (SQLException e) {
			System.out.println("MySQL prelevaDettagliPrenotazioneConPiatti() failed");
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
	}// End prelevaDettagliPrenotazioneConPiatti()


	public void inserisciCliente(ClientiBean cliente) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			// Creo stringa sql
			Date data = new Date();
			SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

			String sql = "INSERT INTO Clienti(IDCliente, Email, PassHash, nome, cognome, LivAutorizzazioni, Indirizzo, Comune, Lingua, NotificaEmail, Geolocalizzazione, CodicePass, DataRegistrazione) VALUES('" +
					cliente.getIDCliente() + "','" +
					cliente.getEmail() + "','" +
					cliente.getPassHash() + "','" +
					cliente.getNome() + "','" +
					cliente.getCognome() + "','" +
					cliente.getLivAutorizzazioni() + "','" +
					cliente.getIndirizzo() + "','" +
					cliente.getComune() + "'," +
					cliente.getLivAutorizzazioni() + ",'" ;
					//cliente.getLingua() + "','";
					if (cliente.getNotificaEmail()) sql += "1','";
					else sql += "0','";
					if (cliente.getGeolocalizzazione()) sql += "1','";
					else sql += "0','";
			sql = sql + cliente.getCodicePass() + "','"+ formato.format(data) +"')";
			//System.out.println(sql);
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
			// Disattivo auto commit al database: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Clienti SET "
					+ "Email = '" + cliente.getEmail()
					+ "',Nome = '" + cliente.getNome()
					+ "',Cognome = '" + cliente.getCognome()
					+ "',Indirizzo = '" + cliente.getIndirizzo()
					+ "',Comune = '" + cliente.getComune()
					+ "',NotificaEmail = '";
					if(cliente.getNotificaEmail()) sql += "1',";
					else sql += "0',";
					sql += "Geolocalizzazione = '" ;
					if(cliente.getGeolocalizzazione()) sql += "1'";
					else sql += "0'";
					sql += " WHERE IDCliente = '" + cliente.getIDCliente() + "';";

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

			// Creo stringa sql per verificare l'esistenza della email
			String sql = "SELECT IDCliente, CodicePass FROM Clienti WHERE Email = '" + cliente.getEmail() + "';";

			// Committo sul server e prendo il valore dell'id se esiste
			ResultSet ricerca = stmt.executeQuery(sql);
			ClientiBean id = new ClientiBean();

			if(ricerca.next()) {//credenziali corrette
				id.setIDCliente(ricerca.getInt("IDCliente"));
				id.setCodicePass(ricerca.getInt("CodicePass"));
				id.setEmail(cliente.getEmail());
				//System.out.println(password.getPassHash());
			}
			else {//credenziali sbagliate
				id.setIDCliente(-1);
			}
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
	}// End RecuperoPassword()


	//modifica della password con controllo codice
	public int ModificaPassword(ClientiBean cliente) throws Exception{
		//controllare se codice corretto e modificare la password con quella nuova da passare ad sha
		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Clienti SET PassHash = '" + cliente.getPassHash() + "', CodicePass = " + cliente.getCodicePass() + " WHERE Email = '" + cliente.getEmail() + "';";

			// Committo sul server e prendo il valore della password se esiste
			int ricerca = stmt.executeUpdate(sql);

			if(ricerca > 0) {//modifica password avvenuta con successo
				return 1;
			}
			else {//modifica non riuscita
				return 0;
			}
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
	}// End modificapassword()


	public PrenotazioniBean getInfoPagamenti(CarteBean carta) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Prenotazioni INNER JOIN Clienti INNER JOIN Carte ON Prenotazioni.IDFCliente = Clienti.IDCliente ON Carte.IDFCliente = Clienti.IDCliente WHERE Carte.IDCarta = " + carta.getIDCarta() + ";";
			ResultSet result = stmt.executeQuery(sql);
			PrenotazioniBean prenota = new PrenotazioniBean();

			if(result.next()) { // Prelevo i dati dalla prima riga del risultato
				prenota.setIDPrenotazione(result.getInt("IDPrenotazione"));
				prenota.setIDFRistorante(result.getInt("IDFRistorante"));
				prenota.setIDFCatPrenotazione(result.getInt("IDFCatPrenotazione"));
				prenota.setIDFCliente(result.getInt("IDFCliente"));
				prenota.setData(result.getString("Data"));
				//prenota.setOra(result.getTime("Ora"));
				prenota.setStatoPagamento(result.getBoolean("StatoPagamento"));
				prenota.setNumeroPersone(result.getString("NumeroPersone"));


				return prenota;
			}
			else {
				// Restituisco oggetto vuoto
				return prenota;
			}

		}
		catch (SQLException e) {
			System.out.println("MySQL getInfoPagamenti() failed");
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
	}// End getInfoPagamenti()

	public void setPagamento(PrenotazioniBean prenotazione) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Prenotazioni SET" +
					"StatoPagamento = '1'," +
					"WHERE IDPrenotazione = '" + prenotazione.getIDPrenotazione() + "'";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL setPagamento() confirmed");
		}
		catch (SQLException e) {
			System.out.println("MySQL setPagamento() failed");
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
	}// End setPagamento()

	public ArrayList<CarteBean> getInfoCarte(ClientiBean cliente) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Carte WHERE IDFCliente = " + cliente.getIDCliente() + ";";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<CarteBean> carteList = new ArrayList<CarteBean>();
			while(resultList.next()){
				// Scorro tutte le righe del risultato
				CarteBean carta = new CarteBean();
				carta.setIDCarta(resultList.getInt("IDCarta"));
				carta.setIDFCatCarta(resultList.getInt("IDFCatCarta"));
				//carta.setIDFCliente(resultList.getInt("IDFCliete"));
				carta.setPAN(resultList.getInt("PAN"));
				carta.setCVV(resultList.getInt("CVV"));
				carta.setDataScadenza(resultList.getString("DataScadenza"));
				carteList.add(carta);// Aggiungo al vettore
			}

			System.out.println("MySQL getInfoCarte() confirmed");
			return (ArrayList<CarteBean>)carteList;
		}
		catch (SQLException e) {
			System.out.println("MySQL getInfoCarte() failed");
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
	}// End getInfoCarte()

	public void aggiungiCarta(CarteBean carta) throws Exception{
		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "INSERT INTO Carte (IDFCatCarta, IDFCliente, NomeCarta, PAN, CVV, DataScadenza) VALUES ('" +
						carta.getIDFCatCarta() + "','" +
						carta.getIDFCliente() + "','" +
						carta.getNomeCarta() + "','" +
						carta.getPAN() + "','" +
						carta.getCVV() + "','" +
						carta.getDataScadenza() + "');";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL aggiungiCarta() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL aggiungiCarta() failed");
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
	}//End aggiungiCarta()



	//FUNZIONE PER PRENDERE TUTTI I DATI DEL RISTORANTE DAL DATABASE /ARRAYLIST
	public ArrayList<RistorantiBean> InformazioniRistorante() throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql

			String sql = "SELECT * FROM Ristoranti INNER JOIN CategoriaCucina ON Ristoranti.IDFCatCucina = CategoriaCucina.IDCatCucina";

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<RistorantiBean> ristorante = new ArrayList<RistorantiBean>();

			while(resultList.next()){
				// Scorro tutte le righe del risultato

				RistorantiBean ristoset = new RistorantiBean();

				ristoset.setIDRistorante(resultList.getInt("IDRistorante"));
				ristoset.setNomeCatCucina(resultList.getString("CategoriaCucina.Nome"));
				ristoset.setIDFCliente(resultList.getInt("IDFCliente"));
				ristoset.setNome(resultList.getString("Ristoranti.Nome"));
				ristoset.setCoordinataLat(resultList.getDouble("CoordinataLat"));
				ristoset.setCoordinataLon(resultList.getDouble("CoordinataLon"));
				ristoset.setIndirizzo(resultList.getString("Indirizzo"));
				ristoset.setTelefono(resultList.getString("Telefono"));
				ristoset.setEmail(resultList.getString("Email"));
				ristoset.setComune(resultList.getString("Comune"));
				ristoset.setDescrizione(resultList.getString("Descrizione"));
				ristoset.setSerClimatizzazione(resultList.getBoolean("SerClimatizzazione"));
				ristoset.setSerAnimali(resultList.getBoolean("serAnimali"));
				ristoset.setSerWifi(resultList.getBoolean("serWifi"));
				ristoset.setSerDisabili(resultList.getBoolean("SerDisabili"));
				ristoset.setSerParcheggio(resultList.getBoolean("SerParcheggio"));
				ristoset.setNumeroPosti(resultList.getInt("NumeroPosti"));
				ristoset.setUrl(resultList.getString("URL"));

				ristorante.add(ristoset);// Aggiungo al vettore
			}

			return (ArrayList<RistorantiBean>) ristorante;
		}catch (SQLException e) {
			System.out.println("MySQL InformazioneRistorante() failed");
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
	}// END InformazioniRistorante()

	public void inserisciRistorante(RistorantiBean ristorante) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "INSERT INTO Ristoranti(IDFCatCucina, IDFCliente, Nome, CoordinataLat, CoordinataLon, Indirizzo, Telefono, Email, Comune, Descrizione, SerScegliTavolo, SerClimatizzazione, SerAnimali, SerWifi, SerDisabili, SerParcheggio, NumeroPosti, URL) VALUES ('" +
					ristorante.getIDFCatCucina() + "','" +
					ristorante.getIDFCliente() + "','" +
					ristorante.getNome() +  "','" +
					ristorante.getCoordinataLat() +  "','" +
					ristorante.getCoordinataLon() +  "','" +
					ristorante.getIndirizzo() + "','" +
					ristorante.getTelefono() + "','" +
					ristorante.getEmail() + "','" +
					ristorante.getComune() + "','" +
					ristorante.getDescrizione() + "','";
					if(ristorante.getSerScegliTavolo()) sql += "1','";
					else sql += "0','";
					if(ristorante.getSerClimatizzazione()) sql += "1','";
					else sql += "0','";
					if(ristorante.getSerAnimali()) sql += "1','";
					else sql += "0','";
					if(ristorante.getSerWifi()) sql += "1','";
					else sql += "0','";
					if(ristorante.getSerDisabili()) sql += "1','";
					else sql += "0','";
					if(ristorante.getSerParcheggio()) sql += "1'";
					else sql += "0'";
					sql += "'" + ristorante.getNumeroPosti() + "', '" +
					ristorante.getUrl() + "');";

			// Committo sul server
			stmt.executeUpdate(sql);

			sql = "UPDATE Clienti SET " +
					"LivAutorizzazioni = '1' " +
					"WHERE IDCliente = '" + ristorante.getIDFCliente() + "'";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL inserisciRistorante() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL inserisciRistorante() failed");
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
	}// End inserisciRistorante()

	public void modificaRistorante(RistorantiBean ristorante) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "UPDATE Ristoranti SET " +
					"IDFCatCucina = '" + ristorante.getIDFCatCucina() + "', " +
					"Nome = '" + ristorante.getNome() + "', " +
					"CoordinataLat = '" + ristorante.getCoordinataLat() + "', " +
					"CoordinataLon = '" + ristorante.getCoordinataLon() + "', " +
					"Indirizzo = '" + ristorante.getIndirizzo() + "', " +
					"Telefono = '" + ristorante.getTelefono() + "', " +
					"Email = '" + ristorante.getEmail() + "', " +
					"Comune = '" + ristorante.getComune() + "', " +
					"Descrizione = '" + ristorante.getDescrizione() + "', " +
					"SerScegliTavolo = ";
					if(ristorante.getSerScegliTavolo()) sql += "'1', ";
					else sql += "'0', ";
					sql += "SerClimatizzazione = ";
					if(ristorante.getSerClimatizzazione()) sql += "'1', ";
					else sql += "'0', ";
					sql += "SerAnimali = ";
					if(ristorante.getSerAnimali()) sql += "'1', ";
					else sql += "'0', ";
					sql += "SerWifi = ";
					if(ristorante.getSerWifi()) sql += "'1', ";
					else sql += "'0', ";
					sql += "SerDisabili = ";
					if(ristorante.getSerDisabili()) sql += "'1', ";
					else sql += "'0', ";
					sql += "SerParcheggio = ";
					if(ristorante.getSerParcheggio()) sql += "'1'";
					else sql += "'0'";
					sql += "NumeroPosti = '" + ristorante.getNumeroPosti() + "', " +
					"URL = '" + ristorante.getUrl() + "'";
					sql += " WHERE IDFCliente = '" + ristorante.getIDFCliente() + "'";

			// Committo sul server
			stmt.executeUpdate(sql);

			System.out.println("MySQL modificaRistorante() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL modificaRistorante() failed");
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
	}// End modificaRistorante()

	//FUNZIONE PER PRENDERE TUTTI I DATI DEi CLIENTI DAL DATABASE /ARRAYLIST
	public ArrayList<ClientiBean> InformazioniClienti(String ordine) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "";
			if(ordine.equalsIgnoreCase("data"))sql = "SELECT * FROM Clienti";
			else sql = "SELECT * FROM Clienti ORDER BY " + ordine;

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<ClientiBean> listaclienti = new ArrayList<ClientiBean>();

			while(resultList.next()){
				// Scorro tutte le righe del risultato
				ClientiBean cliente = new ClientiBean();

				cliente.setEmail(resultList.getString("Email"));
				cliente.setNome(resultList.getString("Nome"));
				cliente.setCognome(resultList.getString("Cognome"));
				cliente.setLivAutorizzazioni(Integer.parseInt(resultList.getString("LivAutorizzazioni")));
				cliente.setIndirizzo(resultList.getString("Indirizzo"));
				cliente.setComune(resultList.getString("Comune"));
				cliente.setLingua(resultList.getString("Lingua"));

				listaclienti.add(cliente);// Aggiungo al vettore
			}

			return (ArrayList<ClientiBean>) listaclienti;
		}catch (SQLException e) {
			System.out.println("MySQL informazioniClienti() failed");
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
	}// END informazioniClienti()

	//FUNZIONE PER PRENDERE TUTTI I DATI RELATIVI ALLE PRENOTAZIONI PER RISTORANTE
	public ArrayList<QueryIntroitiBean> mostraIntroiti(String tempo, String data) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "";
			sql = "SELECT Ristoranti.IDRistorante, Ristoranti.Nome, Ristoranti.Comune, AVG(RecensioniRistoranti.Stelle) AS Stelle, SUM((PrenotazioniDettagli.Prezzo - (PrenotazioniDettagli.Prezzo * PrenotazioniDettagli.Sconto)) * PrenotazioniDettagli.Quantita) AS Ricavi"
					+ " FROM Ristoranti"
					+ " LEFT JOIN RecensioniRistoranti ON RecensioniRistoranti.IDFRistorante = Ristoranti.IDRistorante"
					+ " LEFT JOIN Prenotazioni ON Prenotazioni.IDFRistorante = IDRistorante"
					+ " LEFT JOIN PrenotazioniDettagli ON PrenotazioniDettagli.IDFOrdine = Prenotazioni.IDPrenotazione"
					+ " WHERE Prenotazioni.StatoPagamento = 1";
			if(tempo == "totale") sql = sql + " GROUP BY Ristoranti.IDRistorante";
			else if(tempo == "oggi") sql = sql + " AND DAY(Prenotazioni.Data) = DAY('"+data+"') AND MONTH(Prenotazioni.Data) = MONTH('"+data+"') AND YEAR(Prenotazioni.Data) = YEAR('"+data+"') GROUP BY Ristoranti.IDRistorante";
			else if(tempo == "mese") sql = sql +  " AND MONTH(Prenotazioni.Data) = MONTH('"+data+"') AND YEAR(Prenotazioni.Data) = YEAR('"+data+"') GROUP BY Ristoranti.IDRistorante";
			else if(tempo == "anno") sql = sql +  " AND YEAR(Prenotazioni.Data) = YEAR('"+data+"') GROUP BY Ristoranti.IDRistorante";
			//System.out.println(sql);
			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<QueryIntroitiBean> informazioni = new ArrayList<QueryIntroitiBean>();

			while(resultList.next()){
				// Scorro tutte le righe del risultato
				QueryIntroitiBean introiti = new QueryIntroitiBean();
				introiti.setIDRistorante(Integer.parseInt(resultList.getString("IDRistorante")));
				introiti.setNome(resultList.getString("Nome"));
				introiti.setComune(resultList.getString("Comune"));
				if(resultList.getString("Stelle") == null)introiti.setStelle(0);
				else introiti.setStelle(Double.parseDouble(resultList.getString("Stelle")));
				if(resultList.getString("Ricavi") == null)introiti.setRicavi(0);
				else introiti.setRicavi(Double.parseDouble(resultList.getString("Ricavi")));
				informazioni.add(introiti);// Aggiungo al vettore
			}

			return (ArrayList<QueryIntroitiBean>) informazioni;
		}catch (SQLException e) {
			System.out.println("MySQL mostraIntroiti() failed");
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
	}// END mostraIntroiti()

	//FUNZIONE PER PRENDERE TUTTI I DATI RELATIVI ALLE STATISTICHE DI RISTOAPP
	public ArrayList<QueryStatisticheBean> ottieniStatistiche(String informazioni) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "";
			//System.out.println("informazioni="+informazioni);
			if(informazioni == "prenotazioni") {//numero di prenotazioni per comune del ristorante
				sql = "SELECT Comuni.Nome, COUNT(Prenotazioni.IDPrenotazione) AS NumPrenotazioni "
					+ "FROM Comuni "
					+ "INNER JOIN Ristoranti ON Comuni.Nome = Ristoranti.Comune "
					+ "INNER JOIN Prenotazioni ON Ristoranti.IDRistorante = Prenotazioni.IDFRistorante "
					+ "GROUP BY Comuni.Nome";
			}
			else if(informazioni == "dataprimaregistrazione") {//data prima registrazione
				sql = "SELECT DataRegistrazione "
					+ "FROM Clienti "
					+ "WHERE Clienti.LivAutorizzazioni != 2 "
					+ "ORDER BY DataRegistrazione ASC "
					+ "LIMIT 1";
			}
			else if(informazioni == "dataultimaregistrazione") {//data ultima registrazione
				sql = "SELECT DataRegistrazione "
					+ "FROM Clienti "
					+ "WHERE Clienti.LivAutorizzazioni != 2 "
					+ "ORDER BY DataRegistrazione DESC "
					+ "LIMIT 1";
			}
			else if(informazioni == "registrazioniclienti") {//numero di registrazioni clienti per mese/anno
				sql = "SELECT MONTH(DataRegistrazione) AS mese, YEAR(DataRegistrazione) AS anno, COUNT(IDCliente) AS NumRegistrazioni "
					+ "FROM Clienti "
					+ "WHERE LivAutorizzazioni = 0 "
					+ "GROUP BY mese, anno";
			}
			else if(informazioni == "registrazioniristoranti") {//numero di registrazioni ristoranti per mese/anno
				sql = "SELECT MONTH(DataRegistrazione) AS mese, YEAR(DataRegistrazione) AS anno, COUNT(IDCliente) AS NumRegistrazioni "
					+ "FROM Clienti "
					+ "WHERE LivAutorizzazioni = 1 "
					+ "GROUP BY mese, anno";
			}

			//System.out.println(sql);

			// Eseguo query
			ResultSet resultList = stmt.executeQuery(sql);

			// Estraggo dati
			ArrayList<QueryStatisticheBean> statistiche = new ArrayList<QueryStatisticheBean>();

			while(resultList.next()){
				// Scorro tutte le righe del risultato
				QueryStatisticheBean info = new QueryStatisticheBean();
				if(informazioni == "prenotazioni") {
					if(resultList.getString("Nome") != null)info.setComune(resultList.getString("Nome"));//nome del comune
					if(resultList.getString("NumPrenotazioni") != null)info.setNumPrenotazioni(Integer.parseInt(resultList.getString("NumPrenotazioni")));//numero di prenotazioni
				}
				if(informazioni == "dataprimaregistrazione" || informazioni == "dataultimaregistrazione") {
					if(resultList.getDate("DataRegistrazione") != null)info.setDataRegistrazione(resultList.getDate("DataRegistrazione"));//data prima o ultima registrazione
				}
				if(informazioni == "registrazioniclienti" || informazioni == "registrazioniristoranti") {
					if(resultList.getString("mese") != null)info.setMese(Integer.parseInt(resultList.getString("mese")));//mese registrazione
					if(resultList.getString("anno") != null)info.setAnno(Integer.parseInt(resultList.getString("anno")));//anno registrazione
					if(resultList.getString("NumRegistrazioni") != null)info.setNumRegistrazioni(Integer.parseInt(resultList.getString("NumRegistrazioni")));//data prima o ultima registrazione
				}
				statistiche.add(info);// Aggiungo al vettore
			}
			return (ArrayList<QueryStatisticheBean>) statistiche;
		}catch (SQLException e) {
			System.out.println("MySQL mostraIntroiti() failed");
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
	}// END ottieniStatistiche()


	//QUANTE STELLE HA IL RISTORANTE
	public int stelle_risto(int IDRistorante) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

					// Creo stringa sql


			String sql = "SELECT AVG(Stelle) AS Media "
					+ "FROM RecensioniRistoranti"
					+ " WHERE  IDFRistorante= '" + IDRistorante +"'";

			ResultSet resultList = stmt.executeQuery(sql);
			double ris = 0;

			while(resultList.next()){// Scorro tutte le righe del risultato
				ris = resultList.getInt("Media");
			}
			System.out.println(ris);
			return (int) ris;

		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL stelle() failed");
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

	}

	public ArrayList<RistorantiBean> getInfoRistoID(int IDRistorante) throws Exception{ // Vellons

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Ristoranti WHERE IDRistorante = " + IDRistorante  + ";";
			ResultSet result = stmt.executeQuery(sql);
			ArrayList<RistorantiBean> risto = new ArrayList<RistorantiBean>();

			while(result.next()){
				// Scorro tutte le righe del risultato
				RistorantiBean p = new RistorantiBean();
				p.setIDRistorante(result.getInt("IDRistorante"));
				p.setIDFCatCucina(result.getInt("IDFCatCucina"));
				p.setIDFCliente(result.getInt("IDFCliente"));
				p.setNome(result.getString("Nome"));
				p.setCoordinataLat(result.getInt("CoordinataLat"));
				p.setCoordinataLon(result.getDouble("CoordinataLon"));
				p.setIndirizzo(result.getString("Indirizzo"));
				p.setTelefono(result.getString("Telefono"));
				p.setEmail(result.getString("Email"));
				p.setComune(result.getString("Comune"));
				p.setDescrizione(result.getString("Descrizione"));
				p.setSerScegliTavolo(result.getBoolean("SerScegliTavolo"));
				p.setSerClimatizzazione(result.getBoolean("SerClimatizzazione"));
				p.setSerAnimali(result.getBoolean("SerAnimali"));
				p.setSerWifi(result.getBoolean("SerWifi"));
				p.setSerDisabili(result.getBoolean("SerDisabili"));
				p.setSerParcheggio(result.getBoolean("SerParcheggio"));
				p.setNumeroPosti(result.getInt("NumeroPosti"));
				risto.add(p);// Aggiungo al vettore
			}
			System.out.println("MySQL ristoid() confirmed");
			return (ArrayList<RistorantiBean>)risto;

		}
		catch (SQLException e) {
			System.out.println("MySQL getInfoRistoID() failed");
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
	}

}

package ristoapp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ristoapp.bean.ClientiBean;
import ristoapp.bean.PiattiBean;
import ristoapp.bean.PrenotazioniBean;
import ristoapp.bean.PrenotazioniDettagliBean;
import ristoapp.bean.RistorantiBean;
import ristoapp.bean.CarteBean;

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



	public int nuovaPrenotazione(PrenotazioniBean prenotazione) throws Exception {
		Statement stmt = null;
		Connection conn = null;
		//Creo un resultset per prendere l'id alla fine
		ResultSet rs = null;
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "INSERT INTO Prenotazioni (IDPrenotazione, IDFRistorante, IDFCatPrenotazione, IDFCliente, Data, Ora, StatoPagamento, NumeroPersone) VALUES ('" +
						prenotazione.getIDPrenotazione() + "','" +
						prenotazione.getIDFRistorante() + "','" +
						prenotazione.getIDFCatPrenotazione() + "','" +
						prenotazione.getIDFCliente() + "','" +
						prenotazione.getData() + "','" +
						prenotazione.getOra() + "','" +
						prenotazione.getStatoPagamento() + "','" +
						prenotazione.getNumeroPersone() + "');";

			// Committo sul server
			stmt.executeUpdate(sql);
			rs= stmt.getGeneratedKeys();

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
		if(rs.next())
			return rs.getInt(1);
		else
			return 0;
	}//End nuovaPrenotazione()

	public void inserisciDettagli(PrenotazioniDettagliBean dettagli) throws Exception{
		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "INSERT INTO PrenotazioniDettagli (IDFOrdine, IDFPiatto, Prezzo, Sconto, Quantita) VALUES ('" +
						dettagli.getIDFOrdine() + "','" +
						dettagli.getIDFPiatto() + "','" +
						dettagli.getPrezzo() + "','" +
						dettagli.getSconto() + "','" +
						dettagli.getQuantita() + "');";

			// Committo sul server
			stmt.executeUpdate(sql);

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
	}//End inserisciDettagli()

	public ResultSet listaPiatti(int risto) throws Exception {
		Statement stmt = null;
		Connection conn = null;
		//Creo un resultset per prendere l'id alla fine
		ResultSet rs = null;
		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			String sql = "SELECT * FROM Piatti INNER JOIN CategoriaPiatti ON Piatti.IDFCatPiatto = CategoriaPiatti.IDCatPiatto WHERE Piatti.IDFRistorante = " + risto + " ORDER BY CategoriaPiatti.Nome;";

			// Eseguo la query
			rs = stmt.executeQuery(sql);

			System.out.println("MySQL nuovaPrenotazione() confirmed");
		}
		catch (SQLException e) {
			// Se ricevo un errore vabbè che ci devo fare...
			System.out.println("MySQL nuovaPrenotazione() failed");
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
			//Restituisco il resultset
			return rs;
	}//End listaPiatti()


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
			System.out.println("MySQL connection modificaPrenotazione() failed");
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
			System.out.println("MySQL connection eliminaPrenotazione() failed");
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

		// TODO: aggiungere le due date nella query (Vellons)
		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Prenotazioni WHERE IDFRistorante = " + risto.getIDRistorante() + ";";

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
			String sql = "INSERT INTO Clienti(IDCliente, Email, PassHash, nome, cognome, LivAutorizzazioni, Indirizzo, Comune, Lingua, NotificaEmail, Geolocalizzazione) VALUES('" +
					cliente.getIDCliente() + "','" + 
					cliente.getEmail() + "','" + 
					cliente.getPassHash() + "','" + 
					cliente.getNome() + "','" + 
					cliente.getCognome() + "','" + 
					cliente.getLivAutorizzazioni() + "','" + 
					cliente.getIndirizzo() + "','" + 
					cliente.getComune() + "','" + 
					cliente.getLingua() + "','";
					if (cliente.getNotificaEmail()) sql += "1','";
					else sql += "0','"; 
					if (cliente.getGeolocalizzazione()) sql += "1','";
					else sql += "0');";
			
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
			String sql = "UPDATE Clienti SET " +
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
				//prenota.setStatoPagamento(result.getBoolean("StatoPagamento"));
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
			String sql = "INSERT INTO Ristoranti(IDFCatCucina, IDFCliente, Nome, CoordinataLat, CoordinataLon, Indirizzo, Telefono, Email, Comune, Descrizione, SerScegliTavolo, SerClimatizzazione, SerAnimali, SerWifi, SerDisabili, SerParcheggio) VALUES ('" +
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
					if(ristorante.getSerParcheggio()) sql += "1');";
					else sql += "0');";

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

	//FUNZIONE PER PRENDERE TUTTI I DATI DEL RISTORANTE DAL DATABASE /ARRAYLIST
public ArrayList<RistorantiBean> InformazioniRistorante() throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			stmt = conn.createStatement();

			// Creo stringa sql

			String sql = "SELECT * FROM Ristoranti LEFT JOIN CategoriaCucina ON Ristoranti.IDFCatCucina = CategoriaCucina.IDCatCucina";

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
	}// END

	public RistorantiBean selectRistorante(int id) throws Exception{

		Statement stmt = null;
		Connection conn = null;

		try {
			// Creo la connessione al database
			conn = getDBConnection();
			// Disattivo auto commit al databse: decido da codice quando committare
			conn.setAutoCommit(false);
			stmt = conn.createStatement();

			// Creo stringa sql
			String sql = "SELECT * FROM Ristoranti INNER JOIN Clienti  ON Ristoranti.IDFCliente = Clienti.IDCliente WHERE Clienti.IDCliente = '" + id + "';";
			ResultSet result = stmt.executeQuery(sql);

			RistorantiBean ristorante = new RistorantiBean();

			if(result.next()) {
				ristorante.setIDFCatCucina(result.getInt("IDFCatCucina"));
				ristorante.setIDFCliente(result.getInt("IDFCliente"));
				ristorante.setNome(result.getString("Nome"));
				ristorante.setCoordinataLat(result.getInt("CoordinataLat"));
				ristorante.setCoordinataLon(result.getInt("CoordinataLon"));
				ristorante.setIndirizzo(result.getString("Indirizzo"));
				ristorante.setTelefono(result.getString("Telefono"));
				ristorante.setEmail(result.getString("Email"));
				ristorante.setComune(result.getString("Comune"));
				ristorante.setDescrizione(result.getString("Descrizione"));
				ristorante.setSerScegliTavolo(result.getBoolean("SerScegliTavolo"));
				ristorante.setSerClimatizzazione(result.getBoolean("SerClimatizzazione"));
				ristorante.setSerAnimali(result.getBoolean("SerAnimali"));
				ristorante.setSerWifi(result.getBoolean("SerWifi"));
				ristorante.setSerDisabili(result.getBoolean("SerDisabili"));
				ristorante.setSerParcheggio(result.getBoolean("SerParcheggio"));
			}
			System.out.println("MySQL selectRistorante() confirmed");

			return ristorante;
		}
		catch (SQLException e) {
			// Se ricevo un errore faccio il rollback
			System.out.println("MySQL selectRistorante() failed");
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
	}// End selectRistorante()

}

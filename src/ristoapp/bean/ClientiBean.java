package ristoapp.bean;

import java.util.ArrayList;

public class ClientiBean implements java.io.Serializable{

	private static final long serialVersionUID = -8693558659224935735L;
	
	private int IDCliente;
	private String Email;
	private String PassHash;
	private String nome;
	private String cognome;
	private int  LivAutorizzazioni;
	private String Indirizzo;
	private String Comune;
	private String Lingua;
	private Boolean NotificaEmail;
	private Boolean Geolocalizzazione;
	private int PuntiFedelt�;
	
	private ArrayList<AbbonamentoRistBean> Abbonamenti;
	private ArrayList<RecensionePiattiBean> Recensione;
	private ArrayList<CarteBean> Carte;
	private ArrayList<RecensioniRistorantiBean> Recensioni_Ristoranti;
	private ArrayList<PrenotazioniBean> Prenotazioni;
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassHash() {
		return PassHash;
	}
	public void setPassHash(String passHash) {
		PassHash = passHash;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public int getLivAutorizzazioni() {
		return LivAutorizzazioni;
	}
	public void setLivAutorizzazioni(int livAutorizzazioni) {
		LivAutorizzazioni = livAutorizzazioni;
	}
	public int getIDCliente() {
		return IDCliente;
	}
	public void setIDCliente(int iDCliente) {
		IDCliente = iDCliente;
	}
	public String getIndirizzo() {
		return Indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		Indirizzo = indirizzo;
	}
	public String getComune() {
		return Comune;
	}
	public void setComune(String comune) {
		Comune = comune;
	}
	public String getLingua() {
		return Lingua;
	}
	public void setLingua(String lingua) {
		Lingua = lingua;
	}
	public Boolean getNotificaEmail() {
		return NotificaEmail;
	}
	public void setNotificaEmail(Boolean notificaEmail) {
		NotificaEmail = notificaEmail;
	}
	public Boolean getGeolocalizzazione() {
		return Geolocalizzazione;
	}
	public void setGeolocalizzazione(Boolean geolocalizzazione) {
		Geolocalizzazione = geolocalizzazione;
	}
	public int getPuntiFedelt�() {
		return PuntiFedelt�;
	}
	public void setPuntiFedelt�(int puntiFedelt�) {
		PuntiFedelt� = puntiFedelt�;
	}
	public ArrayList<RecensionePiattiBean> getRecensione() {
		return Recensione;
	}
	public void setRecensione(ArrayList<RecensionePiattiBean> recensione) {
		Recensione = recensione;
	}
	public ArrayList<CarteBean> getCarte() {
		return Carte;
	}
	public void setCarte(ArrayList<CarteBean> carte) {
		Carte = carte;
	}
	public ArrayList<RecensioniRistorantiBean> getRecensioni_Ristoranti() {
		return Recensioni_Ristoranti;
	}
	public void setRecensioni_Ristoranti(ArrayList<RecensioniRistorantiBean> recensioni_Ristoranti) {
		Recensioni_Ristoranti = recensioni_Ristoranti;
	}
	public ArrayList<PrenotazioniBean> getPrenotazioni() {
		return Prenotazioni;
	}
	public void setPrenotazioni(ArrayList<PrenotazioniBean> prenotazioni) {
		Prenotazioni = prenotazioni;
	}
	public ArrayList<AbbonamentoRistBean> getAbbonamenti() {
		return Abbonamenti;
	}
	public void setAbbonamenti(ArrayList<AbbonamentoRistBean> abbonamenti) {
		Abbonamenti = abbonamenti;
	}
}

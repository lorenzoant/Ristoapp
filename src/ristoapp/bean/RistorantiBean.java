package ristoapp.bean;

import java.util.ArrayList;

public class RistorantiBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6070275137017810180L;
	
	private int IDRistorante;
	private int IDFCatCucina;
	private int IDFCliente;
	private String Nome;
	private int CoordinataLat;
	private int CoordinataLon;
	private String Indirizzo;
	private String Telefono;
	private String Email;
	private String Comune;
	private String Descrizione;
	private Boolean SerScegliTavolo;
	private Boolean SerClimatizzazione;
	private Boolean SerAnimali;
	private Boolean SerWifi;
	private Boolean SerDisabili;
	private Boolean SerParcheggio;
	
	//per collegarlo alle altre tabelle
	private ArrayList<PiattiBean> Piatti;
	private ArrayList<OfferteBean> Offerte;
	private ArrayList<PrenotazioniBean> Prenotazioni;
	private ArrayList<RecensioniRistoBean> RecensioniRistoranti;
	
	public int getIDRistorante() {
		return IDRistorante;
	}
	public void setIDRistorante(int iDRistorante) {
		IDRistorante = iDRistorante;
	}
	public int getIDFCatCucina() {
		return IDFCatCucina;
	}
	public void setIDFCatCucina(int iDFCatCucina) {
		IDFCatCucina = iDFCatCucina;
	}
	public int getIDFCliente() {
		return IDFCliente;
	}
	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public int getCoordinataLat() {
		return CoordinataLat;
	}
	public void setCoordinataLat(int coordinataLat) {
		CoordinataLat = coordinataLat;
	}
	public int getCoordinataLon() {
		return CoordinataLon;
	}
	public void setCoordinataLon(int coordinataLon) {
		CoordinataLon = coordinataLon;
	}
	public String getIndirizzo() {
		return Indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		Indirizzo = indirizzo;
	}
	public String getTelefono() {
		return Telefono;
	}
	public void setTelefono(String telefono) {
		Telefono = telefono;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getComune() {
		return Comune;
	}
	public void setComune(String comune) {
		Comune = comune;
	}
	public String getDescrizione() {
		return Descrizione;
	}
	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
	public Boolean getSerScegliTavolo() {
		return SerScegliTavolo;
	}
	public void setSerScegliTavolo(Boolean serScegliTavolo) {
		SerScegliTavolo = serScegliTavolo;
	}
	public Boolean getSerClimatizzazione() {
		return SerClimatizzazione;
	}
	public void setSerClimatizzazione(Boolean serClimatizzazione) {
		SerClimatizzazione = serClimatizzazione;
	}
	public Boolean getSerAnimali() {
		return SerAnimali;
	}
	public void setSerAnimali(Boolean serAnimali) {
		SerAnimali = serAnimali;
	}
	public Boolean getSerWifi() {
		return SerWifi;
	}
	public void setSerWifi(Boolean serWifi) {
		SerWifi = serWifi;
	}
	public Boolean getSerDisabili() {
		return SerDisabili;
	}
	public void setSerDisabili(Boolean serDisabili) {
		SerDisabili = serDisabili;
	}
	public Boolean getSerParcheggio() {
		return SerParcheggio;
	}
	public void setSerParcheggio(Boolean serParcheggio) {
		SerParcheggio = serParcheggio;
	}
	
	public ArrayList<PiattiBean> getPiatti() {
		return Piatti;
	}
	public void setRistorantePiatti(ArrayList<PiattiBean> Piatti) {
		this.Piatti = Piatti;
	}
	public ArrayList<OfferteBean> getOfferte() {
		return Offerte;
	}
	public void setOfferte(ArrayList<OfferteBean> offerte) {
		Offerte = offerte;
	}
	public ArrayList<PrenotazioniBean> getPrenotazioni() {
		return Prenotazioni;
	}
	public void setPrenotazioni(ArrayList<PrenotazioniBean> prenotazioni) {
		Prenotazioni = prenotazioni;
	}
	public ArrayList<RecensioniRistoBean> getRecensioniRistoranti() {
		return RecensioniRistoranti;
	}
	public void setRecensioniRisto(ArrayList<RecensioniRistoBean> recensioniRistoranti) {
		RecensioniRistoranti = recensioniRistoranti;
	}
}

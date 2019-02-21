package ristoapp.bean;

import java.util.ArrayList;

public class PiattiBean implements java.io.Serializable{

	private static final long serialVersionUID = -8288694045192882180L;
	
	private int IDPiatto;
	private int IDFRistorante;
	private int IDFCatPiatto;
	private String Nome;
	private double Prezzo;
	private Boolean Disponibile;
	private String Descrizione;
	private String Url;
	private String Allergeni;
	
	//per collegarlo alle altre tabelle
	private ArrayList<OfferteBean> Offerte;
	private ArrayList<PrenotazioniDettagliBean> PrenotazioniDettagli;
	private ArrayList<RecensionePiattiBean> RecensioniPiatti;
	
	public int getIDPiatto() {
		return IDPiatto;
	}
	public void setIDPiatto(int iDPiatto) {
		IDPiatto = iDPiatto;
	}
	public int getIDFRistorante() {
		return IDFRistorante;
	}
	public void setIDFRistorante(int iDFRistorante) {
		IDFRistorante = iDFRistorante;
	}
	public int getIDFCatPiatto() {
		return IDFCatPiatto;
	}
	public void setIDFCatPiatto(int iDFCatPiatto) {
		IDFCatPiatto = iDFCatPiatto;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public double getPrezzo() {
		return Prezzo;
	}
	public void setPrezzo(double prezzo) {
		Prezzo = prezzo;
	}
	public Boolean getDisponibile() {
		return Disponibile;
	}
	public void setDisponibile(Boolean disponibile) {
		Disponibile = disponibile;
	}
	public String getDescrizione() {
		return Descrizione;
	}
	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	public String getAllergeni() {
		return Allergeni;
	}
	public void setAllergeni(String allergeni) {
		Allergeni = allergeni;
	}
	public ArrayList<PrenotazioniDettagliBean> getPrenotazioniDettagli() {
		return PrenotazioniDettagli;
	}
	public void setPrenotazioni_dettagli(ArrayList<PrenotazioniDettagliBean> prenotazioniDettagli) {
		PrenotazioniDettagli = prenotazioniDettagli;
	}
	public ArrayList<RecensionePiattiBean> getRecensioniPiatti() {
		return RecensioniPiatti;
	}
	public void setRecensioni_piatti(ArrayList<RecensionePiattiBean> recensioniPiatti) {
		RecensioniPiatti = recensioniPiatti;
	}
	public ArrayList<OfferteBean> getOfferte() {
		return Offerte;
	}
	public void setOfferte(ArrayList<OfferteBean> offerte) {
		Offerte = offerte;
	}
}

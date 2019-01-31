package ristoapp.bean;

import java.sql.Date;
import java.util.ArrayList;

public class RecensioniRistorantiBean implements java.io.Serializable{

	private static final long serialVersionUID = 1497447869277802514L;
	
	private int IDRecRisto;
	private int IDFRistorante;
	private int IDFCliente;
	private int IDFPrenotazione;
	private int Stelle;
	private String Commento;
	private Date DataRecensione;
	private Date OraRececensione;
	
	//per collegarlo alle altre tabelle
	private ArrayList<PrenotazioniBean> Prenotazioni;
	private ArrayList<RistorantiBean> Ristoranti;
	
	public int getIDRecRisto() {
		return IDRecRisto;
	}
	public void setIDRecRisto(int iDRecRisto) {
		IDRecRisto = iDRecRisto;
	}
	public int getIDFRistorante() {
		return IDFRistorante;
	}
	public void setIDFRistorante(int iDFRistorante) {
		IDFRistorante = iDFRistorante;
	}
	public int getIDFCliente() {
		return IDFCliente;
	}
	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
	}
	public int getIDFPrenotazione() {
		return IDFPrenotazione;
	}
	public void setIDFPrenotazione(int iDFPrenotazione) {
		IDFPrenotazione = iDFPrenotazione;
	}
	public int getStelle() {
		return Stelle;
	}
	public void setStelle(int stelle) {
		Stelle = stelle;
	}
	public String getCommento() {
		return Commento;
	}
	public void setCommento(String commento) {
		Commento = commento;
	}
	public Date getDataRecensione() {
		return DataRecensione;
	}
	public void setDataRecensione(Date dataRecensione) {
		DataRecensione = dataRecensione;
	}
	public Date getOraRececensione() {
		return OraRececensione;
	}
	public void setOraRececensione(Date oraRececensione) {
		OraRececensione = oraRececensione;
	}
	public ArrayList<PrenotazioniBean> getPrenotazioni() {
		return Prenotazioni;
	}
	public void setPrenotazioni(ArrayList<PrenotazioniBean> prenotazioni) {
		Prenotazioni = prenotazioni;
	}
	public ArrayList<RistorantiBean> getRistoranti() {
		return Ristoranti;
	}
	public void setRistoranti(ArrayList<RistorantiBean> ristoranti) {
		Ristoranti = ristoranti;
	}
}

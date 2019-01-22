package ristoapp.bean;

import java.sql.Time;
import java.util.ArrayList;

import javafx.scene.chart.PieChart.Data;

public class RecensionePiattiBean implements java.io.Serializable {

	private static final long serialVersionUID = 4528953769279464033L;
	
	private int IDPiatto;
	private int IDFPrenotazione;
	private int IDFPiatto;
	private int IDFCliente;
	private int Stelle;
	private String Commento;
	private Data DataRecensione;
	private Time OraRecensione;
	
	//per collegarlo alle altre tabelle
	private ArrayList<PrenotazioniBean> Prenotazioni;
	private ArrayList<RistorantiBean> Ristoranti;
	private ArrayList<PiattiBean> Piatti;
	
	public int getIDPiatto() {
		return IDPiatto;
	}
	public void setIDPiatto(int iDPiatto) {
		IDPiatto = iDPiatto;
	}
	public int getIDFPrenotazione() {
		return IDFPrenotazione;
	}
	public void setIDFPrenotazione(int iDFPrenotazione) {
		IDFPrenotazione = iDFPrenotazione;
	}
	public int getIDFPiatto() {
		return IDFPiatto;
	}
	public void setIDFPiatto(int iDFPiatto) {
		IDFPiatto = iDFPiatto;
	}
	public int getIDFCliente() {
		return IDFCliente;
	}
	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
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
	public Data getDataRecensione() {
		return DataRecensione;
	}
	public void setDataRecensione(Data dataRecensione) {
		DataRecensione = dataRecensione;
	}
	public Time getOraRecensione() {
		return OraRecensione;
	}
	public void setOraRecensione(Time oraRecensione) {
		OraRecensione = oraRecensione;
	}
	public ArrayList<PiattiBean> getPiatti() {
		return Piatti;
	}
	public void setPiatti(ArrayList<PiattiBean> piatti) {
		Piatti = piatti;
	}
	public ArrayList<RistorantiBean> getRistoranti() {
		return Ristoranti;
	}
	public void setRistoranti(ArrayList<RistorantiBean> ristoranti) {
		Ristoranti = ristoranti;
	}
}

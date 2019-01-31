package ristoapp.bean;

import java.util.Date;

public class OfferteBean implements java.io.Serializable{

	private static final long serialVersionUID = 8905967347413230537L;

	private int IDOfferta;
	private int IDFRistorante;
	private int IDFPiatto;
	private Date DataInizio;
	private Date DataFine;
	private String Descrizione;
	private int Sconto;
	
	//Getter e Setter
	public int getIDOfferta() {
		return IDOfferta;
	}
	public void setIDOfferta(int iDOfferta) {
		IDOfferta = iDOfferta;
	}
	public int getIDFRistorante() {
		return IDFRistorante;
	}
	public void setIDFRistorante(int iDFRistorante) {
		IDFRistorante = iDFRistorante;
	}
	public int getIDFPiatto() {
		return IDFPiatto;
	}
	public void setIDFPiatto(int iDFPiatto) {
		IDFPiatto = iDFPiatto;
	}
	public Date getDataInizio() {
		return DataInizio;
	}
	public void setDataInizio(Date dataInizio) {
		DataInizio = dataInizio;
	}
	public Date getDataFine() {
		return DataFine;
	}
	public void setDataFine(Date dataFine) {
		DataFine = dataFine;
	}
	public String getDescrizione() {
		return Descrizione;
	}
	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
	public int getSconto() {
		return Sconto;
	}
	public void setSconto(int sconto) {
		Sconto = sconto;
	}
}

package ristoapp.bean;

import java.util.ArrayList;
import java.util.Date;
import java.sql.Time;

public class PrenotazioniBean implements java.io.Serializable {

	private static final long serialVersionUID = 8909903652040882756L;
	
	private int IDPrenotazione;
	private int IDFRistorante;
	private int IDFCatPrenotazione;
	private int IDFCliente;
	private String Data;
	private String Ora;
	private Boolean StatoPagamento;
	private String NumeroPersone;
	
	private ArrayList<PrenotazioniDettagliBean> DettagliPrenotazioni;

	
	//Getter e Setter
	public int getIDPrenotazione() {
		return IDPrenotazione;
	}

	public void setIDPrenotazione(int iDPrenotazione) {
		IDPrenotazione = iDPrenotazione;
	}

	public int getIDFRistorante() {
		return IDFRistorante;
	}

	public void setIDFRistorante(int iDFRistorante) {
		IDFRistorante = iDFRistorante;
	}

	public int getIDFCatPrenotazione() {
		return IDFCatPrenotazione;
	}

	public void setIDFCatPrenotazione(int iDFCatPrenotazione) {
		IDFCatPrenotazione = iDFCatPrenotazione;
	}

	public int getIDFCliente() {
		return IDFCliente;
	}

	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
	}

	public String getData() {
		return Data;
	}

	public void setData(String data2) {
		Data = data2;
	}

	public Boolean getStatoPagamento() {
		return StatoPagamento;
	}

	public void setStatoPagamento(Boolean statoPagamento) {
		StatoPagamento = statoPagamento;
	}

	public String getNumeroPersone() {
		return NumeroPersone;
	}

	public void setNumeroPersone(String posti) {
		NumeroPersone = posti;
	}

	public ArrayList<PrenotazioniDettagliBean> getDettagliPrenotazioni() {
		return DettagliPrenotazioni;
	}

	public void setDettagliPrenotazioni(ArrayList<PrenotazioniDettagliBean> dettagliPrenotazioni) {
		DettagliPrenotazioni = dettagliPrenotazioni;
	}

	public String getOra() {
		return Ora;
	}

	public void setOra(String ora2) {
		Ora = ora2;
	}
}

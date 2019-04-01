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
	private Date Data;
	private Time Ora;
	private Boolean StatoPagamento;
	private int NumeroPersone;
	
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

	public Date getData() {
		return Data;
	}

	public void setData(Date data) {
		Data = data;
	}

	public Boolean getStatoPagamento() {
		return StatoPagamento;
	}

	public void setStatoPagamento(Boolean statoPagamento) {
		StatoPagamento = statoPagamento;
	}

	public int getNumeroPersone() {
		return NumeroPersone;
	}

	public void setNumeroPersone(int numeroPersone) {
		NumeroPersone = numeroPersone;
	}

	public ArrayList<PrenotazioniDettagliBean> getDettagliPrenotazioni() {
		return DettagliPrenotazioni;
	}

	public void setDettagliPrenotazioni(ArrayList<PrenotazioniDettagliBean> dettagliPrenotazioni) {
		DettagliPrenotazioni = dettagliPrenotazioni;
	}

	public Time getOra() {
		return Ora;
	}

	public void setOra(Time ora) {
		Ora = ora;
	}
}

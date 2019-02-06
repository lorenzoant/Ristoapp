package ristoapp.bean;
import java.util.ArrayList;

public class TavoliBean implements java.io.Serializable{
	
	private static final long serialVersionUID = -6766332831195654683L;
	
	private int IDTavolo;
	private int IDFRistorante;
	private int IDFOrdine;
	private int Riga;
	private int Colonna;
	public int getIDTavolo() {
		return IDTavolo;
	}
	public void setIDTavolo(int iDTavolo) {
		IDTavolo = iDTavolo;
	}
	public int getIDFRistorante() {
		return IDFRistorante;
	}
	public void setIDFRistorante(int iDFRistorante) {
		IDFRistorante = iDFRistorante;
	}
	public int getIDFOrdine() {
		return IDFOrdine;
	}
	public void setIDFOrdine(int iDFOrdine) {
		IDFOrdine = iDFOrdine;
	}
	public int getRiga() {
		return Riga;
	}
	public void setRiga(int riga) {
		Riga = riga;
	}
	public int getColonna() {
		return Colonna;
	}
	public void setColonna(int colonna) {
		Colonna = colonna;
	}
	
}

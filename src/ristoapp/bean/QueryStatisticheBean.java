package ristoapp.bean;

import java.util.Date;

public class QueryStatisticheBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8088485729145867841L;
	
	//numero di prenotazioni per comune
	String Comune;
	int NumPrenotazioni;
	
	//numero di registrazioni per tipologia utente e anno di registrazione
	Date DataRegistrazione;
	int NumRegistrazioni;
	int mese;
	int anno;
	
	public String getComune() {
		return Comune;
	}
	public void setComune(String comune) {
		Comune = comune;
	}
	public int getNumPrenotazioni() {
		return NumPrenotazioni;
	}
	public void setNumPrenotazioni(int numPrenotazioni) {
		NumPrenotazioni = numPrenotazioni;
	}
	public Date getDataRegistrazione() {
		return DataRegistrazione;
	}
	public void setDataRegistrazione(Date dataRegistrazione) {
		DataRegistrazione = dataRegistrazione;
	}
	public int getMese() {
		return mese;
	}
	public void setMese(int mese) {
		this.mese = mese;
	}
	public int getAnno() {
		return anno;
	}
	public void setAnno(int anno) {
		this.anno = anno;
	}
	public int getNumRegistrazioni() {
		return NumRegistrazioni;
	}
	public void setNumRegistrazioni(int numRegistrazioni) {
		NumRegistrazioni = numRegistrazioni;
	}
}

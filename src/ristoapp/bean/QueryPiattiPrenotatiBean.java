package ristoapp.bean;

public class QueryPiattiPrenotatiBean {
	
	//Da tabella PrenotazioniDettagli
	private int IDPrenotazioneDett;
	private int IDFOrdine;
	private int IDFPiatto;
	private float Prezzo;
	private int Sconto;
	private int Quantita;
	
	//Da tabelle Piatti
	private int IDFCatPiatto;
	private String Nome;
	private String Url;
	
	
	public int getIDPrenotazioneDett() {
		return IDPrenotazioneDett;
	}
	public void setIDPrenotazioneDett(int iDPrenotazioneDett) {
		IDPrenotazioneDett = iDPrenotazioneDett;
	}
	public int getIDFOrdine() {
		return IDFOrdine;
	}
	public void setIDFOrdine(int iDFOrdine) {
		IDFOrdine = iDFOrdine;
	}
	public int getIDFPiatto() {
		return IDFPiatto;
	}
	public void setIDFPiatto(int iDFPiatto) {
		IDFPiatto = iDFPiatto;
	}
	public float getPrezzo() {
		return Prezzo;
	}
	public void setPrezzo(float prezzo) {
		Prezzo = prezzo;
	}
	public int getSconto() {
		return Sconto;
	}
	public void setSconto(int sconto) {
		Sconto = sconto;
	}
	public int getQuantita() {
		return Quantita;
	}
	public void setQuantita(int quantita) {
		Quantita = quantita;
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
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}

}

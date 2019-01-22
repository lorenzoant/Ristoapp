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
	private Boolean Serwifi;
	private Boolean Serdisabili;
	private Boolean Serparcheggio;
	
	//per collegarlo alle altre tabelle
	private ArrayList<PiattiBean> ristorantePiatti;
	
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
	public Boolean getSerwifi() {
		return Serwifi;
	}
	public void setSerwifi(Boolean serwifi) {
		Serwifi = serwifi;
	}
	public Boolean getSerdisabili() {
		return Serdisabili;
	}
	public void setSerdisabili(Boolean serdisabili) {
		Serdisabili = serdisabili;
	}
	public Boolean getSerparcheggio() {
		return Serparcheggio;
	}
	public void setSerparcheggio(Boolean serparcheggio) {
		Serparcheggio = serparcheggio;
	}
	public ArrayList<PiattiBean> getRistorantePiatti() {
		return ristorantePiatti;
	}
	public void setRistorantePiatti(ArrayList<PiattiBean> ristorantePiatti) {
		this.ristorantePiatti = ristorantePiatti;
	}
}

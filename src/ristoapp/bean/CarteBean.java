package ristoapp.bean;

import java.sql.Date;
import java.util.ArrayList;


public class CarteBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4142538666651054231L;


	private int IDCarta;
	private int IDFCatCarta;
	private int IDFCliente;
	private int PAN;
	private int CVV;
	private Date DataScadenza;
	
	//per collegarlo alle altre tabelle
	
	
	private ArrayList<ClientiBean> Clienti;
	private ArrayList<Categoria_carte> Categoria_carte;
	
	
	public int getIDCarta() {
		return IDCarta;
	}
	public void setIDCarta(int iDCarta) {
		IDCarta = iDCarta;
	}
	public int getIDFCatCarta() {
		return IDFCatCarta;
	}
	public void setIDFCatCarta(int iDFCatCarta) {
		IDFCatCarta = iDFCatCarta;
	}
	public int getIDFCliente() {
		return IDFCliente;
	}
	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
	}
	public int getPAN() {
		return PAN;
	}
	public void setPAN(int pAN) {
		PAN = pAN;
	}
	public int getCVV() {
		return CVV;
	}
	public void setCVV(int cVV) {
		CVV = cVV;
	}
	public Date getDataScadenza() {
		return DataScadenza;
	}
	public void setDataScadenza(Date dataScadenza) {
		DataScadenza = dataScadenza;
	}
	
	
}	
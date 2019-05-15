package ristoapp.bean;

public class CarteBean implements java.io.Serializable{

	private static final long serialVersionUID = -4142538666651054231L;


	private int IDCarta;
	private int IDFCatCarta;
	private int IDFCliente;
	private String NomeCarta;
	private int PAN;
	private int CVV;
	private String DataScadenza;
	
	//per collegarlo alle altre tabelle
	
	
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
	public String getDataScadenza() {
		return DataScadenza;
	}
	public void setDataScadenza(String dataScadenza) {
		DataScadenza = dataScadenza;
	}
	public String getNomeCarta() {
		return NomeCarta;
	}
	public void setNomeCarta(String nomeCarta) {
		NomeCarta = nomeCarta;
	}
}	
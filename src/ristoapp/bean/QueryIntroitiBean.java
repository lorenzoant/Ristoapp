package ristoapp.bean;

public class QueryIntroitiBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3948705191850081954L;

	int IDRistorante;
	String Nome;
	String Comune;
	double Stelle;
	double Ricavi;
	
	public int getIDRistorante() {
		return IDRistorante;
	}
	public void setIDRistorante(int iDRistorante) {
		IDRistorante = iDRistorante;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getComune() {
		return Comune;
	}
	public void setComune(String comune) {
		Comune = comune;
	}
	public double getStelle() {
		return Stelle;
	}
	public void setStelle(double stelle) {
		Stelle = stelle;
	}
	public double getRicavi() {
		return Ricavi;
	}
	public void setRicavi(double ricavi) {
		Ricavi = ricavi;
	}
}

package ristoapp.bean;

public class CategoriaCucinaBean implements java.io.Serializable{

	private static final long serialVersionUID = -3121903374193650311L;

	private int IDCatPiatto;
	private String Nome;
	private String Descrizine;
	
	//Getter e Setter
	public int getIDCatPiatto() {
		return IDCatPiatto;
	}
	public void setIDCatPiatto(int iDCatPiatto) {
		IDCatPiatto = iDCatPiatto;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getDescrizine() {
		return Descrizine;
	}
	public void setDescrizine(String descrizine) {
		Descrizine = descrizine;
	}
}

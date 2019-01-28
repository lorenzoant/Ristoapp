package ristoapp.bean;

public class CategoriaPiattiBean implements java.io.Serializable {

	private static final long serialVersionUID = 3818160188485128649L;
	
	private int IDCatPiatto;
	private String Nome;
	private String Descrizine;
	
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

package ristoapp.bean;

public class CategoriaCarteBean implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8690268046971667748L;

	
	private int IDCatCarta;
	private String Nome;
	
	//Getter e Setter
	public int getIDCatCarta() {
		return IDCatCarta;
	}
	public void setIDCatCarta(int iDCatCarta) {
		IDCatCarta = iDCatCarta;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
}

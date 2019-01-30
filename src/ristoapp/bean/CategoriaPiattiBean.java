package ristoapp.bean;

import java.util.ArrayList;

public class CategoriaPiattiBean implements java.io.Serializable {

	private static final long serialVersionUID = 3818160188485128649L;
	
	private int IDCatPiatto;
	private String Nome;
	private String Descrizine;
	
	//Collegamenti
	private ArrayList<PiattiBean> Piatti;
	
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
	public ArrayList<PiattiBean> getPiatti() {
		return Piatti;
	}
	public void setPiatti(ArrayList<PiattiBean> piatti) {
		Piatti = piatti;
	}
}

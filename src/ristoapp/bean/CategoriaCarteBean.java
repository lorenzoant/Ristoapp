package ristoapp.bean;

import java.util.ArrayList;

public class CategoriaCarteBean implements java.io.Serializable{

	private static final long serialVersionUID = -8690268046971667748L;

	
	private int IDCatCarta;
	private String Nome;
	
	private ArrayList<CarteBean> Carte;
	
	
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
	public ArrayList<CarteBean> getCarte() {
		return Carte;
	}
	public void setCarte(ArrayList<CarteBean> carte) {
		Carte = carte;
	}
}

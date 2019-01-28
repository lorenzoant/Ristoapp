package ristoapp.bean;

public class CategoriaPrenotazioniBean implements java.io.Serializable {

	private static final long serialVersionUID = 912526824913640791L;

	private int IDCatPrenotazioni;
	private String Nome;
	private String Descrizione;
	
	public int getIDCatPrenotazioni() {
		return IDCatPrenotazioni;
	}
	public void setIDCatPrenotazioni(int iDCatPrenotazioni) {
		IDCatPrenotazioni = iDCatPrenotazioni;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getDescrizione() {
		return Descrizione;
	}
	public void setDescrizione(String descrizione) {
		Descrizione = descrizione;
	}
}

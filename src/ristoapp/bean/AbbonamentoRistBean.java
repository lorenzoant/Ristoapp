package ristoapp.bean;
import java.sql.Date;
public class AbbonamentoRistBean implements java.io.Serializable {

	private static final long serialVersionUID = 3338316497127062328L;

	//Variabili
	private int IDAbbonamento;
	private int IDFCliente;
	private Date DataPagamento;
	private Date Durata;
	private int Importo;
	
	//Getter e Setter
	
	public int getIDAbbonamento() {
		return IDAbbonamento;
	}

	public void setIDAbbonamento(int iDAbbonamento) {
		IDAbbonamento = iDAbbonamento;
	}

	public int getIDFCliente() {
		return IDFCliente;
	}

	public void setIDFCliente(int iDFCliente) {
		IDFCliente = iDFCliente;
	}

	public Date getDataPagamento() {
		return DataPagamento;
	}

	public void setDataPagamento(Date dataPagamento) {
		DataPagamento = dataPagamento;
	}

	public Date getDurata() {
		return Durata;
	}

	public void setDurata(Date durata) {
		Durata = durata;
	}

	public int getImporto() {
		return Importo;
	}

	public void setImporto(int importo) {
		Importo = importo;
	}
}

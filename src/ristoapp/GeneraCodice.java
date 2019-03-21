package ristoapp;

//genero una serie di 4 numeri casuali da 0 a 9 che formeranno un numero da 4 cifre che fungerà da codice per recupero password
public class GeneraCodice {
	public int Genera () {
		// Obtain a number between [0 - 9].
		int [] array = new int[4];
		String codice = "";
		for(int i = 0; i < 4; i++) {
			array[i] = (int)(Math.random() * 9);//creo numero casuale
			codice = codice + (char)(array[i]+'0');//concateno il numero con i precedenti
			//System.out.println(codice);
		}
		System.out.println(Integer.parseInt(codice));
		return Integer.parseInt(codice);//restituisco il numero di 4 cifre
	}
}

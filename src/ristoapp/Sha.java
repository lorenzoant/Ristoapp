package ristoapp;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.*;
import javax.xml.bind.DatatypeConverter;
 
/**
 * Hashing with SHA1
 *
 * @param input String to hash
 * @return String hashed
 */
public class Sha {
	public String sha1 (String input) {
	    String sha1 = null;
	    input = input+"RistoApp"; //per evitare attacchi reainbow tables
	    try {
	        MessageDigest msdDigest = MessageDigest.getInstance("SHA-1");
	        msdDigest.update(input.getBytes("UTF-8"), 0, input.length());
	        sha1 = DatatypeConverter.printHexBinary(msdDigest.digest());
	    } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
	        Logger.getAnonymousLogger().log(Level.SEVERE, null, e);
	    }
	    return sha1;
	}
}
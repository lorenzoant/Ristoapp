package ristoapp;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
public class InvioEmail {

    public void invia(String mail, int codice){
    	
    	//System.out.println("mail = " + mail + ", password = " + password);
        try{
            String host ="smtp.gmail.com" ;
            String user = "ristoappstaff@gmail.com";
            String pass = "RistoApp2019";
            String to = mail;
            String from = "ristoappstaff@gmail.com";
            String subject = "modifica password.";
            String messageText = "Codice di recupero password: " + codice;
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("Messaggio inviato con successo");
        }catch(Exception ex)
        {
        	System.out.println("errore nell'invio della email.");
            System.out.println(ex);
        }
    }
}
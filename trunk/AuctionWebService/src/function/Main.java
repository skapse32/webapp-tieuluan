package function;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import domain.Hangxe;
import dto.HangxeDTO;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*final String username = "09110clc@gmail.com";
		final String password = "thayphuong";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("09110clc@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("pqanh09@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("Xin chào Mail Crawler,"
				+ "\n\n No spam to my email, please!");
			//message.setContent(message, "text/html; charset=utf-8");
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}*/
		
		// thu load hang xe
		HangxeDTO daoxe  = new HangxeDTO();
		List<Hangxe> xe = daoxe.findAll();
		System.out.print(xe.toString());
	}

}

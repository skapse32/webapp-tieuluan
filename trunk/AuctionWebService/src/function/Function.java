package function;

import java.text.DecimalFormat;
import java.util.Properties;
import java.util.logging.Level;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.EntityManagerHelper;

public class Function {
	public static void sendmail(model.User user, dao.Sanpham sp){
		final String username = "09110clc@gmail.com";
		final String password = "thayphuong";

		DecimalFormat formatter = new DecimalFormat("#,###");
		
		String giathang = formatter.format(sp.getGiahientai());
		
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
				InternetAddress.parse(user.getEmail()));
			message.setSubject("Thắng phiên!");
			message.setText("Chào "+user.getHoTen()+","
				+ "\n\n Bạn đã thắng sản phẩm "+sp.getTensp()+"\n\n  Với mức giá "+giathang+" đ. \n\n Vui lòng vào trang web của chúng tôi để tiến hành thanh toán sản phẩm!");
 
			Transport.send(message);
 
			EntityManagerHelper.log("Send mail to "+user.getEmail() +"Successful!", Level.INFO,
					null);
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	public static void sendmail1(String email, dao.Sanpham sp){
		final String username = "09110clc@gmail.com";
		final String password = "thayphuong";

		DecimalFormat formatter = new DecimalFormat("#,###");
		
		String giathang = formatter.format(sp.getGiahientai());
		
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
				InternetAddress.parse(email));
			message.setSubject("Thắng phiên!");
			message.setText("Chào Quý Anh("+sp.getNguoidat()+"),"
				+ "\n\n Bạn đã thắng sản phẩm "+sp.getTensp()+"\n\n  Với mức giá "+giathang+" đ. \n\n Vui lòng vào trang web của chúng tôi để tiến hành thanh toán sản phẩm!");
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			Transport.send(message);
 
			EntityManagerHelper.log("Send mail to "+email +"Successful!", Level.INFO,
					null);
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}

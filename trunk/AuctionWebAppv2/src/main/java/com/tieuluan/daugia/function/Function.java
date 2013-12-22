package com.tieuluan.daugia.function;

import java.text.DecimalFormat;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.tieuluan.daugia.model.Sanpham;
import com.tieuluan.daugia.model.User;


public class Function {
	public static int tinhSoTrangSanPham(int soLuongSanPhamTrenTrang, int size) {

		int n = size;
		int s;
		if (soLuongSanPhamTrenTrang != -1) {
			s = n / soLuongSanPhamTrenTrang;
			if (n % soLuongSanPhamTrenTrang != 0) {
				s++;
			}
		} else {
			s = 1;
		}
		return s;
	}

	
	public static void sendmail(User user, Sanpham sp){
		final String username = "auctionSPKT@gmail.com";
		final String password = "congnghethongtin";

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
			message.setFrom(new InternetAddress("auctionSPKT@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(user.getEmail()));
			message.setSubject("Thắng phiên!");
			message.setText("Chào "+user.getUsername() +","
				+ "\n Bạn đã thắng sản phẩm "+sp.getTensp()+"\n\n  với mức giá "+giathang+" d. \n\n Vui lòng vào trang web của chúng tối để tiến hành thanh toán sản phẩm!");
 
			Transport.send(message);
 
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}

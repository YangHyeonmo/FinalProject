package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

	public void send(String email,int random) {
		String host = "http://localhost:8088/SpringProject/";
		String to = email; //�쉶�썝 �씠硫붿씪
		String subject = "NaruBank을 위한 이메일 인증 메일입니다.";
		
		String content="Valid number:"+random;
		 String user = "yhj940928@gmail.com"; // �꽕�씠踰꾩씪 寃쎌슦 �꽕�씠踰� 怨꾩젙, gmail寃쎌슦 gmail 怨꾩젙
	        String password = "didgusah135@";   // �뙣�뒪�썙�뱶

	        // SMTP �꽌踰� �젙蹂대�� �꽕�젙�븳�떎.
	        Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });

	        try {
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));

	            //�닔�떊�옄硫붿씪二쇱냼
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 

	            // Subject
	            message.setSubject(subject); //硫붿씪 �젣紐⑹쓣 �엯�젰

	            // Text
	            message.setText(content);    //硫붿씪 �궡�슜�쓣 �엯�젰

	            // send the message
	            Transport.send(message); ////�쟾�넚
	            System.out.println("message sent successfully...");
	        } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	}
}

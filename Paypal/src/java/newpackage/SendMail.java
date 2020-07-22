/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Admin
 */
public class SendMail {

    public void send(String password, String content, String filename, String receiveEmail) throws IOException {
        // 1) get the session object
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", 465);
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.port", 465);

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("yyyoyoooo1123@gmail.com", password);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("yyyoyoooo1123@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiveEmail));
            message.setSubject("Haven deluxe app");

            // 3) create MimeBodyPart object and set your message text
            BodyPart messageBodyPart1 = new MimeBodyPart();
            messageBodyPart1.setText(content);

            // 4) create new MimeBodyPart object and set DataHandler object to this object
            MimeBodyPart messageBodyPart2 = new MimeBodyPart();
            String filename1 = "C:/Users/Admin/Desktop/" + filename;
            /* DataSource source = new FileDataSource(filename);
             messageBodyPart2.setDataHandler(new DataHandler(source));
             messageBodyPart2.setFileName(filename);*/
            messageBodyPart2.attachFile(filename1);
            // 5) create Multipart object and add MimeBodyPart objects to this object
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart1);
            multipart.addBodyPart(messageBodyPart2);
            // 6) set the multiplart object to the message object
            message.setContent(multipart);

            // 7) send message
            Transport.send(message);

            System.out.println("Message sent to " + receiveEmail + " successfully");
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }
}

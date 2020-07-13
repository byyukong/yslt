package cn.qas.util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.Scanner;

/**
 * @author GaoJianJun
 * @create 2020-07-10 11:31
 */
public class Email {
    public static void runEmail(String email,String code){
        Properties prop = new Properties();
        // 开启debug调试，以便在控制台查看
        //prop.setProperty("mail.debug", "true");
        // 设置邮件服务器主机名
        prop.setProperty("mail.host", "smtp.qq.com");
        // 发送服务器需要身份验证
        prop.setProperty("mail.smtp.auth", "true");
        // 发送邮件协议名称
        prop.setProperty("mail.transport.protocol", "smtp");
        // 开启SSL加密，否则会失败
        MailSSLSocketFactory sf = null;
        try {
            sf = new MailSSLSocketFactory();
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        }
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.socketFactory", sf);
        // 创建session
        Session session = Session.getInstance(prop);
        // 通过session得到transport对象
        Transport ts = null;
        try {
            ts = session.getTransport();
        } catch (NoSuchProviderException e) {
            e.printStackTrace();
        }
        // 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com
        try {
            ts.connect("smtp.qq.com", "1719549607", "xhbrvnjtgsyhbdfc");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        // 创建邮件
        Message message = null;
        try {
            message = createSimpleMail(session,email,code);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 发送邮件
        try {
            ts.sendMessage(message, message.getAllRecipients());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        try {
            ts.close();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static MimeMessage createSimpleMail(Session session,String email,String code) throws Exception {
        String url="http://localhost:8080/activation/"+code;
        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);
        // 指明邮件的发件人
        message.setFrom(new InternetAddress("yukongc@qq.com"));
        // 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        // 邮件的标题
        message.setSubject("论坛");
        // 邮件的文本内容
        message.setContent("欢迎您注册【论坛】请点击下面链接激活用户,<h2 style=\"color:red;font-weight:bold;\">"+url+"</h2>,请勿回复此邮箱", "text/html;charset=UTF-8");
        // 返回创建好的邮件对象
        return message;
    }
}

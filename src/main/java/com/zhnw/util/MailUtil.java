package com.zhnw.util;

import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * Created by guoyibin on 15/3/23.
 *
 * 邮件工具类
 */
public class MailUtil {

    /**
     * 163邮箱发送
     *
     * @param mail String 发件人邮箱
     * @param password String 发件人邮箱密码
     * @param tos String[] 所有收件人邮箱
     * @param ccs String[] 所有抄送人邮箱
     * @param bccs String[] 所有暗送人邮箱
     * @param title String 邮件标题
     * @param content String 邮件内容
     * */
    public void mail163(String mail, String password, String[] tos, String[] ccs, String[] bccs,  String title, String content) throws MessagingException {
        // 配置发送邮件的环境属性
        final Properties props = new Properties();
        // 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.163.com");
        // 发件人的账号
        props.put("mail.user", mail);
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", password);

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);

        // 设置发件人
        InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
        message.setFrom(form);

        // 设置收件人   RecipientType.TO
        InternetAddress[] to = new InternetAddress[tos.length];
        for (int i = 0;i<tos.length;i++){
            InternetAddress ia = new InternetAddress(tos[i]);
            to[i]=ia;
        }
        message.setRecipients(RecipientType.TO, to);

        // 设置抄送   RecipientType.CC
        if (ccs!=null){
            InternetAddress[] bcc = new InternetAddress[ccs.length];
            for (int i = 0;i<ccs.length;i++){
                InternetAddress ia = new InternetAddress(ccs[i]);
                bcc[i]=ia;
            }
            message.setRecipients(RecipientType.CC, bcc);
        }

        // 设置抄送   RecipientType.BCC
        if (bccs!=null){
            InternetAddress[] bcc2 = new InternetAddress[bccs.length];
            for (int i = 0;i<bccs.length;i++){
                InternetAddress ia2 = new InternetAddress(bccs[i]);
                bcc2[i]=ia2;
            }
            message.setRecipients(RecipientType.BCC, bcc2);
        }


        // 设置邮件标题
        message.setSubject(title);

        // 设置邮件的内容体
        message.setContent(content, "text/html;charset=UTF-8");

        // 发送邮件
        Transport.send(message);
    }

    //qq邮箱

    //163企业邮箱

    //qq企业邮箱


    public static void main(String[] args) throws Exception{
        new MailUtil().mail163("guoyb1990@163.com", "gyb900326.", new String[]{"bluesguo@tax800.com"}, new String[]{"1979696310@qq.com"}, new String[]{"maxhuang@tax800.com"},"2222","33333");
    }

}

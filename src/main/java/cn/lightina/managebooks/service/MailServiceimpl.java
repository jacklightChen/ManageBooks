package cn.lightina.managebooks.service;

import cn.lightina.managebooks.dao.MailMapper;
import cn.lightina.managebooks.pojo.MailDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MailServiceimpl implements MailService{
    @Autowired
    private JavaMailSender mailSender;

    @Autowired(required = false)
    private MailMapper mailMapper;

    @Value("${mail.fromMail.addr}")
    private String from;

    @Override
    public void processResReminder() {
        List<MailDetail> list= mailMapper.resReminder();
        for(MailDetail m:list){
            String subject="你他娘倒是来图书馆呀";
            String userName=m.getUserName();
            String bname=m.getBname();
            String content="尊敬的"+userName+": "
                    +"您预约的 《"+bname
                    +"》 已经入库,您可前往图书馆借阅.";
            sendSimpleMail(m.getEmail(),subject,content);
        }
    }

    @Override
    public void processReturnReminder() {
        List<MailDetail> list= mailMapper.returnReminder();
        for(MailDetail m:list){
            String subject="你他娘倒是还书呀";
            String userName=m.getUserName();
            String bname=m.getBname();
            String btime=m.getBtime();
            String content="尊敬的"+userName+": "
                    +"您于 "+btime+" 借阅的 《"+bname
                    +"》 已过截止日期,请您尽快还书！";
            sendSimpleMail(m.getEmail(),subject,content);
        }
    }

    @Override
    public void sendSimpleMail(String to, String subject, String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(content);
        mailSender.send(message);
    }

}

package egovframework.sample.service.impl;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("emailService")
public class EmailServiceImpl {
	@Resource(name = "mailSender")
    private JavaMailSender mailSender;

    public void sendVerificationEmail(String toEmail, String verificationCode) throws Exception{
    	MimeMessage message = mailSender.createMimeMessage();
    	MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setFrom("skdus3435@naver.com"); // 발신자 이메일 주소
        helper.setTo(toEmail); // 수신자 이메일 주소
        helper.setSubject("회원 가입 인증 코드"); // 이메일 제목
        helper.setText("인증 코드: " + verificationCode, true); // 이메일 내용

        mailSender.send(message);
    }
            
}

package org.zerock.service;

import java.io.UnsupportedEncodingException;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EmailServiceImpl implements EmailService {

	JavaMailSender mailSender;

	@Override
	public void sendMail(MemberVO vo) throws MessagingException, UnsupportedEncodingException,
	MailException {

		MimeMessage msg = mailSender.createMimeMessage();
		msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getMemail()));
		msg.addFrom(new InternetAddress[] { new InternetAddress("dkfha714@gmail.com", "유니커 운영자") });
		msg.setSubject("유니커 회원가입 이메일 인증.", "utf-8");
		msg.setContent(
				"<a href='http://192.168.219.100:10000/member/welcome?mid=" + vo.getMid() + "'>" + "인증하기" + "</a>",
				"text/html; charset=UTF-8");
		mailSender.send(msg);

	}
}

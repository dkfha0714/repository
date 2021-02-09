package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.zerock.domain.MemberVO;
import org.zerock.service.EmailService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j	
@RequestMapping(value="/email/*",produces="text/plain;charset=UTF-8")
@AllArgsConstructor
@SessionAttributes("member")
public class EmailController {
	 

    EmailService emailService; // ì„œë¹„ìŠ¤ë¥¼ í˜¸ì¶œí•˜ê¸°ìœ„í•œ ì�˜ì¡´ì„± ì£¼ìž…
    
    
 
    @GetMapping("/send") // í™•ì�¸ (ë©”ì�¼ë°œì†¡) ë²„íŠ¼ì�„ ëˆ„ë¥´ë©´ ë§µí•‘ë�˜ëŠ” ë©”ì†Œë“œ
    public String send(MemberVO vo,Model model,SessionStatus session) {
        System.out.println(vo.getMid());
    	
    	try {
        	
            emailService.sendMail(vo); // dto (ë©”ì�¼ê´€ë ¨ ì •ë³´)ë¥¼ sendMailì—� ì €ìž¥í•¨
            model.addAttribute("message", "ì�´ë©”ì�¼ì�´ ë°œì†¡ë�˜ì—ˆìŠµë‹ˆë‹¤."); // ì�´ë©”ì�¼ì�´ ë°œì†¡ë�˜ì—ˆë‹¤ëŠ” ë©”ì‹œì§€ë¥¼ ì¶œë ¥ì‹œí‚¨ë‹¤.
            session.isComplete();
            return "/email/wait";
        } catch (Exception e) {
        	session.isComplete();
        	e.printStackTrace();
            model.addAttribute("message", "ì�´ë©”ì�¼ ë°œì†¡ ì‹¤íŒ¨..."); // ì�´ë©”ì�¼ ë°œì†¡ì�´ ì‹¤íŒ¨ë�˜ì—ˆë‹¤ëŠ” ë©”ì‹œì§€ë¥¼ ì¶œë ¥
            return "/email/fail";
        }
    }
    

}

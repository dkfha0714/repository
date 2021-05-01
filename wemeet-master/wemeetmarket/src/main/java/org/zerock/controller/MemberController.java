package org.zerock.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/member/*",produces="text/plain;charset=UTF-8")
@AllArgsConstructor
@SessionAttributes("member")
public class MemberController {

	private MemberService service;
	

	@GetMapping("/register")
	public void register(Model model) {


	
	}
	
	@RequestMapping(value="/login",produces = "application/json",method=RequestMethod.POST)
	@ResponseBody
	public int login(Model model ,MemberVO member,HttpServletRequest request) {
		

//		System.out.println(member.getMid() +" : "+member.getMpassword());
		member=service.login(member);
		

		if(member!=null) {
			if(member.getMagree().equals("Y")) {
//			System.out.println(member.getMid());
			model.addAttribute("member",member);
			return 1;
			
			} else if(member.getMagree().equals("N")) {
				return 2;
		
			}
		}
		return 0;

	}


	@RequestMapping(value="/loginresult",produces = "application/json",method=RequestMethod.GET)
	@ResponseBody
	public int loginresult(MemberVO member) {
		
		member=service.result(member);
		if(member==null) {
			
			return 1;
		}
		else {
		
			return 0;
		
		}
	}

	@PostMapping("/insert")
	public String insert(MemberVO member,Model model, HttpServletRequest request) {
	
		System.out.println(member.toString());

		
		service.insert(member);     // sql Ã¬Å¾â€¦Ã«Â Â¥Ã¬Â â€¢Ã«Â³Â´ dbÃ¬â€”ï¿½ Ã«â€œÂ±Ã«Â¡ï¿½
		
		model.addAttribute("member",service.login(member));
		
		System.out.println("Ã­â„¢â€¢Ã¬ï¿½Â¸");
		return "/email/sendpage";
		
	}
	
	@GetMapping("/memberinfo")
	public void memberinfo(@RequestParam("mno")long mno,Model model) {
		
		model.addAttribute("memberinfo",service.select(mno));
		
		
	}
	
	@GetMapping("/infopage")
	public void infopage() {
		
	}
	
	@RequestMapping("/cinfo")
	public void cinfo(@RequestParam("mno") long mno, Model model) {
		model.addAttribute("member",service.select(mno));

	}	
	
	
	@GetMapping("/logout")
	public String logout(SessionStatus session) {
		session.setComplete();
		
		return "redirect:/";
	}
	
	
	
    @GetMapping("/welcome")
    public String welcom(MemberVO vo) {
    	service.agree(vo);
    	System.out.println("Ã¬Â â€˜Ã¬â€ ï¿½ Ã­â„¢â€¢Ã¬ï¿½Â¸");
    	return "home";        // Ã«Â©â€�Ã¬ï¿½Â¸Ã­Å½ËœÃ¬ï¿½Â´Ã¬Â§â‚¬Ã«Â¡Å“ÃªÂ°â‚¬Ã«Å â€�ÃªÂ²Æ’Ã¬ï¿½Â´Ã¬Â§â‚¬Ã«Â§Å’  Ã­Å¡Å’Ã¬â€ºï¿½ÃªÂ°â‚¬Ã¬Å¾â€¦ Ã¬â„¢â€žÃ«Â£Å’ Ã­Å½ËœÃ¬ï¿½Â´Ã¬Â§â‚¬ Ã«Â§Å’Ã«â€œÂ¤Ã¬â€“Â´Ã¬Â¤ËœÃ¬â€¢Â¼Ã«ï¿½Â¨
    }
    
	@RequestMapping(value="/emailcheck",produces = "application/json",method=RequestMethod.GET)
	@ResponseBody
    public int emailcheck(MemberVO member) {
		
		member=service.emailcheck(member);
		
		if(member==null) {
			return 1;
			
		}
		else {
		
			return 0;
		
		}
	}
	
	@RequestMapping(value="/deletemember",produces = "application/json",method=RequestMethod.POST)
	@ResponseBody
	public int deletemember(MemberVO member,SessionStatus session) {
	
		System.out.println(member.getMid()+ ":"+ member.getMpassword());
		member=service.login(member);
		
		if(member!=null) {
			session.setComplete();
			service.leave(member.getMno());	
			return 1;
		}
		else {
			return 0;
		}
		
	}
	
	
	@PostMapping(value="update")
	public String update(MemberVO member,RedirectAttributes rttr) {
		try {
			service.update(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	//	int a=service.update(member);
	//	System.out.println("Ã¬â€”â€¦Ã«ï¿½Â°Ã¬ï¿½Â´Ã­Å Â¸ Ã­â„¢â€¢Ã¬ï¿½Â¸ :" + a);
	//	session.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/acinfo")
	public String acinfo(Criteria cri, Model model) {
		List<Map<String, String>> alist = service.select2(cri);
		
		int total = service.getTotal(cri);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		model.addAttribute("acin", alist);
		return "member/acinfo";
		
	}
	
//	@GetMapping("/selectonem")
//	public void selectone(Criteria cri, @RequestParam("adno")long adno, Model model) {
//		
//		MemberVO member = service.read(adno);
//		model.addAttribute("member",member);
//		model.addAttribute("cri", cri);
//	}
	@GetMapping("/acdelete")
	public String acdelete(MemberVO member, Model model) {
		
		service.acdelete(member.getAdno());
		
		return "redirect:/";
	}
	
	@GetMapping("/acinfoDetail")
	public void acInfoDetail(@RequestParam("adno") long adno, Model model) {

		model.addAttribute("acinfo", service.acinfoDetail(adno));
	}
	
	

	
}

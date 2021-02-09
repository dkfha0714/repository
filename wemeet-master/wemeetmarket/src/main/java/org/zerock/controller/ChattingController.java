package org.zerock.controller;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.ChatVO;
import org.zerock.domain.upload;
import org.zerock.service.ChattingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value="/chat/*",produces="text/plain;charset=UTF-8")
@SessionAttributes("member")
public class ChattingController {
	
	private ChattingService service;
	
	private upload up;		
	@GetMapping("/chattingroom")
	public String chattingroom(ChatVO chat,Model model){
		
		System.out.println(chat.getCno());
		model.addAttribute("chatting", service.selectChat(chat));
		
		return "/chat/chattingroom";
	}
	
	@GetMapping("/chattinglist")
	public String chattinglist(Model model) {
	
		List<ChatVO> test=service.chattinglist();
		
		log.info(test.size());
		
		model.addAttribute("chattinglist",service.chattinglist());
		
		return "home";
	}
	
	@GetMapping("/delete")
	public String deletechat(ChatVO chat) {
		
	
		service.delete(chat.getCno());
		
		return "redirect:/chat/waitingroom";
	}
	
	@GetMapping("/addchat")
	public String chattingadd() {
		
		return "/chat/chattingadd";
	}
	
	@PostMapping("/addchat")
	public String addchat(ChatVO chat,MultipartHttpServletRequest request) {
		
		
		log.info(chat);
		
		MultipartFile file = request.getFile("cimage1");
		 
		 
		String cimage=up.uploadFileName(file);            // ê²½ë¡œ ë¶™ì—¬ì„œ ë¦¬í„´
	
		cimage=up.fileUpload(file, cimage);					  // ì�¸ë„¤ì�¼ ì�´ë¯¸ì§€ë¥¼ , ê²½ë¡œì—�ë‹¤ ì €ìž¥
		
		 
	
		cimage=cimage.replace("C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\", "");
		                        
		chat.setCimage(cimage);
		
		
		
		service.addchattingroom(chat);
		
		ChatVO room=service.create(chat);
		
		return "redirect:/chat/chattingroom?cno="+room.getCno();
//		return "redirect:/chat/chattingroom?mid="+room.getMid();
		
	}

	@PostMapping("/updatechat")
	public String updatechat(ChatVO chat) {
		
		service.updatechat(chat);
		
		return "/chat/chattingroom";
	}
	
	
	@GetMapping("/waitingroom")
	public void waitingroom(Model model) {
		
		model.addAttribute("chattinglist",service.chattinglist());
		
		
	}
	
	@PostMapping("/test")
	@ResponseBody
	public void test(@RequestBody HashMap<String,Object> chat) {
		System.out.println("í…ŒìŠ¤íŠ¸ ì ‘ê·¼");
		System.out.println(chat.get("cno"));
		
	}
	
	
	
	
}

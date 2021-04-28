package org.zerock.controller;




import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BuyboardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.upload;
import org.zerock.service.BuyboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/buyer/*",produces="text/plain;charset=UTF-8")
@AllArgsConstructor
@SessionAttributes({"member","mid"})
public class BuyBoardController {
	
	private BuyboardService service;
	private upload up;
	
	@GetMapping("/uploadbuy")
	public void uploadbuy(Model model) {

	}
	
	
	@GetMapping("/delete")
	public String delete(BuyboardVO buyboard, Criteria cri) {
		
		service.delete(buyboard.getBno());
		
		return "redirect:/buyer/buyboardlist?pageNum="+cri.getPageNum();
	}
	
	@PostMapping("/upload")
	public String upload(BuyboardVO buyboard,MultipartHttpServletRequest request1) {
		
		

			 service.insert(buyboard);

		
		return "redirect:/buyer/buyboardlist?pageNum=1&amount=10";
	}
	
	
	@GetMapping("/selectone2")
	public void selectone2(Criteria cri, @RequestParam("bno")long bno,Model model) {
		
		  BuyboardVO buyboard = service.read(bno);
		  model.addAttribute("buyboard",buyboard);
		  model.addAttribute("cri", cri);
		  
	}

	@GetMapping("/modifybuy")
	public void modifybuy(@RequestParam("bno") long bno,Model model) {
		
		model.addAttribute("buyboard",service.read(bno));
		
	}
	@PostMapping("/update")
	public String modify(BuyboardVO buyboard, RedirectAttributes rttr) {
		System.out.println(buyboard);
		
		try {
			//		HttpServletRequest request,
		
	

			service.update(buyboard);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
//		if (service.modify(buyboard)) {
//			rttr.addFlashAttribute("result", "success");
//		}
		return "redirect:/buyer/buyboardlist";
	}
	
	@GetMapping("/buyboardlist")
	public void buyboardlist(Criteria cri, Model model) {
		
		model.addAttribute("buyboardlist", service.getlist(cri));
		
		 int total = service.getTotal(cri);
		 model.addAttribute("total",total);
		 model.addAttribute("pageMaker", new PageDTO(cri, total));
			
	}
	
	
	@GetMapping("/category")
	public String category(@RequestParam("bcategory")String category) {
		
		System.out.println(category);
		
		return "/buyer/buyboardlist";
		
	}
	
	@PostMapping("/search")
	public String search(Criteria cri) {
		
		System.out.println(cri);
		
		return "/buyer/category";
		
	}	
}

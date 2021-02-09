package org.zerock.controller;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.SellboardVO;
import org.zerock.domain.upload;
import org.zerock.service.SellboardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value="/seller/*",produces="text/plain;charset=UTF-8")
@AllArgsConstructor
@SessionAttributes({"member","mid"})
public class SellBoardController {
	
	private SellboardService service;
	private upload up;
	
	@GetMapping("/uploadsell")
	public void uploadsell(Model model) {

	}
	
	@GetMapping("/delete")
	public String delete(SellboardVO sellboard, Criteria cri) {
		
		service.delete(sellboard.getSno());
		
		return "redirect:/seller/sellboardlist?pageNum="+cri.getPageNum();
	}
	@PostMapping("/upload")
	public String upload(SellboardVO sellboard,MultipartHttpServletRequest request1) {
		try {
			System.out.println("---------------------------------------------------------");		
			System.out.println(request1.getFile("sthumb1").getOriginalFilename());
			System.out.println("---------------------------------------------------------");				
		 if(!"".equals(request1.getFile("sthumb1").getOriginalFilename())) {
		 MultipartFile file = request1.getFile("sthumb1");
		 String sthumb=up.uploadFileName(file);
		 sthumb=up.fileUpload(file, sthumb);					
		 sthumb=sthumb.replace("C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\"
		 		+ "eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\","");
		 sellboard.setSthumb(sthumb);
		 }		 
		 if(!"".equals(request1.getFile("simage1").getOriginalFilename())) {
		 
		 MultipartFile file1 = request1.getFile("simage1");
		 String simage=up.uploadFileName(file1);			  
		 simage=up.fileUpload(file1, simage);					 
		 simage=simage.replace("C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\"
		 		+ "eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\","");
		 sellboard.setSimage(simage);
		 }
		sellboard.setScontent(sellboard.getScontent().replace("\r\n","<br>"));	
	    service.insert(sellboard);	   	
	    Thread.sleep(6000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/seller/sellboardlist?pageNum=1&amount=10";
	}
	
	
	@GetMapping("/selectone")
	public void selectone(Criteria cri, @RequestParam("sno")long sno,Model model) {
		
		  SellboardVO sellboard = service.read(sno);
		  model.addAttribute("sellboard",sellboard);
		  model.addAttribute("cri", cri);
		  
	}

	@GetMapping("/modifysell")
	public void modifysell(@RequestParam("sno") long sno,Model model) {
		
		model.addAttribute("sellboard",service.read(sno));
		
	}
	@PostMapping("/update")
	public String modify(SellboardVO sellboard, RedirectAttributes rttr,MultipartHttpServletRequest request1 ) {
		System.out.println(sellboard);
		
		try {
			//		HttpServletRequest request,
		
		
		
			 if(!"".equals(request1.getFile("sthumb1").getOriginalFilename())) {
				 MultipartFile file = request1.getFile("sthumb1");
				 String sthumb=up.uploadFileName(file);
				 sthumb=up.fileUpload(file, sthumb);					  // 챙占승맡モ��짚챙占승� 챙占승늘ヂ�쨍챙짠��챘짜쩌 , 챗짼쩍챘징�챙��占시モ�뮤� 챙���챙탑짜
				 sthumb=sthumb.replace("C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\","");
				 sellboard.setSthumb(sthumb);
				 }
				 
				 if(!"".equals(request1.getFile("simage1").getOriginalFilename())) {
				 
				 MultipartFile file1 = request1.getFile("simage1");
				 String simage=up.uploadFileName(file1);			  // 챗짼쩍챘징� 챘쨋�▣р��짭챙��� 챘짝짭챠��쨈
				 simage=up.fileUpload(file1, simage);					  // 챙占승늘ヂ�쨍챙짠��챘짜쩌, 챗짼쩍챘징�챙��占시モ�뮤� 챙���챙탑짜
				 simage=simage.replace("C:\\Users\\82107\\Desktop\\Util\\eclipse-jee-2019-12-R-win32-x86_64\\eclipse\\ex\\wemeet-master\\wemeet-master\\wemeetmarket\\src\\main\\webapp\\resources\\img\\","");
				 sellboard.setSimage(simage);
				 }
				 // 챗짼쩍챘징� 챘쨋�▣р��짭챙��� 챘짝짭챠��쨈
				sellboard.setScontent(sellboard.getScontent().replace("\r\n","<br>"));

			service.update(sellboard);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
//		if (service.modify(sellboard)) {
//			rttr.addFlashAttribute("result", "success");
//		}
		return "redirect:/";
	}
	
	@GetMapping("/sellboardlist")
	public void sellboardlist(Criteria cri, Model model) {
		
		model.addAttribute("sellboardlist", service.getlist(cri));
		
		 int total = service.getTotal(cri);
		 model.addAttribute("total",total);
		 model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping("/category")
	public String category(@RequestParam("scategory")String category) {
		
		System.out.println(category);
		
		return "/seller/sellboardlist";
		
	}
	
	@PostMapping("/search")
	public String search(Criteria cri) {
		
		System.out.println(cri);
		
		return "/seller/category";
		
	}	
}

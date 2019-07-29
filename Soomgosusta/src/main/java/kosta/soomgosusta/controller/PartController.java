package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.service.PartService;
//import kosta.soomgosusta.service.RecommendService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/part/*")
@AllArgsConstructor
public class PartController {
	private PartService service;
	//private RecommendService recommnedService;

	@GetMapping("/listQNA/{searchKey}")
	public String listQNA(@PathVariable("searchKey") String searchKey, Model model) {
		
		model.addAttribute("searchKey", searchKey);
		return "/part/listQNA";
	}

/*	@GetMapping("/listExpertInfo")
	 public void listExpertInfo(Model model) {
		
		List<PartVO> listExpertInfo = service.listPartService();
		List<String> lWord = new ArrayList<>();
        List<String> mWord = new ArrayList<>();
	    List<String> sWord = new ArrayList<>();
		    for(int i = 0; i < listExpertInfo.size(); i++){
		       
		       PartVO part = listExpertInfo.get(i);
		       if(!lWord.contains(part.getP_L_Word())){
		          lWord.add(part.getP_L_Word());
		       }
		       if(!mWord.contains(part.getP_M_Word())){
		          mWord.add(part.getP_M_Word());
		       }
		       if(!sWord.contains(part.getP_S_Word())){
		          sWord.add(part.getP_S_Word());
		       }
		    }
		    
		    model.addAttribute("large", lWord);
		    model.addAttribute("medium", mWord);
		    model.addAttribute("small", sWord);
			
		    
		    model.addAttribute("listQuestion", service.listExpertQusetionService());
		    model.addAttribute("listAnswer", service.listExpertAnswerService());
	
		 }*/
	

}

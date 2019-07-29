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

	@GetMapping("/main")
	public void main(Model model) {

	}

	@GetMapping("/listQNA/{searchKey}")
	public String listQNA(@PathVariable("searchKey") String searchKey, Model model) {
		
		model.addAttribute("searchKey", searchKey);
		return "/part/listQNA";
	}


	

}

package kosta.soomgosusta.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ExpertFindService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/expertFind/*")
@AllArgsConstructor
public class ExpertFindController {
	
	private ExpertFindService service;
	
	@GetMapping("/listExpertFind")
	public void listExpertFind(ExpertFindInfo info, Model model){
		

	}
}

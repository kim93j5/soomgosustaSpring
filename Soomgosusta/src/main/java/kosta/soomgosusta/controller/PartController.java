package kosta.soomgosusta.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/part/*")
@AllArgsConstructor
public class PartController {
	private PartService service;

	@GetMapping("/main")
	public void main(Model model) {

	}

	@GetMapping("/listQNA/{searchKey}")
	public String listQNA(@PathVariable("searchKey") String searchKey, Model model) {
		
		model.addAttribute("searchKey", searchKey);
		return "/part/listQNA";
	}

}

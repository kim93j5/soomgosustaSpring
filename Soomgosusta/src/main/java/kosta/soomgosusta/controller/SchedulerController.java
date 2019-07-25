package kosta.soomgosusta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.service.SchedulerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/scheduler/*")
@AllArgsConstructor
public class SchedulerController {
	
	private SchedulerService service;
	
	@GetMapping("/expertScheduler")
	public void listSchedule(){

	}

	@GetMapping("/memberScheduler/{e_Id:.+}")
	public String memberSchedule(@PathVariable("e_Id") String e_Id, Model model){
		log.info("e_Id :   " + e_Id);
		model.addAttribute("e_Id", e_Id);
		
		return "/scheduler/memberScheduler";
	}
	
	@GetMapping("/test")
	public void memberSchedule(Model model){

		model.addAttribute("m_Id", "nano125@naver.com");
	}
}

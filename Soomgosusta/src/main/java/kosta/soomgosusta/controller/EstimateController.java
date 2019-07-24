package kosta.soomgosusta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.service.EstimateService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class EstimateController {
	
	private EstimateService service;
	
	@GetMapping("/estimate/{r_Seq}")
	public String estimate(Model model, @PathVariable("r_Seq") int r_Seq){
		List<EstimateDTO> listEstimate = service.listEstimateService(r_Seq);
		
		model.addAttribute("listEstimate", listEstimate);
		log.info(listEstimate);
		
		return "member/estimate";
	}
}

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.MatchVO;
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
	
	@GetMapping("/estimate/match/{p_Seq}")
	public void insertMatch( @RequestParam("m_Status") String m_Status,
			 @RequestParam("e_Id") String e_Id, @RequestParam("m_Id") String m_Id, @PathVariable("p_Seq") int p_Seq, MatchVO matchVO){
/*		matchVO.setM_Status("ING");
		matchVO.setE_Id("nano");
		matchVO.setM_Id("nano124");*/
		matchVO.setM_Status(m_Status);
		matchVO.setE_Id(e_Id);
		matchVO.setM_Id(m_Id);
		
		service.insertMatchService(matchVO, p_Seq);

	}
}

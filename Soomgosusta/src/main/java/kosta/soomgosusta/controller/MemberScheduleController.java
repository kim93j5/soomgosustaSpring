package kosta.soomgosusta.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.MScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;
import kosta.soomgosusta.service.SchedulerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/memberSchedule/*")
@Log4j
@AllArgsConstructor
public class MemberScheduleController {
	
	private SchedulerService service;
	
	@GetMapping(value="/list/{e_Id}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MScheduleInfoDTO> getList(@PathVariable("e_Id") String e_Id){
	
		return new ResponseEntity<>(service.listMSchedule(e_Id), HttpStatus.OK);
	}
	
	@GetMapping(value="/listExpert/{m_Id}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<String> listExpert(@PathVariable("m_Id") String m_Id){
		List<String> list = service.listExpert(m_Id);
		
		return list;
	}
	
	@GetMapping(value="/detail/{s_Seq}",produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SchedulerMatchDTO> detail(@PathVariable("s_Seq") int s_Seq){
		
		return new ResponseEntity<>(service.detailSchedule(s_Seq), HttpStatus.OK);
	}
	
	@PostMapping(value= "/insert", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE, MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> insert(@RequestBody FaqVO faq){

		int insertCount = service.insertFaq(faq);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

package kosta.soomgosusta.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.FaqDTO;
import kosta.soomgosusta.domain.SC_ReplyVO;
import kosta.soomgosusta.domain.ScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;
import kosta.soomgosusta.service.PartService;
import kosta.soomgosusta.service.SchedulerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/manageSchedule/*")
@AllArgsConstructor
public class ManageScheduleController {
	
	private SchedulerService service;
	
	@PostMapping(value= "/insert", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE, MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> insert(@RequestBody SchedulerMatchDTO schedule){
		log.info(schedule);
		
		ScheduleVO newSche = new ScheduleVO();
		newSche.setS_Color(schedule.getS_Color());
		newSche.setS_Contents(schedule.getS_Contents());
		newSche.setS_Ed(schedule.getS_Ed());
		newSche.setS_Memo(schedule.getS_Memo());
		newSche.setS_Place(schedule.getS_Place());
		newSche.setS_Sd(schedule.getS_Sd());
		
		int insertCount = service.insertSchedule(newSche, schedule.getM_Id(), schedule.getE_Id());
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/list/{e_Id}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ScheduleInfoDTO> getList(@PathVariable("e_Id") String e_Id){
		
		return new ResponseEntity<>(service.listSchedule(e_Id), HttpStatus.OK);
	}
	
	@DeleteMapping(value= "/remove/{s_Seq}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<String> remove(@PathVariable("s_Seq") int s_Seq){
		
		return service.deleteSchedule(s_Seq) == 1? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/get/{s_Seq}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<SchedulerMatchDTO> get(@PathVariable("s_Seq") int s_Seq){

		return new ResponseEntity<>(service.detailSchedule(s_Seq), HttpStatus.OK);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/modify/{s_Seq}", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ScheduleVO schedule, @PathVariable("s_Seq") int s_Seq){
		
		return service.updateSchedule(schedule) == 1? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/getCount/{data}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public int getCount(){
		
		return service.countScheduleService();
	}
	
	@GetMapping(value="/getFaq/{s_Seq}",  produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FaqDTO>> getFaq(@PathVariable("s_Seq") int s_Seq){
		List<FaqDTO> listFaq = service.listFaq(s_Seq);
		
		for(int i=0; i< listFaq.size(); i++){
			listFaq.get(i).setListReply(service.listReply(listFaq.get(i).getF_Seq()));
		}
		log.info(listFaq);
		
		return new ResponseEntity<>(listFaq, HttpStatus.OK);
	}
	
	@PostMapping(value="/insertReply", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE, MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> insertReply(@RequestBody SC_ReplyVO reply){
		log.info(reply);
		int insertCount = service.insertReplyService(reply);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

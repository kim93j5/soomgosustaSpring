package kosta.soomgosusta.controller;

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

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewRestController {

	private ReviewService service;
	
	@PostMapping(value = "/new", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> regist(@RequestBody ReviewVO vo){
		log.info("ReviewVO: "+ vo);
		
		int insert = service.register(vo);
			
		return insert ==1 ? new ResponseEntity<>("success", HttpStatus.OK)
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{e_Id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
		MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReviewVO>> getList(@PathVariable("page") int page,
		@PathVariable("e_Id") String e_Id){
		
		Criteria cri = new Criteria(page, 5);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, e_Id),HttpStatus.OK);
	}
	
	@GetMapping(value="/{re_seq}",
			produces ={ MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReviewVO> get(@PathVariable("re_seq") int re_seq){
		log.info("get reviewVO by seq: " + re_seq);
		
		return new ResponseEntity<>(service.get(re_seq),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{re_seq}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> remove(@PathVariable("re_seq") int re_seq){
		
		log.info("remove seq: "+ re_seq);
		
		return service.remove(re_seq) == 1  
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReviewVO vo,
			@PathVariable("re_seq") int re_seq){
		
		vo.setRe_Seq(re_seq);
		log.info("수정할 re_seq:" + re_seq);
		return service.modify(vo)==1 
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
}

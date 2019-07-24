package kosta.soomgosusta.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.service.ExpertService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/expert/*")
@AllArgsConstructor
public class ExpertRestController {

	private ExpertService service;
	
	@GetMapping(value = "/profile/{e_Id}",
			produces ={MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<E_ProfileVO> get(@PathVariable("e_Id") String e_Id){
		log.info("getprofile --------");
		return new ResponseEntity<> (service.getProfile(e_Id), HttpStatus.OK);
	}
					


	@PutMapping("/profile/{e_Id}")
	public ResponseEntity<String> update(
			@RequestBody E_ProfileVO vo,
			@PathVariable("e_Id") String e_Id)
			 {
//		vo.setE_Id(e_Id);
		log.info("modify: "+vo);
		int r = service.updateProfile(vo);
		System.out.println("update result..............................................." + r);
		return service.updateProfile(vo) == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	
}

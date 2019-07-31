package kosta.soomgosusta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.service.PartService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/part/*")
public class MainRestController {

	@Autowired
	private PartService service;

	@GetMapping(value = "/listPart/{data}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<PartVO>> getPart(@PathVariable("data") String data) {

		log.info(data);
		return new ResponseEntity<>(service.detailPartService(data), HttpStatus.OK);
	}

	@GetMapping(value = "/listPopular", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<String>> getPopular() {
		List<String> list = service.listPopularService();
		log.info(list);
		return new ResponseEntity<>(service.listPopularService(), HttpStatus.OK);
	}
	
}

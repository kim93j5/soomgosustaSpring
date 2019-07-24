package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QnaDTO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/partAJAX/*")
@AllArgsConstructor
public class PartAjaxController {

	private PartService service;
	
	@GetMapping(value="/listPart/{data}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PartVO>> getPart(@PathVariable("data") String data){
		
		return new ResponseEntity<>(service.listPart(data), HttpStatus.OK);
	}
	
	@GetMapping(value="/listQNA/{data}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public QnaDTO getQNA(@PathVariable("data") String data){

		QnaDTO qnaList = new QnaDTO();
		
		HashMap<String, String> searchMap = new HashMap<>();

		PartVO searchPart = service.detailPart(data);

		if (searchPart != null) {
			qnaList.setSearchPart(searchPart);
			
			searchMap.put("large", "%" + searchPart.getP_L_Word() + "%");
			searchMap.put("middle", "%" + searchPart.getP_M_Word() + "%");
			searchMap.put("small", "%" + searchPart.getP_S_Word() + "%");

			List<QuestionVO> listQ = service.listQuestion(searchMap, searchPart.getP_Seq());
			List<AnswerVO> listA = service.listAnswer(listQ);

			qnaList.setListQ(listQ);
			qnaList.setListA(listA);
			qnaList.setSize(1);

		} else {
			qnaList.setSize(0);
		}
		return qnaList;
	}
}

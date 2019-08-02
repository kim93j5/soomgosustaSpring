package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.domain.PartVO;

import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/member/*")
public class MemberInfoRestController {
	@Autowired
	private PartService service;
	@GetMapping(value = "/addInfo/{m_Id}/{large}",produces={MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	public List<String> getMWord(@PathVariable("large") String LWord,@PathVariable("m_Id") String m_Id){
		List<PartVO> part = service.listPartService();
		log.info("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		log.info(LWord);
		List<String> MWords = new ArrayList<>();
		for(int i =0;i<part.size();i++){
			if(LWord.equals(part.get(i).getP_L_Word())){
				if(!MWords.contains(part.get(i).getP_M_Word())){
					MWords.add(part.get(i).getP_M_Word());
				}
			}
		}
		for(int i=0;i < MWords.size(); i++){
		log.info(MWords.get(i));}
		return MWords;
	}
	@GetMapping(value = "/addInfo/{large}/{medium}",produces={MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	public List<String> getSWord(@PathVariable("large") String LWord,@PathVariable("medium") String MWord){
		List<PartVO> part = service.listPartService();
		List<String> SWords = new ArrayList<>();
		for(int i =0;i<part.size();i++){
			if(MWord.equals(part.get(i).getP_M_Word())){
				if(!SWords.contains(part.get(i).getP_S_Word())){
					SWords.add(part.get(i).getP_S_Word());
				}
			}
		}
		for(int i=0;i < SWords.size(); i++){
		log.info(SWords.get(i));}
		return SWords;
	}
/*	@GetMapping(value = "/addInfo/{large}/{medium}/{small}",produces={MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	public List<String> getPSeq(@PathVariable("large") String LWord,@PathVariable("medium") String MWord,@PathVariable("small") String SWord){
		List<PartVO> part = service.listPartService();
		List<String> SWords = new ArrayList<>();
		return SWords;
	}*/
	
	
}


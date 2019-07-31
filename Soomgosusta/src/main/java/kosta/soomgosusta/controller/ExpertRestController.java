package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.service.ExpertService;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/expert/*")
@AllArgsConstructor
public class ExpertRestController {
	@Autowired
	private ExpertService service;
	private PartService partService;
	
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
	
	   @GetMapping(value = "/listExpertInfo/{large}",produces={MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	   public List<String> getMWord(@PathVariable("large") String LWord){
	      List<PartVO> part = partService.listPartService();
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
	   @GetMapping(value = "/listExpertInfo/{large}/{medium}",produces={MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_ATOM_XML_VALUE})
	   public List<String> getSWord(@PathVariable("large") String LWord,@PathVariable("medium") String MWord){
	      List<PartVO> part = partService.listPartService();
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
	
	
	
	
	
	
}

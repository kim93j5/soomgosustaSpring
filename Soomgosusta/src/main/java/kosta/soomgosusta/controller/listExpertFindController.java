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

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ExpertFindService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/listEF")
@Log4j
@AllArgsConstructor
public class listExpertFindController {

	private ExpertFindService service;
	
	@GetMapping(value="/list/{sido}/{gugun}/{service}/{serviceInfo}", produces={MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ExpertFindVO>> get(@PathVariable("sido") String sido, @PathVariable("gugun") String gugun,
			@PathVariable("service") String ser, @PathVariable("serviceInfo") String serviceInfo){
		
		ExpertFindInfo info = new ExpertFindInfo();
		info.setSido(sido);
		info.setGugun(gugun);
		info.setService(ser);
		info.setServiceInfo(serviceInfo);
		
		List<ExpertFindVO> eList = service.listExpertFind(info);
		
		for(int i=0; i < eList.size(); i++){
			List<ReviewVO> rList = service.listReview(eList.get(i).getEf_Id());
			double arp=0;
			
			if(rList.size() == 0){
				eList.get(i).setEf_CntReview(0);
				eList.get(i).setEf_AvgStarpoint(0);
			}else{
				for(int j=0; j<rList.size(); j++){
					arp += rList.get(j).getRe_StarPoint();
				}
				
				eList.get(i).setEf_CntReview(rList.size());
				eList.get(i).setEf_AvgStarpoint(arp/rList.size());
			}
		}
		return new ResponseEntity<>(eList, HttpStatus.OK);
	}
}

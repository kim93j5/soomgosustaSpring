package kosta.soomgosusta.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.MatchVO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ExpertFindService;
import kosta.soomgosusta.service.ExpertService;
import kosta.soomgosusta.service.MemberService;
import kosta.soomgosusta.service.PartService;
import kosta.soomgosusta.service.RequestService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/part/*")
public class MainRestController {

	@Autowired
	private PartService service;
	
	@Autowired
	private RequestService rservice;
	
	@Autowired
	private MemberService mservice;
	
	@Autowired
	private ExpertFindService ef_service;
	
	@Autowired
	private ExpertService eservice;
	
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
	
	
	@GetMapping(value = "/listMExpert/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<MatchVO>> getList(@PathVariable("id") String id){
		log.info(id);
		log.info("--------");
		
		return new ResponseEntity<>(service.listMExpertService(id), HttpStatus.OK);
		
	}
	
	@GetMapping(value = "/listMyRecommend/{id}/{divide}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<PartVO>> getRecommend(@PathVariable("id") String id, @PathVariable("divide") String divide){
		
		log.info(id);
		log.info(divide);
		
		List<PartVO> plist = new ArrayList<>();
		if(divide.equals("member")){
			List<RequestVO> list = rservice.listRequestService(id);
			if(list.size() != 0){
				PartVO part = service.getPartInfoService(list.get(0).getP_Seq());
				plist = service.detailRecommendService(part.getP_M_Word(), "%"+part.getP_S_Word()+"%");
			}else{
				plist = service.listRandomService();
			}

		}else if(divide.equals("expert")){
			PartVO part = service.getExPartInfoService(id);
			plist = service.detailRecommendService(part.getP_M_Word(), "%"+part.getP_S_Word()+"%");
		}else if(divide.equals("null")){
			plist = service.listRandomService();
		}

		return new ResponseEntity<>(plist, HttpStatus.OK);
	}
	
	@GetMapping(value="/listMyDistrict/{id}/{divide}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ExpertFindVO>> getMyDistrict(@PathVariable("id") String id, @PathVariable("divide") String divide){
		List<ExpertFindVO> expert = new ArrayList<>();
		
		if(divide.equals("member")){
			MemberVO member = mservice.findMember(id);
			String dist = member.getM_Address().substring(0, member.getM_Address().indexOf("/"));
			log.info(dist);
			expert = service.listMyDistrictService("%"+dist+"%");
					
					for (int i = 0; i < expert.size(); i++) {
						List<ReviewVO> rList = ef_service.listReview(expert.get(i).getEf_Id());
						double arp = 0;

						if (rList.size() == 0) {
							expert.get(i).setEf_CntReview(0);
							expert.get(i).setEf_AvgStarpoint(0);
						} else {
							for (int j = 0; j < rList.size(); j++) {
								arp += rList.get(j).getRe_StarPoint();
							}

							expert.get(i).setEf_CntReview(rList.size());
							expert.get(i).setEf_AvgStarpoint(arp / rList.size());
						}
					}		
			
		}else if(divide.equals("expert")){
			ExpertVO ex = eservice.findExpert(id);
			String dist = ex.getE_Address().substring(0, ex.getE_Address().indexOf("/"));
			
			expert = service.listMyDistrictService("%"+dist+"%");
			
			for (int i = 0; i < expert.size(); i++) {
				List<ReviewVO> rList = ef_service.listReview(expert.get(i).getEf_Id());
				double arp = 0;

				if (rList.size() == 0) {
					expert.get(i).setEf_CntReview(0);
					expert.get(i).setEf_AvgStarpoint(0);
				} else {
					for (int j = 0; j < rList.size(); j++) {
						arp += rList.get(j).getRe_StarPoint();
					}

					expert.get(i).setEf_CntReview(rList.size());
					expert.get(i).setEf_AvgStarpoint(arp / rList.size());
				}
			}		
		}else if(divide.equals("null")){
			ExpertFindInfo info = new ExpertFindInfo();
			expert = ef_service.listExpertFind(info);
		}
		return new ResponseEntity<>(expert, HttpStatus.OK);
	}
}

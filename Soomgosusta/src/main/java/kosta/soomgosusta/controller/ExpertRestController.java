package kosta.soomgosusta.controller;

import java.util.List;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.EmptyReaderEventListener;
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

import kosta.soomgosusta.domain.E_FilesVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ExpertFindService;
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
	private ExpertFindService ef_service;
	private PartService partService;
	
	@GetMapping(value = "/profile/{e_Id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<E_ProfileVO> get(@PathVariable("e_Id") String e_Id) {
		log.info("getprofile --------");
		return new ResponseEntity<>(service.getProfile(e_Id), HttpStatus.OK);
	}

	@PutMapping("/profile/{e_Id}")
	public ResponseEntity<String> update(@RequestBody E_ProfileVO vo, @PathVariable("e_Id") String e_Id) {
		// vo.setE_Id(e_Id);
		log.info("modify: " + vo);
		int r = service.updateProfile(vo);
		System.out.println("update result..............................................." + r);
		return service.updateProfile(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@GetMapping(value = "/profile/files/{e_Id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<E_FilesVO>> getFileList(@PathVariable("e_Id") String e_Id) {
		log.info("-----------------------");
		log.info(e_Id);
		return new ResponseEntity<>(service.getFileList(e_Id), HttpStatus.OK);
	}

	@GetMapping(value = "/list/{sido}/{gugun}/{ser}/{serviceInfo}/{orderByEC}/{orderByRevC}/{orderBySP}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ExpertFindVO>> get(@PathVariable("sido") String sido, @PathVariable("gugun") String gugun, 
			@PathVariable("ser") String ser, @PathVariable("serviceInfo") String serviceInfo, @PathVariable("orderByEC") String orderByEC,
			@PathVariable("orderByRevC")String orderByRevC, @PathVariable("orderBySP") String orderBySP) {

		ExpertFindInfo info = new ExpertFindInfo();
		info.setSido(sido);
		info.setGugun(gugun);
		info.setService(ser);
		info.setServiceInfo(serviceInfo);
		info.setOrderByEC(orderByEC);
		info.setOrderByRevC(orderByRevC);
		info.setOrderBySP(orderBySP);
		
		List<ExpertFindVO> eList = ef_service.listExpertFind(info);

		for (int i = 0; i < eList.size(); i++) {
			List<ReviewVO> rList = ef_service.listReview(eList.get(i).getEf_Id());
			double arp = 0;

			if (rList.size() == 0) {
				eList.get(i).setEf_CntReview(0);
				eList.get(i).setEf_AvgStarpoint(0);
			} else {
				for (int j = 0; j < rList.size(); j++) {
					arp += rList.get(j).getRe_StarPoint();
				}

				eList.get(i).setEf_CntReview(rList.size());
				eList.get(i).setEf_AvgStarpoint(arp / rList.size());
			}
		}

		//리뷰순 정렬
		Comparator<ExpertFindVO> reviewCntComparator = new Comparator<ExpertFindVO>() {
			
			@Override
			public int compare(ExpertFindVO o1, ExpertFindVO o2) {

				return o2.getEf_CntReview() - o1.getEf_CntReview();
			}
		};
		
		//별점순 정렬
		Comparator<ExpertFindVO> starPointComparator = new Comparator<ExpertFindVO>() {

			@Override
			public int compare(ExpertFindVO o1, ExpertFindVO o2) {
				final int comp = Double.compare(o2.getEf_AvgStarpoint(), o1.getEf_AvgStarpoint());
				
				return comp;
			}
		};
		
		if(info.getOrderByRevC().equals("checked")){
			Collections.sort(eList, reviewCntComparator);
		}
		
		if(info.getOrderBySP().equals("checked")){
			Collections.sort(eList, starPointComparator);
		}
		
		return new ResponseEntity<>(eList, HttpStatus.OK);
	}



	
	@GetMapping(value = "/listExpertInfo/{large}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_ATOM_XML_VALUE })
	public List<String> getMWord(@PathVariable("large") String LWord) {
		List<PartVO> part = partService.listPartService();
		List<String> MWords = new ArrayList<>();
		for (int i = 0; i < part.size(); i++) {
			if (LWord.equals(part.get(i).getP_L_Word())) {
				if (!MWords.contains(part.get(i).getP_M_Word())) {
					MWords.add(part.get(i).getP_M_Word());
				}
			}
		}
		for (int i = 0; i < MWords.size(); i++) {
			log.info(MWords.get(i));
		}
		return MWords;
	}

	@GetMapping(value = "/listExpertInfo/{large}/{medium}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_ATOM_XML_VALUE })
	public List<String> getSWord(@PathVariable("large") String LWord, @PathVariable("medium") String MWord) {
		List<PartVO> part = partService.listPartService();
		List<String> SWords = new ArrayList<>();
		for (int i = 0; i < part.size(); i++) {
			if (MWord.equals(part.get(i).getP_M_Word())) {
				if (!SWords.contains(part.get(i).getP_S_Word())) {
					SWords.add(part.get(i).getP_S_Word());
				}
			}
		}
		for (int i = 0; i < SWords.size(); i++) {
			log.info(SWords.get(i));
		}
		return SWords;
	}

}

package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.BestDTO;
import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.mapper.RecommendMapper;
import kosta.soomgosusta.service.PartService;
import kosta.soomgosusta.service.RecommendService;
import kosta.soomgosusta.service.RequestService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/request/*")
@AllArgsConstructor
public class RequestController {
	private RequestService service;
	private RecommendService recommendService;
	private PartService partService;

	@PostMapping("/detailRequest")
	public void detailRequest(@RequestParam("p_Seq") String p_Seq, @RequestParam("p_S_Word") String p_S_Word,
			@RequestParam("listQ_seq") List<String> listQ, @RequestParam("listA_seq") List<String> listA,
			@RequestParam("sido") List<String> sido, @RequestParam("gugun") List<String> gugun,
			@RequestParam("date") String date, @RequestParam("time") List<String> time, @RequestParam("gen") String gen,
			@RequestParam("phoneNum") String phoneNum, Model model) {

		List<QuestionVO> listQuestion = service.listQuestionService(listQ);
		List<AnswerVO> listAnswer = service.listAnswerService(listA);

		HashMap<String, String> requestMap = getRequest(listQuestion, listAnswer, date, time, gen, sido, gugun,
				phoneNum);
		requestMap.put("p_Seq", p_Seq);
		requestMap.put("m_Id", "seungwon");

		int size = service.listmyRequestService(requestMap);

		if (size == 0) {
			service.insertRequestService(requestMap, Integer.parseInt(p_Seq));
		}

		model.addAttribute("size", size);

	}

	public HashMap<String, String> getRequest(List<QuestionVO> question, List<AnswerVO> answer, String date,
			List<String> time, String gen, List<String> sido, List<String> gugun, String phoneNum) {
		HashMap<String, String> requestMap = new HashMap<>();

		for (int i = 0; i < question.size(); i++) {
			String qna = question.get(i).getQ_Contents() + "/";

			for (int j = 0; j < answer.size(); j++) {
				if (question.get(i).getQ_Seq() == answer.get(j).getQ_Seq()) {
					qna += answer.get(j).getA_Contents() + "/";
				}
			}

			requestMap.put("qna" + i, qna.substring(0, qna.length() - 1));
		}

		for (int i = question.size(); i < 10; i++) {
			requestMap.put("qna" + i, "null");
		}

		String qna = "";
		for (int i = 0; i < time.size(); i++) {
			qna += time.get(i) + "/";
		}
		requestMap.put("qna10", "전화번호를 입력하세요/" + phoneNum);
		requestMap.put("qna11", "희망하는 시간대는 언제인가요?/" + qna.substring(0, qna.length() - 1));
		requestMap.put("qna12", "언제부터 시작하기 원하시나요?/" + date);
		requestMap.put("qna13", "선호하는 고수 성별이 있나요?/" + gen);

		qna = "";
		for (int i = 0; i < sido.size(); i++) {
			if (!sido.get(i).equals("시/도 선택")) {
				qna += sido.get(i) + "/" + gugun.get(i) + ",";
			}
		}
		requestMap.put("qna14", "선호 지역을 선택하세요/" + qna.substring(0, qna.length() - 1));

		return requestMap;
	}

	@GetMapping("/sendRequest")
	public void sendRequest(Model model) {
		//추천서비스
		String m_Id = "nano124";
		MemberInfoVO interestPart = recommendService.recommendInfoService(m_Id);
		int interest_P1 = interestPart.getM_Ip1();  //첫번째 관심분야 번호 
		int interest_P2 = interestPart.getM_Ip2();  
		int interest_P3 = interestPart.getM_Ip3();  
		
		List<PartVO> list_LMS = partService.listPartService();
		List<String> list_M_Word = new ArrayList<>();
		List<PartVO> listRandom = new ArrayList<>();
		
		for(int i = 0; i < list_LMS.size(); i++){
			if(list_LMS.get(i).getP_Seq() == interest_P1){
				String M1 = list_LMS.get(i).getP_M_Word();  
				list_M_Word.add(M1);
				
			}else if(list_LMS.get(i).getP_Seq() == interest_P2){
				String M2 = list_LMS.get(i).getP_M_Word();
				list_M_Word.add(M2);

			}else if(list_LMS.get(i).getP_Seq() == interest_P3){
				String M3 = list_LMS.get(i).getP_M_Word();
				list_M_Word.add(M3);
			}
		}
		
		for(int i = 0; i < list_LMS.size(); i++){
			for(int j = 0; j < list_M_Word.size(); j++){
				if(list_LMS.get(i).getP_M_Word().equals(list_M_Word.get(j))){
					listRandom.add(list_LMS.get(i));
				}
			}
		}
		
		Collections.shuffle(listRandom);
		
		model.addAttribute("listRandom", listRandom);
		
		//인기서비스
		List<BestDTO> listBest = partService.listBestService();
		model.addAttribute("listBest", listBest);
		
		
		
		
		
		
		
		
		
		
		
		
	}
}

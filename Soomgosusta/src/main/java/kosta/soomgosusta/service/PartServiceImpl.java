package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.mapper.PartMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class PartServiceImpl implements PartService {

	@Setter(onMethod_ = {@Autowired})
	private PartMapper mapper;
	
	@Override
	public List<PartVO> detailPartService(String data){
		
		return mapper.detailPart(data);
	}
	
	@Override
	public List<String> listLWordService(){
		
		return mapper.listLWord();
		
	}
	
	@Override
	public List<String> listMWordService(){
		log.info(mapper.listMWord());
		
		return mapper.listMWord();
	}
	
	@Override
	public List<String> listSWordService(){
		log.info(mapper.listSWord());
		
		return mapper.listSWord();
		
	}
	
	@Override
	public PartVO listSearchInfoService(String searchKey) {
		
		return mapper.listSearchInfo(searchKey);
	}

	@Transactional
	@Override
	public List<QuestionVO> listQuestionService(HashMap<String, String> searchMap, int p_Seq) {

		mapper.updateSearchLog(p_Seq);
		
		return mapper.listQuestion(searchMap);
	}

	@Override
	public List<AnswerVO> listAnswerService(List<QuestionVO> listQ) {

		HashMap<String, List<QuestionVO>> map = new HashMap<>();
		map.put("listQ", listQ);
		
		return mapper.listAnswer(map);
	}
	
	@Override
	public List<PartVO> listPartService() {
		
		log.info("getListPart........");
		return mapper.listPart();
	}

	@Override
	public List<QuestionVO> listExpertQusetionService() {
		
		log.info("getListQuestion.....");
		return mapper.listExpertQuestion();
	}

	@Override
	public List<AnswerVO> listExpertAnswerService() {
		log.info("getListAnswer.....");
		return mapper.listExpertAnswer();
	}

	@Override
	public int listPSeqService(String p_L_Word, String p_M_Word, String p_S_Word) {
		return mapper.listPSeq(p_L_Word, p_M_Word, p_S_Word);
	}

	@Override
	public List<String> listPopularService() {

		return mapper.listPopular();
	}

	

}

package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.mapper.RequestMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RequestServiceImpl implements RequestService {
	
	@Setter(onMethod_ = @Autowired)
	private RequestMapper mapper;
	
	@Transactional
	@Override
	public void insertRequest(HashMap<String, String> requestMap, int p_Seq) {
		
		mapper.insertRequest(requestMap);
		mapper.updateRequestLog(p_Seq);
	}

	@Override
	public List<QuestionVO> listQuestion(List<String> list) {
		HashMap<String, List<String>> map = new HashMap<>();
		map.put("listQ", list);
		
		mapper.listQuestion(map).forEach(question -> log.info(question));
		
		return mapper.listQuestion(map);
	}

	@Override
	public List<AnswerVO> listAnswer(List<String> list) {
		HashMap<String, List<String>> map = new HashMap<>();
		map.put("listA", list);
		
		mapper.listAnswer(map).forEach(answer -> log.info(answer));
		
		return mapper.listAnswer(map);
	}

	@Override
	public int listmyRequest(HashMap<String, String> map) {

		return mapper.listmyRequest(map);
	}

}

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
	public void insertRequestService(HashMap<String, String> requestMap, int p_Seq) {

		mapper.insertRequest(requestMap);
		mapper.updateRequestLog(p_Seq);
	}

	@Override
	public List<QuestionVO> listQuestionService(List<String> list) {
		HashMap<String, List<String>> map = new HashMap<>();
		map.put("listQ", list);

		mapper.listQuestion(map).forEach(question -> log.info(question));

		return mapper.listQuestion(map);
	}

	@Override
	public List<AnswerVO> listAnswerService(List<String> list) {
		HashMap<String, List<String>> map = new HashMap<>();
		map.put("listA", list);

		mapper.listAnswer(map).forEach(answer -> log.info(answer));

		return mapper.listAnswer(map);
	}

	@Override
	public int listmyRequestService(HashMap<String, String> map) {

		return mapper.listmyRequest(map);
	}

	@Override
	public List<RequestVO> listRequestService(String m_Id) {

		return mapper.sendRequestInfo(m_Id);
	}

	@Override
	public String listPartWordService(int p_Seq) {

		return mapper.partInfo(p_Seq);
	}

	@Override
	public int cancelRequestService(int r_Seq) {
		return mapper.cancelRequest(r_Seq);
	}

}

package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.domain.RequestVO;

public interface RequestService {
	public void insertRequestService(HashMap<String, String> requestMap, int p_seq);

	public List<QuestionVO> listQuestionService(List<String> list);

	public List<AnswerVO> listAnswerService(List<String> list);

	public int listmyRequestService(HashMap<String, String> map);

	public List<RequestVO> listRequestService(String m_Id);

	public String listPartWordService(int p_Seq);

	public int cancelRequestService(int r_Seq);
	
}

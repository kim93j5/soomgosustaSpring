package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.domain.RequestVO;

public interface RequestService {
	public void insertRequest(HashMap<String, String> requestMap, int p_seq);
	public List<QuestionVO> listQuestion(List<String> list);
	public List<AnswerVO> listAnswer(List<String> list);
	public int listmyRequest(HashMap<String, String> map);
}

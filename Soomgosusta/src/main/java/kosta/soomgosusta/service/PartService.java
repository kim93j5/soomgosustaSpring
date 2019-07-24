package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartService {
	public List<PartVO> listPart(String data);
	public List<String> listLWord();
	public List<String> listMWord();
	public List<String> listSWord();
	public PartVO detailPart(String searchKey);
	public List<QuestionVO> listQuestion(HashMap<String, String> searchMap, int p_Seq);
	public List<AnswerVO> listAnswer(List<QuestionVO> listQ);
}

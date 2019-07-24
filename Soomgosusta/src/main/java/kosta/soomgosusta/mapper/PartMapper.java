package kosta.soomgosusta.mapper;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartMapper {
	List<PartVO> listPart(String data);
	List<String> listLWord();
	List<String> listMWord();
	List<String> listSWord();
	PartVO listSearchInfo(String searchKey);
	List<QuestionVO> listQuestion(HashMap<String, String> searchMap);
	List<AnswerVO> listAnswer(HashMap<String, List<QuestionVO>> map);
	int updateSearchLog(int p_Seq);
}









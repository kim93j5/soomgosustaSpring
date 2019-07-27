package kosta.soomgosusta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.BestDTO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartMapper {
	List<PartVO> detailPart(String data);
	List<String> listLWord();
	List<String> listMWord();
	List<String> listSWord();
	PartVO listSearchInfo(String searchKey);
	List<QuestionVO> listQuestion(HashMap<String, String> searchMap);
	List<AnswerVO> listAnswer(HashMap<String, List<QuestionVO>> map);
	int updateSearchLog(int p_Seq);
	List<PartVO> listPart();
	List<QuestionVO> listExpertQuestion();
	List<AnswerVO> listExpertAnswer();
	
	int listPSeq(@Param("p_L_Word") String p_L_Word, @Param("p_M_Word") String p_M_Word, @Param("p_S_Word") String p_S_Word);
	
	List<BestDTO> listBest();
}









	
	

package kosta.soomgosusta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartMapper {
	
	List<PartVO> listPart();
	List<QuestionVO> listQuestion();
	List<AnswerVO> listAnswer();
	
	int listPSeq(@Param("p_L_Word") String p_L_Word, @Param("p_M_Word") String p_M_Word, @Param("p_S_Word") String p_S_Word);
}

package kosta.soomgosusta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.domain.RequestVO;

public interface RequestMapper {
	int insertRequest(HashMap<String, String> requestMap);

	List<QuestionVO> listQuestion(HashMap<String, List<String>> map);

	List<AnswerVO> listAnswer(HashMap<String, List<String>> map);

	int listmyRequest(HashMap<String, String> map);

	int updateRequestLog(int p_Seq);

	List<RequestVO> sendRequestInfo(String m_Id);

	String partInfo(int p_Seq);

	int cancelRequest(int r_Seq);

}

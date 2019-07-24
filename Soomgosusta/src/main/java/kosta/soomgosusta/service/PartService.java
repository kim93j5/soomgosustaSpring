package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartService {
	public List<PartVO> detailPartService(String data);

	public List<String> listLWordService();

	public List<String> listMWordService();

	public List<String> listSWordService();

	public PartVO listSearchInfoService(String searchKey);

	public List<QuestionVO> listQuestionService(HashMap<String, String> searchMap, int p_Seq);

	public List<AnswerVO> listAnswerService(List<QuestionVO> listQ);

	public List<PartVO> listPartService();

	public List<QuestionVO> listExpertQusetionService();

	public List<AnswerVO> listExpertAnswerService();

	public int listPSeqService(String p_L_Word, String p_M_Word, String p_S_Word);
}

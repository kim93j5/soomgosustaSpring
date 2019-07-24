package kosta.soomgosusta.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;

public interface PartService {
	
	public List<PartVO> listPartService();
	public List<QuestionVO> listQusetionService();
	public List<AnswerVO> listAnswerService();
	
	public int listPSeqService(String p_L_Word, String p_M_Word, String p_S_Word);
}

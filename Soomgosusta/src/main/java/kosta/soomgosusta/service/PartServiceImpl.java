package kosta.soomgosusta.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.mapper.PartMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class PartServiceImpl implements PartService {
	
	@Setter(onMethod_=@Autowired)
	private PartMapper mapper;

	@Override
	public List<PartVO> listPartService() {
		
		log.info("getListPart........");
		return mapper.listPart();
	}

	@Override
	public List<QuestionVO> listQusetionService() {
		
		log.info("getListQuestion.....");
		return mapper.listQuestion();
	}

	@Override
	public List<AnswerVO> listAnswerService() {
		log.info("getListAnswer.....");
		return mapper.listAnswer();
	}

	@Override
	public int listPSeqService(String p_L_Word, String p_M_Word, String p_S_Word) {
		// TODO Auto-generated method stub
		return mapper.listPSeq(p_L_Word, p_M_Word, p_S_Word);
	}

}

package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.QuestionVO;
import kosta.soomgosusta.mapper.PartMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PartServiceImpl implements PartService {

	@Setter(onMethod_ = {@Autowired})
	private PartMapper mapper;
	
	@Override
	public List<PartVO> listPart(String data){
		
/*		mapper.listPart().forEach(part -> log.info(part));*/
		
		return mapper.listPart(data);
	}
	
	@Override
	public List<String> listLWord(){
		
		return mapper.listLWord();
		
	}
	
	@Override
	public List<String> listMWord(){
		log.info(mapper.listMWord());
		
		return mapper.listMWord();
	}
	
	@Override
	public List<String> listSWord(){
		log.info(mapper.listSWord());
		
		return mapper.listSWord();
		
	}
	
	@Override
	public PartVO detailPart(String searchKey) {
		
		return mapper.listSearchInfo(searchKey);
	}

	@Transactional
	@Override
	public List<QuestionVO> listQuestion(HashMap<String, String> searchMap, int p_Seq) {

		mapper.updateSearchLog(p_Seq);
		
		return mapper.listQuestion(searchMap);
	}

	@Override
	public List<AnswerVO> listAnswer(List<QuestionVO> listQ) {

		HashMap<String, List<QuestionVO>> map = new HashMap<>();
		map.put("listQ", listQ);
		
		return mapper.listAnswer(map);
	}
	
}

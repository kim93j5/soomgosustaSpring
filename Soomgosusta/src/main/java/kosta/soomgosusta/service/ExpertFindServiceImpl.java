package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.mapper.ExpertFindMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ExpertFindServiceImpl implements ExpertFindService {

	@Setter(onMethod_ = @Autowired)
	private ExpertFindMapper mapper;
	
	@Override
	public List<ExpertFindVO> listExpertFind(ExpertFindInfo info) {
		
		return mapper.listExpertFind(info);
	}

	@Override
	public List<ReviewVO> listReview(String e_Id) {
		
		return mapper.listReview(e_Id);
	}

}

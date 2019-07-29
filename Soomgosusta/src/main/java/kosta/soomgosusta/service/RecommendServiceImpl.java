package kosta.soomgosusta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.mapper.RecommendMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecommendServiceImpl implements RecommendService {
	
	@Setter(onMethod_={@Autowired})
	private RecommendMapper mapper;
	
	@Override
	public MemberInfoVO recommendInfoService(String m_Id) {
		
		return mapper.recommendInfo(m_Id);
	}

}

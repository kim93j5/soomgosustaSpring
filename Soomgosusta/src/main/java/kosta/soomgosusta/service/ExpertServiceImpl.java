package kosta.soomgosusta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.mapper.ExpertMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ExpertServiceImpl implements ExpertService {
	
	@Setter(onMethod_=@Autowired)
	private ExpertMapper mapper;

	@Override
	public int insertExpertInfo(ExpertInfoVO expert_Info) {
		
		//log.info("get...." + expert_Info);
		return mapper.insertExpertInfo(expert_Info);
	}
	
}

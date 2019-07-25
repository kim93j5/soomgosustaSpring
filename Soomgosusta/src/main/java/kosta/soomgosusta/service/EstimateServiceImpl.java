package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.EstimateVO;
import kosta.soomgosusta.mapper.EstimateMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class EstimateServiceImpl implements EstimateService {
	
	@Setter(onMethod_=@Autowired)
	private EstimateMapper mapper;

	@Override
	public List<EstimateDTO> listEstimateService(int r_Seq) {
	
		return mapper.listEstimate(r_Seq);
	}
	
	@Override
	public void register(EstimateVO estimate) {
		// TODO Auto-generated method stub
		

		mapper.register(estimate);
	}

	@Override
	public EstimateVO read(int seq) {
		
		return mapper.read(seq);
	}
	
}

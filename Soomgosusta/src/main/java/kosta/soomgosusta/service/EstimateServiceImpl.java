package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.EstimateDTO;
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


}

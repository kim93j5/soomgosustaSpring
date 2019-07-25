package kosta.soomgosusta.service;

import java.util.List;



import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.EstimateVO;

public interface EstimateService {

	public List<EstimateDTO> listEstimateService(int r_Seq);
	
	public void register(EstimateVO estimate);
	
	public EstimateVO read(int seq);
}

package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.EstimateVO;
import kosta.soomgosusta.domain.MatchVO;

public interface EstimateService {

	public List<EstimateDTO> listEstimateService(int r_Seq);

	public void register(EstimateVO estimate);

	public EstimateVO read(int seq);

	public void insertMatchService(MatchVO matchVO, int p_Seq);
}

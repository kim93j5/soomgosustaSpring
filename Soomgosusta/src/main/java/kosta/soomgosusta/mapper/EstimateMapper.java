package kosta.soomgosusta.mapper;

import java.util.List;



import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.EstimateVO;
import kosta.soomgosusta.domain.MatchVO;

public interface EstimateMapper {

	List<EstimateDTO> listEstimate(int r_Seq);

	public void register(EstimateVO estimate);

	public EstimateVO read(int seq);
	
	void insertMatch(MatchVO matchVO);
	
	int countMatch(int p_Seq);
	
}

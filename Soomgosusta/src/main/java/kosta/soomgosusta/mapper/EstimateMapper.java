package kosta.soomgosusta.mapper;

import java.util.List;



import kosta.soomgosusta.domain.EstimateDTO;
import kosta.soomgosusta.domain.EstimateVO;

public interface EstimateMapper {

	List<EstimateDTO> listEstimate(int r_Seq);

	public void register(EstimateVO estimate);

	public EstimateVO read(int seq);
}

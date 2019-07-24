package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.EstimateDTO;

public interface EstimateMapper {
	
	List<EstimateDTO> listEstimate(int r_Seq);
}

package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestVO;

public interface RequestMapper {
	
	List<RequestVO> sendRequestInfo(String m_Id);
	
	String partInfo(int p_Seq);
	
	int cancelRequest(int r_Seq);
}

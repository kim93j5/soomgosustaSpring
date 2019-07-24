package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestVO;

public interface RequestService {
	public List<RequestVO> listRequestService(String m_Id);
	public String listPartWordService(int p_Seq);
	public int cancelRequestService(int r_Seq);
}

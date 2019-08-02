package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.domain.RequestVO;



public interface LinkService {

	public List<LinkVO> getListName(String name);
	
	public List<LinkVO> getList(String id);
	
	public LinkVO read(int seq);

	public int modifyEnter(LinkVO link);
	
	public int remove(int seq);
	
	public int modifyStatus(int seq);
	
	public List<ExpertInfoVO> getExpertInfoService(int p_Seq);
	
	public List<RequestVO> getRequestInfoService(String m_Id);
	
	public void insertLinkService(LinkVO link);
}

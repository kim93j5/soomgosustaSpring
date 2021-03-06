package kosta.soomgosusta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.domain.RequestVO;


public interface LinkMapper {

	public List<LinkVO> getListName(String name);
	
	public List<LinkVO> getList(String id);
	
	public LinkVO read(int seq);
	
	public int delete(int seq);
	
	public int updateEnter(LinkVO link);
	
	public int updateStatus(int seq);
	
	public List<ExpertInfoVO> getExpertAddInfo(int p_Seq);
	
	public List<RequestVO> getRequestInfo(String m_Id);
	
	public void insertLink(LinkVO link);
}

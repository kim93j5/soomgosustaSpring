package kosta.soomgosusta.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.mapper.LinkMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LinkServiceImpl implements LinkService {

	@Setter(onMethod_ = @Autowired)
	private LinkMapper mapper;
	
	@Override
	public List<LinkVO> getList(String id) {

		
		return mapper.getList(id);
	}

	@Override
	public LinkVO read(int seq) {
		
		return mapper.read(seq);
	}

	@Override
	public int modifyEnter(LinkVO link) {
		
		return mapper.updateEnter(link);
	}

	@Override
	public int remove(int seq) {
		
		return mapper.delete(seq);
	}

	@Override
	public int modifyStatus(int seq) {
		
		return mapper.updateStatus(seq);
	}

	@Override

	public List<LinkVO> getListName(String name) {
		
		return mapper.getListName(name);
		
	}
	public List<ExpertInfoVO> getExpertInfoService(int p_Seq) {
		return mapper.getExpertAddInfo(p_Seq);
	}

	@Override
	public List<RequestVO> getRequestInfoService(String m_Id) {
		return mapper.getRequestInfo(m_Id);
	}

	@Override
	public void insertLinkService(LinkVO link) {
		mapper.insertLink(link);
	}

	

	
	
	

}

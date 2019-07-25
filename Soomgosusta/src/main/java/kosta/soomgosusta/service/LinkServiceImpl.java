package kosta.soomgosusta.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.LinkVO;
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
	public List<LinkVO> getList() {

		
		return mapper.getList();
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

	

	
	
	

}

package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.mapper.PartMapper;
import kosta.soomgosusta.mapper.RequestMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class RequestServiceImpl implements RequestService {
	
	@Setter(onMethod_= @Autowired)
	private RequestMapper mapper;

	@Override
	public List<RequestVO> listRequestService(String m_Id) {

		return mapper.sendRequestInfo(m_Id);
	}

	@Override
	public String listPartWordService(int p_Seq) {
		
		return mapper.partInfo(p_Seq);
	}

	@Override
	public int cancelRequestService(int r_Seq) {
		return mapper.cancelRequest(r_Seq);
	}

}

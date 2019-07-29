package kosta.soomgosusta.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.MatchDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.ReviewPageDTO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.mapper.ReviewMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_=@Autowired)
	private ReviewMapper mapper;
	
	
	@Override
	public int register(ReviewVO vo) {
		
		return mapper.register(vo);
	}


	@Override
	public ReviewVO get(int re_Seq) {
		// TODO Auto-generated method stub
		return mapper.get(re_Seq);
	}


	@Override
	public int modify(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}


	@Override
	public int remove(int re_Seq) {
		// TODO Auto-generated method stub
		return mapper.delete(re_Seq);
	}


	@Override
	public List<ReviewVO> getList(Criteria cri, String e_Id) {
		return mapper.getListWithPaging(cri, e_Id);
	}


	@Override
	public int findMatch(Map<String, String> param) {
		
		return mapper.findMatch(param);
	}


	@Override
	public MemberVO getMember(String m_Id) {
		return mapper.getMember(m_Id);
	}


	@Override
	public ReviewPageDTO getListPage(Criteria cri, String e_Id) {
		
		return new ReviewPageDTO(mapper.getCountByEid(e_Id), mapper.getListWithPaging(cri, e_Id));
	}

}

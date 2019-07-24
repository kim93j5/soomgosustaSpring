package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.Criteria;
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
	public ReviewVO get(int re_seq) {
		// TODO Auto-generated method stub
		return mapper.get(re_seq);
	}


	@Override
	public int modify(ReviewVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}


	@Override
	public int remove(int re_seq) {
		// TODO Auto-generated method stub
		return mapper.delete(re_seq);
	}


	@Override
	public List<ReviewVO> getList(Criteria cri, String e_Id) {
		return mapper.getListWithPaging(cri, e_Id);
	}

}

package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO vo);

	public ReviewVO get(int re_seq);
	
	public int modify(ReviewVO vo);
	
	public int remove(int re_seq);

	public List<ReviewVO> getList(Criteria cri, String e_Id);
	
}

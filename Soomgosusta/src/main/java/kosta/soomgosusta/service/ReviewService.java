package kosta.soomgosusta.service;

import java.util.List;
import java.util.Map;

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.MatchDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.ReviewPageDTO;
import kosta.soomgosusta.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO vo);

	public ReviewVO get(int re_Seq);
	
	public int modify(ReviewVO vo);
	
	public int remove(int re_Seq);

	public List<ReviewVO> getList(Criteria cri, String e_Id);

	public int findMatch(Map<String, String> param);
	
	public ReviewPageDTO getListPage(Criteria cri, String e_Id);
	
	public MemberVO getMember(String m_Id);
	
}

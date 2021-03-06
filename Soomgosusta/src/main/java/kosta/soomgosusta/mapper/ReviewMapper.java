package kosta.soomgosusta.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.MatchDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.ReviewVO;

public interface ReviewMapper {
	public int register(ReviewVO vo);

	public int update(ReviewVO vo);

	public int delete(int re_Seq);

	public List<ReviewVO> getListWithPaging(@Param("cri") Criteria cri,@Param("e_Id") String e_Id);

	public int getCountByEid(String e_Id);
	
	public ReviewVO get(int re_Seq);
	
	public MemberVO getMember(String m_Id);

	public int findMatch(Map<String, String> param);
}

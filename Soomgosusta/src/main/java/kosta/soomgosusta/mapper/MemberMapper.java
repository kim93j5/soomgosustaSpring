package kosta.soomgosusta.mapper;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.domain.MemberMypageDTO;
import kosta.soomgosusta.domain.MemberVO;

public interface MemberMapper {
	void register(MemberVO memberVO);

	int login(String login_Id);

	MemberVO findMember(String login_Id);
	
	MemberMypageDTO getMemberMypageInfo(String m_Id);
	
	int memberImageUpdate(MemberMypageDTO mypage);
	
	String getMemberPart(int pSeq);
	
	int getPSeq(@Param("p_L_Word") String p_L_Word,@Param("p_M_Word") String p_M_Word,@Param("p_S_Word") String p_S_Word);
	
	void insertMemberAddInfo(MemberInfoVO memberAddInfo);
	
	int memberImageUpdate(@Param("m_Id") String m_Id,@Param("m_Photo") String m_Photo);
}

package kosta.soomgosusta.service;

import java.io.UnsupportedEncodingException;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.domain.MemberMypageDTO;
import kosta.soomgosusta.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO memberVO) throws UnsupportedEncodingException;

	public int login(LoginDTO loginDTO) throws UnsupportedEncodingException;

	public MemberVO findMember(String login_Id);
	
	public String getMemberPart(int pSeq);
	
	public int getPSeq(@Param("p_L_Word") String p_L_Word,@Param("p_M_Word") String p_M_Word,@Param("p_S_Word") String p_S_Word);
	
	public void insertMemberAddInfo(MemberInfoVO memberAddInfo);
	
	public MemberMypageDTO getMemberMypageInfo(String m_Id);
	
	public int memberImageUpdate(@Param("m_Id") String m_Id,@Param("m_Photo") String m_Photo);
}

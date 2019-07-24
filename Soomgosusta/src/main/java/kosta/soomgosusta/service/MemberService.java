package kosta.soomgosusta.service;

import java.io.UnsupportedEncodingException;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO memberVO) throws UnsupportedEncodingException;

	public int login(LoginDTO loginDTO) throws UnsupportedEncodingException;

	public MemberVO findMember(String login_Id);
}

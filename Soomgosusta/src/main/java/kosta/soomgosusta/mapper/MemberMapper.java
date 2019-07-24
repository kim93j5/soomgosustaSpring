package kosta.soomgosusta.mapper;

import kosta.soomgosusta.domain.MemberVO;

public interface MemberMapper {
	void register(MemberVO memberVO);

	int login(String login_Id);

	MemberVO findMember(String login_Id);
}

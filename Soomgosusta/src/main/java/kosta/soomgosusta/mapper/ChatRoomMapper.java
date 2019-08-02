package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.ChatRoomVO;



public interface ChatRoomMapper {

	public void insert(ChatRoomVO chatroom);
	
	public List<ChatRoomVO> getList(String name);
	
	public ChatRoomVO findMemberName(int crno);
	
	public ChatRoomVO findExpertName(int crno);

	public ChatRoomVO get(int crno);
	
	public List<ChatRoomVO> getMemberList(String name);
	
	public ChatRoomVO getInfo(int crno);
}

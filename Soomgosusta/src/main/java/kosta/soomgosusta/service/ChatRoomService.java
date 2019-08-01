package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.ChatRoomVO;



public interface ChatRoomService {

	public List<ChatRoomVO> getList(String name);
	
	public void insert(ChatRoomVO chatroom);
	
	public ChatRoomVO findMName(int crno);
	
	public ChatRoomVO findEName(int crno);
	
	public ChatRoomVO get(int crno);
}

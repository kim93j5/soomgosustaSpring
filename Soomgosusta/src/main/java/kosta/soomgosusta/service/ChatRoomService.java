package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.ChatRoomVO;



public interface ChatRoomService {

	public List<ChatRoomVO> getList();
	
	public void insert(ChatRoomVO chatroom);
}

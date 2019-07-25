package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.ChatRoomVO;



public interface ChatRoomMapper {


	public void insert(ChatRoomVO chatroom);
	
	public List<ChatRoomVO> getList();

}

package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.ChatRoomVO;
import kosta.soomgosusta.mapper.ChatRoomMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

	@Setter(onMethod_ = @Autowired)
	private ChatRoomMapper mapper;
	
	
	

	@Override
	public void insert(ChatRoomVO chatroom) {
		
		mapper.insert(chatroom);
	}




	@Override
	public List<ChatRoomVO> getList(String name) {
		
		return mapper.getList(name);
	}

}

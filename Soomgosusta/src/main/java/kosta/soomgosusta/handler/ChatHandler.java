package kosta.soomgosusta.handler;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import kosta.soomgosusta.domain.ChatRoomVO;
import kosta.soomgosusta.domain.ChatVO;
import kosta.soomgosusta.service.ChatRoomService;
import lombok.Setter;

public class ChatHandler extends TextWebSocketHandler {
	
		private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
		@Autowired
		private ChatRoomService crService;
		
		
		
		private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
		
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//연결 종료
		System.out.println("종료");
		users.put(session.getId(),session);
		sessionList.add(session);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트 서버접속 성공했을때 마다
		System.out.println("연결");

		users.put(session.getId(), session);
		sessionList.add(session);
	
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메세지 ㄱㄱ
			System.out.println(message.getPayload());
		
		ChatVO cvo = ChatVO.convertMessage(message.getPayload());
		
		ChatRoomVO crvo = new ChatRoomVO();
		
		int seq = cvo.getCrno();
		
		
		
			crvo = crService.findMName(seq);
		
		String membername = crvo.getMember().getM_Name();
				
		 
			crvo =	crService.findEName(seq);
			
		String expertname = crvo.getExpert().getE_Name();
				


		
		if(cvo.getCh_Sender().equals(expertname)){
			cvo.setCh_Receiver(membername);
			System.out.println(cvo.getCh_Receiver());
			
		}else if(cvo.getCh_Sender().equals(membername)){
			cvo.setCh_Receiver(expertname);
			System.out.println(cvo.getCh_Receiver());
		}
	
		
		for(WebSocketSession sess : sessionList){
			
			 Gson gson = new Gson();
	          String msgJson = gson.toJson(cvo);
	          sess.sendMessage(new TextMessage(msgJson));
	          
		}
	}

	
	
}

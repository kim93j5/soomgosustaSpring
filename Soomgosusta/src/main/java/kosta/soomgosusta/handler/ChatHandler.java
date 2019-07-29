package kosta.soomgosusta.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kosta.soomgosusta.domain.ChatVO;

public class ChatHandler extends TextWebSocketHandler {
		private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);
		private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//연결 종료
		System.out.println("session");
		sessionList.remove(session);
		logger.info("{} 연결 끊킴",session.getId());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//클라이언트 서버접속 성공했을때 마다
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메세지 ㄱㄱ
		logger.info("{}로 부터 {} 받음", session.getId(),message.getPayload());
		
		ChatVO cvo = ChatVO.convertMessage(message.getPayload());
		
		for(WebSocketSession sess : sessionList){
				sess.sendMessage(new TextMessage(cvo.getCh_Contents()));
				sess.sendMessage(new TextMessage(cvo.getCh_Sender()));
		}
	}

	
	
}

/*package kosta.soomgosusta.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.userdetails.User;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


import kosta.soomgosusta.interceptor.SessionNames;

public class AlarmHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getId(session);
		for(WebSocketSession sess: sessions){
			sess.sendMessage(new TextMessage(senderId + ":" + message.getPayload()));
		}
		
		//protocol: cmd,댓글작성자,게시글작성자,bno (reply, user2, user1, 1234)
		String msg = message.getPayload();
		if(StringUtils.isEmpty(msg)){
		   String[] strs = msg.split(",");
		   if(strs != null && strs.length == 4){
			   String cmd = strs[0];
			   String replyWriter = strs[0];
			   String boardWriter = strs[0];
			   String bno = strs[0];
			   
			   WebSocketSession boardWriteSession= userSessions.get(boardWriter);//get하면 웹소켓세션이 옴
			   if("reply".equals(cmd) && boardWriteSession != null){
				   TextMessage tmpMsg = new TextMessage(replyWriter + "님이" + bno + "번 게시글에 댓글을 달았습니다!" );
				   boardWriteSession.sendMessage(tmpMsg);
			   }
		   }
		   
		}
	}
	
	
	
	private String getId(WebSocketSession session) {
		//Map<String, Object> httpSession = session.getAttributes();
		//User loginUser= (User)httpSession.get(SessionNames.LOGIN); 
		if(null == loginUser)
			return session.getId();
		else
			return loginUser.getUsername();
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
}
*/
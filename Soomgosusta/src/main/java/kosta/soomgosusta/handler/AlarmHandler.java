package kosta.soomgosusta.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kosta.soomgosusta.domain.AlarmVO;
import kosta.soomgosusta.service.AlarmService;

@Repository
public class AlarmHandler extends TextWebSocketHandler{
   @Autowired
   AlarmService service;
   
   private static Logger logger = LoggerFactory.getLogger(AlarmHandler.class);
   private Map<WebSocketSession, String> mapList = new HashMap<>();
   private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception{
      logger.info("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
      sessions.put(session.getId(), session);
      sessionList.add(session);
      logger.info("{} 연결됨", session.getId());
      logger.info("DddddDDDDDDDDDDDDDddddd1");
      Map<String, Object> map = session.getAttributes();
      logger.info("DddddDDDDDDDDDDDDDddddd2");
      String userId = (String) map.get("login");
      /*AlarmVO alarmVo = (AlarmVO)map.get("login");
      String userId = alarmVo.getM_Id();*/
      logger.info("DddddDDDDDDDDDDDDDddddd3");
      mapList.put(session, userId);
      sessionList.add(session);
      logger.info("DddddDDDDDDDDDDDDDddddd4");
      logger.info(userId);
      
      List<AlarmVO> alarmList = service.getAlarmList(userId);
      String str="<div id='count'>"+service.alarmCount(userId)+"<div id ='getAlarmList' style = 'display:none;'><ul>";
      for(int i =0;i<alarmList.size();i++){
         str += "<div id='getAlarm'><li><a href='/member/addInfo'>"+alarmList.get(i).getE_Id()+"님이 보내신 "+alarmList.get(i).getAl_Message()+"입니다</a></li></div>";
         logger.info(str);
      }
      str+="</ul></div></div>";
      session.sendMessage(new TextMessage(str));
      
      
      
      /*logger.info("세션 추가 : "+alarmVo.getM_Id());*/
      //String alarmList = JsonAlarmList(userId);
      //sessionList.get(i)
   }
   @Override
   public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
      Map<String, Object> map = session.getAttributes();
      logger.info("DddddDDDDDDDDDDDDDddddd2");
      String userId = (String) map.get("login");
   
      System.out.println("어어어어어어어어어어어어어어어어어ㅓ엉");
      System.out.println(session.getId());
      System.out.println(message);
      //Iterator<String> sessionIds = sessions.keySet().iterator();
      //String sessionId="";
      /*while(sessionIds.hasNext()){
         sessionId = sessionIds.next();
         sessions.get(sessionId).sendMessage(new TextMessage(userId+" : "+message.getPayload()));
      }*/
      /*List<AlarmVO> alarmList = service.getAlarmList(userId);
      String str="<div id='count'>"+service.alarmCount(userId)+"<div id ='getAlarmList' style = 'display:none;'><ul>";
      for(int i =0;i<alarmList.size();i++){
         str += "<div id='getAlarm'><li><a>"+alarmList.get(i).getE_Id()+"님이 보내신 "+alarmList.get(i).getAl_Message()+"입니다</a></li></div>";
         logger.info(str);
      }
      str+="</ul></div></div>";
      session.sendMessage(new TextMessage(str));
      logger.info("{}로 부터  {}메세지가 도착함", session.getId(),message.getPayload());
      */
      //AlarmVO alvo = AlarmVO.convertMsg(session.getId());
      /*for(WebSocketSession sess : sessionList){
         //sess.sendMessage(new TextMessage(alvo.getM_Id()));
         //sess.sendMessage(new TextMessage(alvo.getAl_Message()));
         //sess.sendMessage(new TextMessage(alvo.getE_Id()));
      }*/
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      // 연결 종료
      Map<String, Object> map = session.getAttributes();
      logger.info("DddddDDDDDDDDDDDDDddddd2");
      String userId = (String) map.get("login");
      mapList.remove(session);
      sessionList.remove(session);
      
      logger.info("바보야 왜 연결 안돼");
      System.out.println("End Session");
      /*
       * mapList.remove(session); sessionList.remove(session);
       */
      sessions.remove(session.getId());
      sessionList.remove(session);
      logger.info("{} 연결 끊킴", session.getId());
   }
   
   public String JsonAlarmList(String m_Id){
      List<AlarmVO> alarmList = service.getAlarmList(m_Id);
      String alList = sessionList.size()+"";
      for(int i=0;i<alarmList.size();i++){
         alList +=",";
         alList += alarmList.get(i).getM_Id() + "/";
         alList += alarmList.get(i).getE_Id() + "/";
         alList += alarmList.get(i).getAl_Message() + "/";
         alList += alarmList.get(i).getAl_Check() + "/";
         alList += alarmList.get(i).getAl_Type() + "/";
         alList += alarmList.get(i).getAl_Time();
      }
      return alList;
   }
   
   
 
   
}
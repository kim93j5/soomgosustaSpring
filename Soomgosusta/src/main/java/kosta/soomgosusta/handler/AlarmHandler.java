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
      logger.info("세션리스트사이즈:" + sessionList.size());
      logger.info("DddddDDDDDDDDDDDDDddddd4");
      logger.info(userId);
      List<AlarmVO> alarmList = service.getAlarmList(userId);
      String str="<div id='count'>"+service.alarmCount(userId)+"<div id ='getAlarmList' style = 'display:none;'><ul>";
      for(int i =0;i<alarmList.size();i++){
          str += "<div id='getAlarm'><li><a class='a' href=";
          if(alarmList.get(i).getAl_Type().equals("request")){
               str+="/expert/request/received";
            }else if(alarmList.get(i).getAl_Type().equals("inquiry")){
               str+="/scheduler/expertScheduler";
            }else if(alarmList.get(i).getAl_Type().equals("estimate")){
               str+="/request/sendRequest/"+alarmList.get(i).getReceiver();
            }else if(alarmList.get(i).getAl_Type().equals("schedule")){
               str+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
            }else if(alarmList.get(i).getAl_Type().equals("reply")){
               str+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
               }
          
      str += " id='"+alarmList.get(i).getAl_Seq()+"'>"+alarmList.get(i).getSender()+"님으로부터<br><br>  "+alarmList.get(i).getAl_Message()+"</a></li></div>";
          logger.info(str);
       }
       str+="</ul></div></div>";
      session.sendMessage(new TextMessage(str));
   }
   @Override
   public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
      Map<String, Object> map = session.getAttributes();
      logger.info("DddddDDDDDDDDDDDDDddddd2");
      String userId = (String) map.get("login");
   
      System.out.println("어어어어어어어어어어어어어어어어어ㅓ엉");
      System.out.println(session.getId());
      System.out.println(message);
      logger.info("{} 메세지 받음", message.getPayload());
      service.alarmCheckUpdate(Integer.parseInt(message.getPayload()));
      for(WebSocketSession webSocketSession : sessionList){
         String e_id = mapList.get(webSocketSession);
         String str = "";
         if(!session.getId().equals(webSocketSession.getId())){
             List<AlarmVO> alarmList = service.getAlarmList(e_id);
             str+="<div id='count'>"+service.alarmCount(e_id)+"<div id ='getAlarmList' style = 'display:none;'><ul>";
             for(int i =0;i<alarmList.size();i++){
                str += "<div id="+alarmList.get(i).getAl_Seq()+"><li><a class='a' href=";
                if(alarmList.get(i).getAl_Type().equals("request")){
                     str+="/expert/request/received";
                  }else if(alarmList.get(i).getAl_Type().equals("inquiry")){
                     str+="/scheduler/expertScheduler";
                  }else if(alarmList.get(i).getAl_Type().equals("estimate")){
                     str+="/request/sendRequest/"+alarmList.get(i).getReceiver();
                  }else if(alarmList.get(i).getAl_Type().equals("schedule")){
                     str+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
                  }else if(alarmList.get(i).getAl_Type().equals("reply")){
                     str+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
                     }
                
            str += ">"+alarmList.get(i).getSender()+"님으로부터<br><br>  "+alarmList.get(i).getAl_Message()+"</a></li></div>";
             }
             str+="</ul></div></div>";
             
             logger.info("아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
              logger.info("e_ID:" + e_id);
              logger.info("아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
              webSocketSession.sendMessage(new TextMessage(str));
         }else{
            List<AlarmVO> alarmList = service.getAlarmList(userId);
             String str21="<div id='count'>"+service.alarmCount(userId)+"<div id ='getAlarmList' style = 'display:none;'><ul>";
             for(int i =0;i<alarmList.size();i++){
                 str21 += "<div id='getAlarm'><li><a class='a' href=";
                 if(alarmList.get(i).getAl_Type().equals("request")){
                      str21+="/expert/request/received";
                   }else if(alarmList.get(i).getAl_Type().equals("inquiry")){
                      str21+="/scheduler/expertScheduler";
                   }else if(alarmList.get(i).getAl_Type().equals("estimate")){
                      str21+="/request/sendRequest/"+alarmList.get(i).getReceiver();
                   }else if(alarmList.get(i).getAl_Type().equals("schedule")){
                      str21+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
                   }else if(alarmList.get(i).getAl_Type().equals("reply")){
                      str21+="/scheduler/memberScheduler/"+alarmList.get(i).getSender();
                      }
                 
             str21 += " id='"+alarmList.get(i).getAl_Seq()+"'>"+alarmList.get(i).getSender()+"님으로부터  "+alarmList.get(i).getAl_Message()+"</a></li></div>";
              }
              str21+="</ul></div></div>";
             session.sendMessage(new TextMessage(str21));
         }
         
         
      }
      
     
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
   
   /*public String JsonAlarmList(String m_Id){
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
   }*/
   
   
 
   
}
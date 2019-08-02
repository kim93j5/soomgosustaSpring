package kosta.soomgosusta.domain;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class AlarmVO {
   private int al_Seq;
   private String al_Type;
   private String al_Check;
   private Date al_Time;
   private String al_Message;
   private String e_Id;
   private String m_Id;
   
/*   public static AlarmVO convertMsg(String source){
      AlarmVO message = new AlarmVO();
      Gson gson = new Gson();
      message = gson.fromJson(source, AlarmVO.class);
      
      return message;
   }*/

}


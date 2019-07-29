package kosta.soomgosusta.domain;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class ChatVO {
	
	private int ch_Seq;
	private String ch_Contents;
	private Date ch_SDate;
	private Date ch_RDate;
	private String ch_Sender;
	private String ch_Receiver;
	private int crno;
	
	private ChatRoomVO chatroom; 
	
	
	public static ChatVO convertMessage(String source) {
		ChatVO message = new ChatVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatVO.class);
		return message;
	}

}

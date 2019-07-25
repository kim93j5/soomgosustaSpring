package kosta.soomgosusta.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class ChatRoomVO {

	private int crno;
	private int e_Seq;

	private PartVO part;
	private MemberVO member;
	private RequestVO request;
	private LinkVO link;
	private EstimateVO estimate;
	
	
}

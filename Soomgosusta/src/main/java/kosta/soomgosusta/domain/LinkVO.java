package kosta.soomgosusta.domain;






import lombok.Data;

@Data
public class LinkVO {
	private int l_Seq;
	private int r_Seq;
	private String l_Status;
	private String l_Date;
	private String l_Enter;
	private float l_Percent;
	private String e_Id;
	
	private MemberVO member;
	private PartVO part;
	private RequestVO request;
}

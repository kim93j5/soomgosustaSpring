package kosta.soomgosusta.domain;



import lombok.Data;

@Data
public class EstimateVO {
	
	private int e_Seq;
	private String e_Status;
	private String e_Contents;
	private String e_Amount;
	private String e_AmountPart;
	private String e_Date;
	private int l_Seq; 
	
	private PartVO part;
	private MemberVO member;
	private RequestVO request;
	private LinkVO link;
}

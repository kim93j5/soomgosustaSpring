package kosta.soomgosusta.domain;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int re_Seq;
	private String re_Date;
	private Double re_StarPoint;
	private String re_Contents;
	private int m_Seq;
	private String m_Id;
	private String e_Id;
	
}

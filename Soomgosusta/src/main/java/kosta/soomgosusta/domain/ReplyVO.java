package kosta.soomgosusta.domain;

import lombok.Data;

@Data
public class ReplyVO {
	private int r_Seq;
	private String r_Contents;
	private String r_Date;
	private int f_Seq;
}

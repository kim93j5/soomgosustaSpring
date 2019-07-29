package kosta.soomgosusta.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MatchVO {
	private int m_Seq;
	private String m_Status;
	private Date m_Sd;
	private Date m_Ed;
	private String e_Id;
	private String m_Id;
}

package kosta.soomgosusta.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SchedulerMatchDTO {
	private int s_Seq;
	private String s_Contents;
	private String s_Sd;
	private String s_Ed;
	private String s_Place;
	private String s_Color;
	private String s_Memo;
	private String m_Id;
	private String e_Id;
	private String m_Name;
	private String m_Photo;
}

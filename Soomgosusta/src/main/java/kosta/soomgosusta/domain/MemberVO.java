package kosta.soomgosusta.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String member_Id;
	private String m_Password;
	private String m_Name;
	private String m_Pnum;
	private String m_Gender;
	private int m_Age;
	private String m_Divide;
	private String m_Photo;
	
	
	
}
package kosta.soomgosusta.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberMypageDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String m_Id;
	private String m_Password;
	private String m_Name;
	private String m_Photo;
	private int m_Ip1;
	private int m_Ip2;
	private int m_Ip3;
	private String m_Address;
}

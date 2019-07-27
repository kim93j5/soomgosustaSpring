package kosta.soomgosusta.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberInfoVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String m_Id;
	private int m_Ip1;
	private int m_Ip2;
	private int m_Ip3;
}

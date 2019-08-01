package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class FaqDTO {
	int s_Seq;
	int f_Seq;
	String f_Contents;
	String f_Date;
	String m_Id;
	String m_Name;
	String m_Photo;
	String e_Id;
	String e_Name;
	String e_Photo;
	
	List<SC_ReplyVO> listReply;
}

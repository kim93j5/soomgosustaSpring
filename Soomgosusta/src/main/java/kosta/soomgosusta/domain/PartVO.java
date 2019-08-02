package kosta.soomgosusta.domain;

import lombok.Data;

@Data
public class PartVO {
	private int p_Seq;
	private String p_L_Word;
	private String p_M_Word;
	private String p_S_Word;
	private String p_Image;
	
	private int pl_Register;
}

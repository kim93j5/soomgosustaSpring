package kosta.soomgosusta.domain;

import java.io.Serializable;

import lombok.Data;


@Data
public class ExpertVO implements Serializable {
	

	private static final long serialVersionUID = 1L;
	private String expert_Id;
	private String e_Password;
	private String e_Name;
	private String e_Gender;
	private String e_Pnum;
	private int e_Age;
	private String e_Divide;
	private String e_Photo;

	

	
}

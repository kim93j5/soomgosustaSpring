package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class E_ProfileVO {
	private String e_Id;
	private String ep_Ol;
	private String ep_Dl;
	
	private List<E_FilesVO> attachList;
}

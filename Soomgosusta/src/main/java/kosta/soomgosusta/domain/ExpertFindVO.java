package kosta.soomgosusta.domain;

import lombok.Data;

@Data
public class ExpertFindVO {
	private String ef_Id;
	private String ef_District;
	private String ef_p_S_Word;
	private double ef_AvgStarpoint;
	private int ef_CntReview;
	private String ef_Photo;
	private String ef_OL; //한줄소개
	private int ef_RC; //고용수
}

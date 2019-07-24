package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;

public interface ExpertFindService {

	public List<ExpertFindVO> listExpertFind(ExpertFindInfo info);
	public List<ReviewVO> listReview(String e_Id);
}

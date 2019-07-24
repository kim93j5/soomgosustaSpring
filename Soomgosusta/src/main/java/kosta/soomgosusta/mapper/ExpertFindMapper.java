package kosta.soomgosusta.mapper;

import java.util.HashMap;
import java.util.List;

import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertFindVO;
import kosta.soomgosusta.domain.ReviewVO;

public interface ExpertFindMapper {
	List<ExpertFindVO> listExpertFind(ExpertFindInfo info);
	List<ReviewVO> listReview(String e_Id);
}

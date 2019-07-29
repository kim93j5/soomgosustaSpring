package kosta.soomgosusta.mapper;

import java.util.Map;

import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.ExpertInfoVO;

public interface ExpertMapper {
	void register(ExpertVO expertVO);

	int login(String login_Id);

	ExpertVO findExpert(String login_Id);

	E_ProfileVO getProfile(String e_Id);

	int updateEPhoto(Map<String, String> param);

	int updateProfile(E_ProfileVO vo);

	void insertExpertInfo(ExpertInfoVO expert_Info);
	
	int countRegister(int p_Seq);

}

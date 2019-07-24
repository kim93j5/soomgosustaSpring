package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.domain.ScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;

public interface SchedulerMapper {
	ExpertVO detailExpert(String e_Id);
	ExpertInfoVO detailExInfo(String e_Id);
	List<ScheduleVO> listSchedule(String e_Id);
	int insertSchedule(ScheduleVO schedule);
	String detailPart(String e_Id);
	List<SchedulerMatchDTO> listMatch(String e_Id);
	int deleteSchedule(int s_Seq);
	ScheduleVO detailSchedule(int s_Seq);
	int updateSchedule(ScheduleVO schedule);
	List<FaqVO> listFaq(String e_Id);
	List<String> listExpert(String m_Id);
	int insertFaq(FaqVO faq);
}
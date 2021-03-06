package kosta.soomgosusta.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.FaqDTO;
import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.MatchListDTO;
import kosta.soomgosusta.domain.MatchVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.domain.SC_ReplyVO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;

public interface SchedulerMapper {
	ExpertVO detailExpert(String e_Id);
	ExpertInfoVO detailExInfo(String e_Id);
	List<SchedulerMatchDTO> listSchedule(String e_Id);
	int insertSchedule(ScheduleVO schedule);
	int detailMatch(@Param("e_Id") String e_Id, @Param("m_Id") String m_Id);
	PartVO detailPart(String e_Id);
	int deleteSchedule(int s_Seq);
	SchedulerMatchDTO detailSchedule(int s_Seq);
	int updateSchedule(ScheduleVO schedule);
	List<FaqDTO> listFaq(int s_Seq);
	List<SC_ReplyVO> listReply(int f_Seq);
	List<String> listExpert(String m_Id);
	int insertFaq(FaqVO faq);
	int countSchedule();
	int insertReply(SC_ReplyVO reply);
	List<MatchListDTO> listMatch(String e_Id);
	int updateMatch(HashMap<String, Object> map);
	int updateRequest(HashMap<String, Object> map);
	MatchVO detailFaqAlarm(int s_Seq);
	MatchVO detailRPAlarm(int sr_Seq);
}
package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.FaqDTO;
import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.MScheduleInfoDTO;
import kosta.soomgosusta.domain.SC_ReplyVO;
import kosta.soomgosusta.domain.ScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;

public interface SchedulerService {
	//고수 일정페이지
	public ScheduleInfoDTO listSchedule(String e_Id);
	public int insertSchedule(ScheduleVO schedule, String m_Id, String e_Id);
	public int deleteSchedule(int s_Seq);
	public SchedulerMatchDTO detailSchedule(int s_Seq);
	public int updateSchedule(ScheduleVO schedule);
	public int countScheduleService();
	List<FaqDTO> listFaq(int s_Seq);
	List<SC_ReplyVO> listReply(int f_Seq);
	public int insertReplyService(SC_ReplyVO reply);
	
	//이용자 일정페이지
	public MScheduleInfoDTO listMSchedule(String e_Id);
	public List<String> listExpert(String m_Id);
	public int insertFaq(FaqVO faq);
}

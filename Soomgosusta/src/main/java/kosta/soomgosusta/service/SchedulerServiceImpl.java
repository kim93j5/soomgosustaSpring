
package kosta.soomgosusta.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.FaqDTO;
import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.MScheduleInfoDTO;
import kosta.soomgosusta.domain.SC_ReplyVO;
import kosta.soomgosusta.domain.ScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
import kosta.soomgosusta.domain.SchedulerMatchDTO;
import kosta.soomgosusta.mapper.SchedulerMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class SchedulerServiceImpl implements SchedulerService {
	
	@Setter(onMethod_ = @Autowired)
	private SchedulerMapper mapper;

	@Transactional
	@Override
	public ScheduleInfoDTO listSchedule(String e_Id) {
		
		ScheduleInfoDTO schedule = new ScheduleInfoDTO();
		
		schedule.setExpert(mapper.detailExpert(e_Id));
		schedule.setExInfo(mapper.detailExInfo(e_Id));
		schedule.setListSchedule(mapper.listSchedule(e_Id));
		schedule.setPart(mapper.detailPart(e_Id));
		schedule.setListMatch(mapper.listMatch(e_Id));
		
		return schedule;
	}
	
	@Override
	public int insertSchedule(ScheduleVO schedule, String m_Id, String e_Id) {

		schedule.setM_Seq(mapper.detailMatch(e_Id, m_Id));
		
		return mapper.insertSchedule(schedule);
	}

	@Override
	public int deleteSchedule(int s_Seq) {

		return mapper.deleteSchedule(s_Seq);
	}

	@Override
	public SchedulerMatchDTO detailSchedule(int s_Seq) {

		return mapper.detailSchedule(s_Seq);
	}

	@Override
	public int updateSchedule(ScheduleVO schedule) {
		
		return mapper.updateSchedule(schedule);
	}

	@Transactional
	@Override
	public MScheduleInfoDTO listMSchedule(String e_Id) {
		MScheduleInfoDTO schedule = new MScheduleInfoDTO();
		
		schedule.setPart(mapper.detailPart(e_Id));
		schedule.setExpert(mapper.detailExpert(e_Id));
		schedule.setExInfo(mapper.detailExInfo(e_Id));
		schedule.setListSchedule(mapper.listSchedule(e_Id));
		
		return schedule;
	}

	@Override
	public List<String> listExpert(String m_Id) {
		
		return mapper.listExpert(m_Id);
	}

	@Override
	public int insertFaq(FaqVO faq) {
		
		return mapper.insertFaq(faq);
	}

	@Override
	public int countScheduleService() {

		return mapper.countSchedule();
	}

	@Override
	public List<FaqDTO> listFaq(int s_Seq) {

		return mapper.listFaq(s_Seq);
	}

	@Override
	public List<SC_ReplyVO> listReply(int f_Seq) {

		return mapper.listReply(f_Seq);
	}

	@Override
	public int insertReplyService(SC_ReplyVO reply) {

		return mapper.insertReply(reply);
	}

	@Transactional
	@Override
	public int updateMatchService(HashMap<String, Object> map) {
		log.info("service..............");
		mapper.updateMatch(map);
		return mapper.updateRequest(map);
	}
	
	
}

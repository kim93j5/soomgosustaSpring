
package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.FaqVO;
import kosta.soomgosusta.domain.MScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleInfoDTO;
import kosta.soomgosusta.domain.ScheduleVO;
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
	public int insertSchedule(ScheduleVO schedule) {

		return mapper.insertSchedule(schedule);
	}

	@Override
	public List<ScheduleVO> mySchedule(String e_Id) {
		
		return mapper.listSchedule(e_Id);
	}

	@Override
	public int deleteSchedule(int s_Seq) {

		return mapper.deleteSchedule(s_Seq);
	}

	@Override
	public ScheduleVO detailSchedule(int s_Seq) {

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
	
	
}

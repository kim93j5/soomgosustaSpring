package kosta.soomgosusta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.soomgosusta.domain.AlarmVO;
import kosta.soomgosusta.mapper.AlarmMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AlarmServiceImpl implements AlarmService {

	@Setter(onMethod_ = @Autowired)
	private AlarmMapper mapper;
	@Override
	public List<AlarmVO> getAlarmList(String m_Id) {
		return mapper.getAlarmList(m_Id);
	}
	@Override
	public void alarmInsert(AlarmVO alarmVo) {
		mapper.alarmInsert(alarmVo);
		
	}
	@Override
	public int alarmCount(String m_Id) {
		return mapper.alarmCount(m_Id);
	}
	@Override
	public int insertSDAlarmService(String m_Id, String e_Id) {

		return mapper.insertSDAlarm(m_Id, e_Id);
	}
	@Override
	public int insertIQAlarmService(String m_Id, String e_Id) {
		
		return mapper.insertIQAlarm(m_Id, e_Id);
	}
	@Override
	public int insertRPAlarmService(String m_Id, String e_Id) {
		
		return mapper.insertRPAlarm(m_Id, e_Id);
	}
	@Override
	public int alarmCheckUpdate(int al_Seq) {
		return mapper.alarmCheckUpdate(al_Seq);
	}

}

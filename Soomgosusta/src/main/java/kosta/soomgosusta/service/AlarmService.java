package kosta.soomgosusta.service;

import java.util.List;

import kosta.soomgosusta.domain.AlarmVO;

public interface AlarmService {
	public List<AlarmVO> getAlarmList(String m_Id);
	public void alarmLinkInsert(AlarmVO alarmVo);
	public int alarmCount(String m_Id);
}	

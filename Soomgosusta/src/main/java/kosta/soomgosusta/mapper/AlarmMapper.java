package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.AlarmVO;

public interface AlarmMapper {
	
	//public List<AlarmVO> expertAlarm(String e_Id);
	public List<AlarmVO> memberAlarm(String m_Id);
	public int alarmCount(String m_Id);

}
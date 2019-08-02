package kosta.soomgosusta.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.AlarmVO;

public interface AlarmService {
	public List<AlarmVO> getAlarmList(String m_Id);
	public void alarmLinkInsert(AlarmVO alarmVo);
	public int alarmCount(String m_Id);
	public int insertSDAlarmService(String m_Id, String e_Id);
	public int insertIQAlarmService(String m_Id, String e_Id);
	public int insertRPAlarmService(String m_Id, String e_Id);
}	

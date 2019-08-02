package kosta.soomgosusta.mapper;

import java.util.List;

import kosta.soomgosusta.domain.AlarmVO;

public interface AlarmMapper {
	public List<AlarmVO> getAlarmList(String m_Id);
	public void alarmInsert(AlarmVO alarmVo);
	public int alarmCount(String m_Id);
	public int alarmCheckUpdate(int al_Seq);
}

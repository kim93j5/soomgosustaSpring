package kosta.soomgosusta.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kosta.soomgosusta.domain.AlarmVO;

public interface AlarmMapper {
	public List<AlarmVO> getAlarmList(String m_Id);
	public void alarmInsert(AlarmVO alarmVo);
	public int alarmCount(String m_Id);
	public int insertSDAlarm(@Param("m_Id") String m_Id, @Param("e_Id") String e_Id);
	public int insertIQAlarm(@Param("m_Id") String m_Id, @Param("e_Id") String e_Id);
	public int insertRPAlarm(@Param("m_Id") String m_Id, @Param("e_Id") String e_Id);
	public int alarmCheckUpdate(int al_Seq);

}

package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class ScheduleInfoDTO {
	private List<ScheduleVO> listSchedule;
	private ExpertVO expert;
	private ExpertInfoVO exInfo;
	private String part;
	private List<SchedulerMatchDTO> listMatch;
}

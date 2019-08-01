package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class MScheduleInfoDTO {
	private List<SchedulerMatchDTO> listSchedule;
	private ExpertVO expert;
	private ExpertInfoVO exInfo;
	private PartVO part;
}

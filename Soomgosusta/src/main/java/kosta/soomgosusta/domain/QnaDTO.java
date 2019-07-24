package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class QnaDTO {
	private PartVO searchPart;
	private int size;
	private List<QuestionVO> listQ;
	private List<AnswerVO> listA;
}

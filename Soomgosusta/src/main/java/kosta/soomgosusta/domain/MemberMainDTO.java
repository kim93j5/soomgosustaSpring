package kosta.soomgosusta.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberMainDTO {
	private List<RequestVO> request;
	private List<RequestDTO> requestDTO;
	private List<RequestDetailDTO> requestDetailDTO;
	private int size;
}

package kosta.soomgosusta.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ExpertFindInfo {
	private String sido;
	private String gugun;
	private String service;
	private String serviceInfo;
	private String orderByEC; //고용순
	private String orderByRevC; //리뷰순
	private String orderBySP; //별점순
	
	public ExpertFindInfo(){
		this("지역 전체", "전체", "분야 전체", "전체", "not", "not", "not");
	}
	
	public ExpertFindInfo(String sido, String gugun, String service, String serviceInfo, String orderByEC, String orderByRevC, String orderBySP) {
		this.sido = sido;
		this.gugun = gugun;
		this.service = service;
		this.serviceInfo = serviceInfo;
		this.orderByEC = orderByEC;
		this.orderByRevC = orderByRevC;
		this.orderBySP = orderBySP;
	}
	
	public String getListLink(){
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("sido", this.sido)
				.queryParam("gugun", this.gugun)
				.queryParam("service", this.service)
				.queryParam("serviceInfo", this.serviceInfo)
				.queryParam("orderByEC", this.orderByEC)
				.queryParam("orderByRevC", this.orderByRevC)
				.queryParam("orderBySP", this.orderBySP);
		
		return builder.toUriString();
	}




}

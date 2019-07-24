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
	
	public ExpertFindInfo(){
		this("지역 전체", "전체", "분야 전체", "전체");
	}
	
	public ExpertFindInfo(String sido, String gugun, String service, String serviceInfo) {
		this.sido = sido;
		this.gugun = gugun;
		this.service = service;
		this.serviceInfo = serviceInfo;
	}
	
	public String getListLink(){
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("sido", this.sido)
				.queryParam("gugun", this.gugun)
				.queryParam("service", this.service)
				.queryParam("serviceInfo", this.serviceInfo);

		return builder.toUriString();
	}




}

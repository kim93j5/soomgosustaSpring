package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.service.LinkService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class LinkController {
	private LinkService service;
	@RequestMapping("/match")
	public void getMatchPercent() {
		String m_Id = "YENA";
		RequestVO requestInfo = service.getRequestInfoService(m_Id);
		int p_Seq = requestInfo.getP_Seq();
		String r_Time = requestInfo.getR_QA_12();
		String r_Start = requestInfo.getR_QA_13();
		String r_Gender = requestInfo.getR_QA_14();
		String r_District = requestInfo.getR_QA_15();
		
		List<ExpertInfoVO> expertList = service.getExpertInfoService(p_Seq);
		for (int i = 0; i < expertList.size(); i++) {
		ExpertInfoVO expertAddInfoVO = expertList.get(i);
		String expertAddInfo = expertAddInfoVO.getEi_District() + expertAddInfoVO.getEi_Gender()
					+ expertAddInfoVO.getEi_Start() + expertAddInfoVO.getEi_Time();
		float total = matchCal(r_Time, expertAddInfo, 20) + matchCal(r_District, expertAddInfo, 35)
				+ matchCal(r_Start, expertAddInfo, 15) + matchCal(r_Gender, expertAddInfo, 30);

		LinkVO linkInsert = new LinkVO();
		linkInsert.setE_Id(expertList.get(i).getE_Id());
		linkInsert.setL_Percent(total);
		linkInsert.setR_Seq(requestInfo.getR_Seq());
			
		service.insertLinkService(linkInsert);
		}
	}

	public float matchCal(String requestInfo, String expertAddInfo, float score) {
		List<String> compareMember = new ArrayList();
		String groupArr[] = requestInfo.split("[/,]");
		for (int j = 1; j < groupArr.length; j++) {
			compareMember.add(groupArr[j]);
		}
		
		List<String> expert = new ArrayList();
		String groupArr2[] = expertAddInfo.split("[/,]");
		for (int j = 0; j < groupArr2.length; j++) {
			if(!expert.contains(groupArr2[j]))
				expert.add(groupArr2[j]);
		}
		String expertInfo ="";
		for(int i=0;i<expert.size();i++){
			expertInfo+=expert.get(i);
		}
		log.info(expertInfo);
		score /= compareMember.size();
		float scorePoint = 0;
			
			for (int j = 0; j < compareMember.size(); j++) {
				float point = 0;
				String memberInfo = compareMember.get(j);
				log.info(compareMember.get(j));
				
				scorePoint+=kmp(expertInfo,memberInfo,point,score);
			}

		return scorePoint;

	}

	public static float kmp(String expertAddInfo,String memberInfo,float point,float score){
		char[] s = expertAddInfo.toCharArray();
		char[] p = memberInfo.toCharArray();
		int[] pi = getPI(memberInfo);
		int n = expertAddInfo.length();

		int m = memberInfo.length();
		score /= m;
		int j =0;
		
		for(int i =0;i<n;i++){
			while (j>0 && s[i]!=p[j]){
				j = pi[j-1];
			}
			if(s[i] == p[j]){
				point += score;
				if(j==m-1){
					j = pi[j];
				}else{
					j++;
				}
			}
		}
		return point;
	}
	public static int[] getPI(String memberInfo){
		int m = memberInfo.length();
		int j = 0;
		char[] p = memberInfo.toCharArray();
		int[] pi = new int[m];
		
		for(int i = 1; i<m;i++){
			while (j>0&&p[i] != p[j]){
				j = pi[j-1];
			}
			if(p[i]==p[j]){
				pi[i]=++j;
				}
		}
		return pi;
	}
}

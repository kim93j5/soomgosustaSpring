package kosta.soomgosusta.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.service.ExpertService;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/expert/*")
public class ExpertController {

	private ExpertService expertService;
	private PartService partService;
	
	@PostMapping("/listExpertInfo")
	public void listExpertInfo(
			                   @RequestParam("q_Seq") String[] question,
			                   @RequestParam("a_Seq") int[] answer,
			                   @RequestParam("sido") String[] sido,
			                   @RequestParam("sigungu") String[] sigungu,
			                   @RequestParam("large") String p_L_Word,
			                   @RequestParam("medium") String p_M_Word, 
			                   @RequestParam("small") String p_S_Word
			                   ){
		
/*		for(int i = 0; i < sido.length; i++){
			log.info(sido[i]);
		}*/
		
		log.info(p_L_Word);
		log.info(p_M_Word);
		log.info(p_S_Word);
		
		String ei_District = "";
		String sumDistrict = "";
		String[] district = new String[3];
		
		for(int i = 0; i < sido.length; i++){
		  if(!sido[i].equals("시/도 선택")){
			  district[i] = sido[i] + "/" + sigungu[i];
			  sumDistrict += district[i];			  
			  sumDistrict += ",";			  
		  }
		}
		
		ei_District = sumDistrict.substring(0, sumDistrict.length()-1);
		
		log.info(ei_District);

		int p_Seq = partService.listPSeqService(p_L_Word, p_M_Word, p_S_Word);
		log.info(p_Seq);

/*		for(int i = 0; i <question.length; i++){
		log.info(question[i]);
		}*/
		
		List<AnswerVO> listAnswer = partService.listAnswerService();
		String ei_Time = "";
		String ei_Start= "";
		String ei_Gender="";
		
		for(int i = 0; i < listAnswer.size(); i++){
        	for(int j = 0; j < answer.length; j++){
        		if(listAnswer.get(i).getA_Seq() == answer[j]){
        			int qSeq = listAnswer.get(i).getQ_Seq();
        			 if(qSeq == 1){
        				 ei_Time += listAnswer.get(i).getA_Contents() + "/";
        			}else if(qSeq == 2){
        				ei_Start += listAnswer.get(i).getA_Contents() + "/";
        			}else if(qSeq == 3){
        				ei_Gender = listAnswer.get(i).getA_Contents();
        			}
        		}
        	}		
        	
		}
		
		ei_Time = ei_Time.substring(0, ei_Time.length()-1);
		ei_Start = ei_Start.substring(0, ei_Start.length()-1);
		
		log.info(ei_Time);
		log.info(ei_Start);
		log.info(ei_Gender);
		

	   ExpertInfoVO e_Info = new ExpertInfoVO();
		e_Info.setE_Id("nano");
		e_Info.setEi_Time(ei_Time);
		e_Info.setEi_Start(ei_Start);
		e_Info.setEi_District(ei_District);
		e_Info.setP_Seq(p_Seq);
		e_Info.setEi_Gender(ei_Gender);
		
		log.info(e_Info);
		expertService.insertExpertInfo(e_Info);
		
	}
}

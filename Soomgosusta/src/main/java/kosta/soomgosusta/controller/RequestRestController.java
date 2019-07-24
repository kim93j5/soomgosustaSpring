package kosta.soomgosusta.controller;

import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.MemberMainDTO;
import kosta.soomgosusta.domain.RequestDTO;
import kosta.soomgosusta.domain.RequestDetailDTO;
import kosta.soomgosusta.domain.RequestVO;
import kosta.soomgosusta.service.RequestService;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/requestStatus/*")
public class RequestRestController {
	@Autowired
	private RequestService service;

	@GetMapping(value = "/cancel/{r_Seq}")
	public int cancel(@PathVariable("r_Seq") int r_Seq) {

		return service.cancelRequestService(r_Seq);
	}

	/// joda time 라이브러리 꼭 추가해야함. ///
	@GetMapping(value = "/getList/{m_Id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MemberMainDTO getList(@PathVariable("m_Id") String m_Id) {

		MemberMainDTO memberMain = new MemberMainDTO();
		
		String nowTime = LocalDateTime.now().toString("yyyy-MM-dd HH:mm:ss");
	    List<RequestVO> listSendRequest = service.listRequestService(m_Id);
		List<RequestDTO> listPartRequest = new ArrayList<RequestDTO>();
		

		for (int i = 0; i < listSendRequest.size(); i++) {
			DateTime dt = new DateTime(listSendRequest.get(i).getR_Date());
			DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
			RequestDTO requestDTO = new RequestDTO();

			String requestTime = dt.toString(fmt);
			// log.info(requestTime);
			requestDTO.setRequestTime(requestTime);

			// 48시간 지난 후
			dt = dt.plusDays(2);
			String endTime = dt.toString(fmt);
			// log.info(endTime);
			requestDTO.setEndTime(endTime);

			requestDTO.setP_S_Word(service.listPartWordService(listSendRequest.get(i).getP_Seq()));

			int r_Seq = listSendRequest.get(i).getR_Seq();
			requestDTO.setR_Seq(r_Seq);
			requestDTO.setNowTime(nowTime);

			listPartRequest.add(requestDTO);
			log.info(requestDTO);
			memberMain.setRequestDTO(listPartRequest);
		}

		List<RequestVO> listForm = service.listRequestService(m_Id);
		memberMain.setRequest(listForm);
		// log.info(listForm.size());
		memberMain.setSize(listForm.size());

		// 질문, 답 잘라내기
		List<RequestDetailDTO> listRequestDetail = new ArrayList<>();

		for (int i = 0; i < listSendRequest.size(); i++) {
			RequestDetailDTO requestDetailDTO = new RequestDetailDTO();
			String QnA01 = listSendRequest.get(i).getR_QA_01();
			int idx1 = QnA01.indexOf("?");
			if (idx1 != -1) {
				String q01 = QnA01.substring(0, idx1 + 1);
				String a01 = QnA01.substring(QnA01.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ01(q01);
				requestDetailDTO.setA01(a01);

			}

			String QnA02 = listSendRequest.get(i).getR_QA_02();
			int idx2 = QnA02.indexOf("?");
			if (idx2 != -1) {
				String q02 = QnA02.substring(0, idx2 + 1);
				String a02 = QnA02.substring(QnA02.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ02(q02);
				requestDetailDTO.setA02(a02);
			}

			String QnA03 = listSendRequest.get(i).getR_QA_03();
			int idx3 = QnA03.indexOf("?");
			if (idx3 != -1) {
				String q03 = QnA03.substring(0, idx3 + 1);
				String a03 = QnA03.substring(QnA03.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ03(q03);
				requestDetailDTO.setA03(a03);
			}

			String QnA04 = listSendRequest.get(i).getR_QA_04();
			int idx4 = QnA04.indexOf("?");
			if (idx4 != -1) {
				String q04 = QnA04.substring(0, idx4 + 1);
				String a04 = QnA04.substring(QnA04.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ04(q04);
				requestDetailDTO.setA04(a04);
			}

			String QnA05 = listSendRequest.get(i).getR_QA_05();
			int idx5 = QnA05.indexOf("?");
			if (idx5 != -1) {
				String q05 = QnA05.substring(0, idx5 + 1);
				String a05 = QnA05.substring(QnA05.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ05(q05);
				requestDetailDTO.setA05(a05);
			}

			String QnA06 = listSendRequest.get(i).getR_QA_06();
			int idx6 = QnA06.indexOf("?");
			if (idx6 != -1) {
				String q06 = QnA06.substring(0, idx6 + 1);
				String a06 = QnA06.substring(QnA06.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ06(q06);
				requestDetailDTO.setA06(a06);
			}

			String QnA07 = listSendRequest.get(i).getR_QA_07();
			int idx7 = QnA07.indexOf("?");
			if (idx7 != -1) {
				String q07 = QnA07.substring(0, idx7 + 1);
				String a07 = QnA07.substring(QnA07.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ07(q07);
				requestDetailDTO.setA07(a07);
			}

			String QnA08 = listSendRequest.get(i).getR_QA_08();
			int idx8 = QnA08.indexOf("?");
			if (idx8 != -1) {
				String q08 = QnA08.substring(0, idx8 + 1);
				String a08 = QnA08.substring(QnA08.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ08(q08);
				requestDetailDTO.setA08(a08);
			}

			String QnA09 = listSendRequest.get(i).getR_QA_09();
			int idx9 = QnA09.indexOf("?");
			if (idx9 != -1) {
				String q09 = QnA02.substring(0, idx9 + 1);
				String a09 = QnA02.substring(QnA09.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ09(q09);
				requestDetailDTO.setA09(a09);
			}

			String QnA10 = listSendRequest.get(i).getR_QA_10();
			int idx10 = QnA10.indexOf("?");
			if (idx10 != -1) {
				String q10 = QnA10.substring(0, idx10 + 1);
				String a10 = QnA10.substring(QnA10.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ10(q10);
				requestDetailDTO.setA10(a10);
			}

			String QnA11 = listSendRequest.get(i).getR_QA_11();
			int idx11 = QnA11.indexOf("?");
			if (idx11 != -1) {
				String q11 = QnA11.substring(0, idx11 + 1);
				String a11 = QnA11.substring(QnA11.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ11(q11);
				requestDetailDTO.setA11(a11);
			}

			String QnA12 = listSendRequest.get(i).getR_QA_12();
			int idx12 = QnA12.indexOf("?");
			if (idx12 != -1) {
				String q12 = QnA12.substring(0, idx12 + 1);
				String a12 = QnA12.substring(QnA12.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ12(q12);
				requestDetailDTO.setA12(a12);
			}

			String QnA13 = listSendRequest.get(i).getR_QA_13();
			int idx13 = QnA13.indexOf("?");
			if (idx13 != -1) {
				String q13 = QnA13.substring(0, idx13 + 1);
				String a13 = QnA13.substring(QnA13.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ13(q13);
				requestDetailDTO.setA13(a13);
			}

			String QnA14 = listSendRequest.get(i).getR_QA_14();
			int idx14 = QnA14.indexOf("?");
			if (idx14 != -1) {
				String q14 = QnA14.substring(0, idx14 + 1);
				String a14 = QnA14.substring(QnA14.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ14(q14);
				requestDetailDTO.setA14(a14);
			}

			String QnA15 = listSendRequest.get(i).getR_QA_15();
			int idx15 = QnA15.indexOf("?");
			if (idx15 != -1) {
				String q15 = QnA15.substring(0, idx15 + 1);
				String a15 = QnA15.substring(QnA15.lastIndexOf("?/") + 1).substring(1);
				requestDetailDTO.setQ15(q15);
				requestDetailDTO.setA15(a15);
			}


			listRequestDetail.add(requestDetailDTO);
			memberMain.setRequestDetailDTO(listRequestDetail);
			
		}
		log.info(memberMain);
		return memberMain;
		
		

	}

}

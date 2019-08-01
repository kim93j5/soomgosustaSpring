package kosta.soomgosusta.controller;


import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.stream.events.DTD;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.ChatRoomVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.LinkDTO;
import kosta.soomgosusta.domain.LinkVO;
import kosta.soomgosusta.service.ChatRoomService;
import kosta.soomgosusta.service.LinkService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/requests/*")
@RestController
@Log4j
@AllArgsConstructor
public class ReceiveRestController {

	private LinkService lService;
	private ChatRoomService crService;
	
	
	@GetMapping(value="/chat/{crno}",produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ChatRoomVO chats(@PathVariable("crno") int crno){
		
		return null;
	}
	
	
	
	
	@GetMapping(value = "/chatlist/{name}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ChatRoomVO>> chatlist(@PathVariable("name") String e_Name){
		
		return new ResponseEntity<> (crService.getList(e_Name), HttpStatus.OK);
	}
	
	

	@GetMapping(value = "/receivename/{name}",
			produces ={MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<LinkVO>> list(@PathVariable("name") String e_Name){
		
		return new ResponseEntity<> (lService.getListName(e_Name), HttpStatus.OK);
	}

	

	@DeleteMapping(value = "/receive/{seq}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("seq") int seq) {

		log.info("remove ........................." + seq);
		
		return lService.remove(seq) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/receive/en/{seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyEnter(@RequestBody LinkVO vo, @PathVariable("seq") int seq) {

		vo.setL_Seq(seq);

		return lService.modifyEnter(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/receive/{seq}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public LinkDTO get(@PathVariable("seq") int seq) {

		LinkVO vo = lService.read(seq);
		LinkDTO dto = new LinkDTO();

		String qa01 = vo.getRequest().getR_QA_01();
		String qa_01[] = null;
		if (!qa01.equals("null")) {
			qa_01 = qa01.split("/");
			dto.setR_Q_01(qa_01[0]);
			dto.setR_A_01(qa_01[1]);
		} else {
			dto.setR_Q_01("null");
			dto.setR_A_01("null");

		}

		String qa02 = vo.getRequest().getR_QA_02();
		String qa_02[] = null;
		if (!qa02.equals("null")) {
			qa_02 = qa02.split("/");
			dto.setR_Q_02(qa_02[0]);
			dto.setR_A_02(qa_02[1]);
		} else {
			dto.setR_Q_02("null");
			dto.setR_A_02("null");
		}

		String qa03 = vo.getRequest().getR_QA_03();
		String qa_03[] = null;
		if (!qa03.equals("null")) {
			qa_03 = qa03.split("/");
			dto.setR_Q_03(qa_03[0]);
			dto.setR_A_03(qa_03[1]);
		} else {
			dto.setR_Q_03("null");
			dto.setR_A_03("null");
		}

		String qa04 = vo.getRequest().getR_QA_04();
		String qa_04[] = null;
		if (!qa04.equals("null")) {
			qa_04 = qa04.split("/");
			dto.setR_Q_04(qa_04[0]);
			dto.setR_A_04(qa_04[1]);
		} else {
			dto.setR_Q_04("null");
			dto.setR_A_04("null");
		}

		String qa05 = vo.getRequest().getR_QA_05();
		String qa_05[] = null;
		if (!qa05.equals("null")) {
			qa_05 = qa05.split("/");
			dto.setR_Q_05(qa_05[0]);
			dto.setR_A_05(qa_05[1]);
		} else {
			dto.setR_Q_05("null");
			dto.setR_A_05("null");
		}

		String qa06 = vo.getRequest().getR_QA_06();
		String qa_06[] = null;
		if (!qa06.equals("null")) {
			qa_06 = qa06.split("/");
			dto.setR_Q_06(qa_06[0]);
			dto.setR_A_06(qa_06[1]);
		} else {
			dto.setR_Q_06("null");
			dto.setR_A_06("null");
		}

		String qa07 = vo.getRequest().getR_QA_07();
		String qa_07[] = null;
		if (!qa07.equals("null")) {
			qa_07 = qa07.split("/");
			dto.setR_Q_07(qa_07[0]);
			dto.setR_A_07(qa_07[1]);
		} else {
			dto.setR_Q_07("null");
			dto.setR_A_07("null");
		}

		String qa08 = vo.getRequest().getR_QA_08();
		String qa_08[] = null;
		if (!qa08.equals("null")) {
			qa_08 = qa08.split("/");
			dto.setR_Q_08(qa_08[0]);
			dto.setR_A_08(qa_08[1]);
		} else {
			dto.setR_Q_08("null");
			dto.setR_A_08("null");
		}

		String qa09 = vo.getRequest().getR_QA_09();
		String qa_09[] = null;
		if (!qa09.equals("null")) {
			qa_09 = qa09.split("/");
			dto.setR_Q_09(qa_09[0]);
			dto.setR_A_09(qa_09[1]);
		} else {
			dto.setR_Q_09("null");
			dto.setR_A_09("null");
		}

		String qa10 = vo.getRequest().getR_QA_10();
		String qa_10[] = null;
		if (!qa10.equals("null")) {
			qa_10 = qa10.split("/");
			dto.setR_Q_10(qa_10[0]);
			dto.setR_A_10(qa_10[1]);
		} else {
			dto.setR_Q_10("null");
			dto.setR_A_10("null");
		}

		String qa11 = vo.getRequest().getR_QA_11();
		String qa_11[] = null;
		if (!qa11.equals("null")) {
			qa_11 = qa11.split("/");
			dto.setR_Q_11(qa_11[0]);
			dto.setR_A_11(qa_11[1]);
		} else {
			dto.setR_Q_11("null");
			dto.setR_A_11("null");
		}

		String qa12 = vo.getRequest().getR_QA_12();
		String qa_12[] = null;
		if (!qa12.equals("null")) {
			qa_12 = qa12.split("/");
			dto.setR_Q_12(qa_12[0]);
			dto.setR_A_12(qa_12[1]);
		} else {
			dto.setR_Q_12("null");
			dto.setR_A_12("null");
		}

		String qa13 = vo.getRequest().getR_QA_13();
		String qa_13[] = null;
		if (!qa13.equals("null")) {
			qa_13 = qa13.split("/");
			dto.setR_Q_13(qa_13[0]);
			dto.setR_A_13(qa_13[1]);
		} else {
			dto.setR_Q_13("null");
			dto.setR_A_13("null");
		}

		String qa14 = vo.getRequest().getR_QA_14();
		String qa_14[] = null;
		if (!qa14.equals("null")) {
			qa_14 = qa14.split("/");
			dto.setR_Q_14(qa_14[0]);
			dto.setR_A_14(qa_14[1]);
		} else {
			dto.setR_Q_14("null");
			dto.setR_A_14("null");
		}

		String qa15 = vo.getRequest().getR_QA_15();
		String qa_15[] = null;
		if (!qa15.equals("null")) {
			qa_15 = qa15.split("/");
			dto.setR_Q_15(qa_15[0]);
			dto.setR_A_15(qa_15[1]);
		} else {
			dto.setR_Q_15("null");
			dto.setR_A_15("null");
		}

		Date date = vo.getRequest().getR_Date();
		dto.setR_Daterecord(date);

		String pf = vo.getPart().getP_L_Word();
		dto.setP_F_Word(pf);
		String ps = vo.getPart().getP_M_Word();
		dto.setP_S_Word(ps);
		String pt = vo.getPart().getP_S_Word();
		dto.setP_T_Word(pt);

		int se = vo.getL_Seq();
		dto.setL_Seq(se);

		String name = vo.getMember().getM_Name();
		dto.setM_Name(name);
		String photo = vo.getMember().getM_Photo();
		dto.setM_Photo(photo);
		String mid = vo.getRequest().getM_Id();
		dto.setMember_Id(mid);
		String eid = vo.getE_Id();
		dto.setExpert_Id(eid);

		return dto;
	}

}

package kosta.soomgosusta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kosta.soomgosusta.domain.Criteria;
import kosta.soomgosusta.domain.MatchDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.ReviewPageDTO;
import kosta.soomgosusta.domain.ReviewVO;
import kosta.soomgosusta.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewRestController {

	private ReviewService service;

	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> regist(@RequestBody ReviewVO vo) {
		log.info("ReviewVO: " + vo);

		int insert = service.register(vo);

		return insert == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

/*	@GetMapping(value = "/pages/{e_Id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReviewVO>> getList(@PathVariable("page") int page, @PathVariable("e_Id") String e_Id) {

		Criteria cri = new Criteria(page, 5);
		log.info(cri);

		return new ResponseEntity<>(service.getList(cri, e_Id), HttpStatus.OK);
	}*/
	
	@GetMapping(value = "/pages/{e_Id}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getList(@PathVariable("page") int page, @PathVariable("e_Id") String e_Id) {

		Criteria cri = new Criteria(page, 5);
		log.info(cri);

		return new ResponseEntity<>(service.getListPage(cri, e_Id), HttpStatus.OK);
	}

	@GetMapping(value = "/{re_Seq}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ReviewVO> get(@PathVariable("re_Seq") int re_Seq) {
		log.info("get reviewVO by seq: " + re_Seq);

		return new ResponseEntity<>(service.get(re_Seq), HttpStatus.OK);
	}

	@DeleteMapping(value = "/{re_Seq}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<String> remove(@PathVariable("re_Seq") int re_Seq) {

		log.info("remove seq: " + re_Seq);

		return service.remove(re_Seq) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{re_Seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReviewVO vo, @PathVariable("re_Seq") int re_Seq) {
		vo.setRe_Seq(re_Seq);
		log.info("수정할 re_seq:" + re_Seq);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/match/{m_Id}/{e_Id}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Integer> findMatch(@PathVariable("m_Id") String m_Id, @PathVariable("e_Id") String e_Id) {
		
		log.info("match m_Id..........." + m_Id);
		log.info("match e_Id..........." + e_Id);
		Map<String, String> param = new HashMap<String, String>();
		param.put("m_Id", m_Id);
		param.put("e_Id", e_Id);
		
		return new ResponseEntity<> (service.findMatch(param),HttpStatus.OK);
	}

	@GetMapping(value = "/writer/{m_Id}", produces ={ MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<MemberVO> getMember(@PathVariable("m_Id")String m_Id)
	{

		return new ResponseEntity<>(service.getMember(m_Id), HttpStatus.OK);

	}

}

package kosta.soomgosusta.controller;

import java.security.Provider.Service;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kosta.soomgosusta.domain.ChatRoomVO;
import kosta.soomgosusta.domain.EstimateVO;
import kosta.soomgosusta.service.ChatRoomService;
import kosta.soomgosusta.service.EstimateService;
import kosta.soomgosusta.service.LinkService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/expert/*")
@Controller
@Log4j
@AllArgsConstructor
public class ReceiveController {
	
	private EstimateService eService;
	private LinkService lService;
	private ChatRoomService crService;


	 
	@GetMapping("request/received")
	public void receiveList(){
	
	}
	
	@GetMapping("request/received/{seq}")
	public String estimate(@PathVariable("seq") int seq,Model model){
	
		
		model.addAttribute("seq", seq);
		return "expert/request/estimate";
	}
	
	
	@RequestMapping(value="/register/{seq}" , method = {RequestMethod.GET, RequestMethod.POST})
	public String estimateRegister(EstimateVO estimate,ChatRoomVO chatroom,
			@RequestParam("l_Seq") int l_seq){
		
		eService.register(estimate);
		lService.modifyStatus(l_seq);
		
		EstimateVO esti = eService.read(l_seq);
		log.info(esti);
		chatroom.setE_Seq(esti.getE_Seq());
		
		crService.insert(chatroom);
		
		

		
		return "redirect:/expert/chatlist";
	}
	
	@GetMapping("/chatlist")
	public void chatList(){
		
	}
	
	
	@GetMapping("chats/{crno}")
	public String chatroomMove(@PathVariable("crno") int crno,Model model){
	
		
		model.addAttribute("crno", crno);
		return "expert/chat";
	}

}

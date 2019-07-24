package kosta.soomgosusta.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	
	@Autowired
	private MemberService service;

	@GetMapping("/register")
	public String register() {
		return "/member/register";
	}
	
	@PostMapping("/register")
	public String register(MemberVO memberVO) throws UnsupportedEncodingException{
		
		log.info("=======Member resgister========");
		log.info("memberVO: "+memberVO);
		
		service.register(memberVO);
		
		
		return "redirect:/member/login";
	}
	@GetMapping("/login")
	public String login(){
		return "/member/login";
	}
	
	@PostMapping("/login")
	public String login(LoginDTO loginDTO, Model model, HttpSession session) throws UnsupportedEncodingException{
		
		String login_Id= loginDTO.getId();
		
		MemberVO memberVO = service.findMember(login_Id);
		
		int success= service.login(loginDTO);
		
		if(success==0){
			model.addAttribute("member", memberVO);
			return "./main";
		}else if(success==1){
			System.out.println("비밀번호 ");
			model.addAttribute("loginResult","login fail");
			return "/member/login";
		}else {
			System.out.println("아이디가 존재하지 않습니다.");
			return "/member/login";
		}
			
	
		
	}
}


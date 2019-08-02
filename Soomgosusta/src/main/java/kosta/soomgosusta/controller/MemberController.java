package kosta.soomgosusta.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.MemberInfoVO;
import kosta.soomgosusta.domain.MemberMypageDTO;
import kosta.soomgosusta.domain.MemberVO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.service.MemberService;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	
	@Autowired
	private MemberService service;
	private PartService partService;
	@GetMapping("/register")
	public String register() {
		return "/member/register";
	}
	
	
	
	@GetMapping("/chatlist")
	public void chatList(){
		
	}
	
	@GetMapping("chats/{crno}")
	public String chatroomMove(@PathVariable("crno") int crno,Model model){
	
		
		model.addAttribute("crno", crno);
		return "member/chat";
	}
	
	
	@PostMapping("/register")
	public String register(MemberVO memberVO) throws UnsupportedEncodingException{
		
		log.info("=======Member resgister========");
		log.info("memberVO: "+memberVO);
		
		service.register(memberVO);
		
		
		return "redirect:/member/addInfo/"+memberVO.getM_Id();
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
			session.setAttribute("login", login_Id);
			return "/main/mainPage";
		}else if(success==1){
			System.out.println("비밀번호 ");
			model.addAttribute("loginResult","login fail");
			return "/member/login";
		}else {
			System.out.println("아이디가 존재하지 않습니다.");
			return "/member/login";
		}
			
	
		
	}
	
	@GetMapping("/addInfo/{m_Id:.+}")
	public String getMemberAddInfo(@PathVariable("m_Id") String m_Id,Model model){
		List<PartVO> partList = partService.listPartService();
		List<String> lWord = new ArrayList<>();
		for(int i=0;i<partList.size();i++){
			PartVO part = partList.get(i);
			
			if(!lWord.contains(part.getP_L_Word())){
				lWord.add(part.getP_L_Word());
			}
		}
		model.addAttribute("large", lWord);
		model.addAttribute("m_Id",m_Id);
		return "/member/addInfo";
	}
	
	@GetMapping("/mypage/{m_Id:.+}")
	public String mypage(@PathVariable("m_Id") String m_Id, Model model){
		//String m_Id = "yena@naver.com";
		MemberMypageDTO myInfo = service.getMemberMypageInfo(m_Id);
		
		int ip1 = myInfo.getM_Ip1();
		int ip2 = myInfo.getM_Ip2();
		int ip3 = myInfo.getM_Ip3();
		
		String ip01 = service.getMemberPart(ip1);
		String ip02 = service.getMemberPart(ip2);
		String ip03 = service.getMemberPart(ip3);
		
		log.info(ip01 + ip02 + ip03);
		
		model.addAttribute("myPart1", ip01);
		model.addAttribute("myPart2", ip02);
		model.addAttribute("myPart3", ip03);
		model.addAttribute("mypageInfo",service.getMemberMypageInfo(m_Id));
		return "/member/mypage";
	}
	
	
	@PostMapping(value="/mypage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void mypage(MultipartFile uploadFile, String m_Id, Model model){
		log.info("............................................");
		log.info(m_Id);
		log.info(uploadFile);
		String uploadFolder = "C:\\upload";
        String uploadFolderPath = "member";
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        log.info("upload path: " + uploadPath);
        if (uploadPath.exists() == false) {
               uploadPath.mkdirs();
        }
    	//for (MultipartFile multipartFile : uploadFile) {
            String updateFileName = uploadFile.getOriginalFilename();
            log.info(updateFileName);
            updateFileName = updateFileName.substring(updateFileName.lastIndexOf("\\") + 1);
            UUID uuid = UUID.randomUUID();
            updateFileName = uuid.toString() + "_" + updateFileName;
            // File savaFile = new File(uploadFolder, updateFileName);
            try {
               File savaFile = new File(uploadPath, updateFileName);
               uploadFile.transferTo(savaFile);
               FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_" + updateFileName));
               Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumnail, 200, 200);
               thumnail.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
            
            model.addAttribute("m_Photo", updateFileName);
            model.addAttribute("m_Id", m_Id);
            service.memberImageUpdate(m_Id, updateFileName);
    }
	
	@PutMapping("/mypage")
	public void changePW(@PathVariable("m_Id") String m_Id,@RequestParam("large1") String p_L_Word1,@RequestParam("medium1") String p_M_Word1,
			@RequestParam("small1") String p_S_Word1, @RequestParam("large2") String p_L_Word2,@RequestParam("medium2") String p_M_Word2,
			@RequestParam("small2") String p_S_Word2, @RequestParam("large3") String p_L_Word3,@RequestParam("medium3") String p_M_Word3,
			@RequestParam("small3") String p_S_Word3, MemberInfoVO memberAddInfo){
			int seq1 = service.getPSeq(p_L_Word1, p_M_Word1, p_S_Word1);
			int seq2 = service.getPSeq(p_L_Word2, p_M_Word2, p_S_Word2);
			int seq3 = service.getPSeq(p_L_Word3, p_M_Word3, p_S_Word3);
		
		memberAddInfo.setM_Id(m_Id);
		memberAddInfo.setM_Ip1(seq1);
		memberAddInfo.setM_Ip2(seq2);
		memberAddInfo.setM_Ip3(seq3);
		service.insertMemberAddInfo(memberAddInfo);
	}
}


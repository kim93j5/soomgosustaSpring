package kosta.soomgosusta.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.util.WebUtils;

import kosta.soomgosusta.domain.E_FilesVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.interceptor.SessionNames;
import kosta.soomgosusta.service.ExpertService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/expert/*")
@AllArgsConstructor
public class ExpertController {

	private ExpertService service;
	
	private boolean checkIamgeType(File file){ 
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@GetMapping("/register")
	public String register() {
		return "/expert/register";
	}

	@PostMapping("/register")
	public String register(ExpertVO expertVO) throws UnsupportedEncodingException {

		log.info("=======Member resgister========");
		log.info("expertVO: " + expertVO);

		service.register(expertVO);

		return "redirect:/expert/login";
	}

	@GetMapping("/login")
	public String login() {
		return "/expert/login";
	}

	@PostMapping("/login")
	public String login(LoginDTO loginDTO, Model model) throws UnsupportedEncodingException {

		String login_Id = loginDTO.getId();

		ExpertVO expertVO = service.findExpert(login_Id);

		int success = service.login(loginDTO);

		if (success == 0) {
			model.addAttribute("expertVO", expertVO);
			return "./main";
		} else if (success == 1) {
			model.addAttribute("loginResult", "login fail");
			System.out.println("비밀번호 ");
			return "/expert/login";
		} else {
			System.out.println("아이디가 존재하지 않습니다.");
			return "/expert/login";
		}

	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		session.removeAttribute(SessionNames.LOGIN);
		session.invalidate();

		// 쿠키제거 => rememberme 체크했을시 생성되는 loginCookie
		Cookie loginCookie = WebUtils.getCookie(request, SessionNames.LOGIN);
		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0); // 쿠키유효시간 0으로 초기화

			response.addCookie(loginCookie); // 초기화한 쿠키를 생성

		}

		return "../home";

	}

	@GetMapping("/profile")
	public void profile(HttpServletRequest request, String e_Id, Model model) {

		log.info("profile-----------");

		E_ProfileVO profile = service.getProfile(e_Id);

		ExpertVO expert = service.findExpert(e_Id);

		model.addAttribute("profile", profile);
		model.addAttribute("expert", expert);

		// return "/expert/profile";
	}

	@PostMapping(value="/profile", produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<E_FilesVO>> profile(MultipartFile[] updateFile,
			String e_Id, ExpertVO expertVO, Model model) {

		List<E_FilesVO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = "profile";
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: "+ uploadPath);
		
		if(uploadPath.exists() == false){
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : updateFile) {
			
			E_FilesVO fileVO = new E_FilesVO();
			
			String updateFileName = multipartFile.getOriginalFilename();
			updateFileName = updateFileName.substring(updateFileName.lastIndexOf("\\") + 1);
			
			UUID uuid = UUID.randomUUID();
			updateFileName = uuid.toString() + "_" + updateFileName;
			
			//File savaFile = new File(uploadFolder, updateFileName);
			

			try {
				
				File savaFile = new File(uploadPath, updateFileName);
				multipartFile.transferTo(savaFile);
				
				fileVO.setE_Uuid(uuid.toString());
				fileVO.setE_Path(uploadFolderPath);
				
				if(checkIamgeType(savaFile)){
					
					fileVO.setE_Type(true);
					fileVO.setE_From("profile");
					fileVO.setE_Id(e_Id);
					fileVO.setE_Photo(updateFileName);
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath,"s_"+ updateFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumnail,200,200);
					thumnail.close();
				}
				list.add(fileVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			Map<String, String> param = new HashMap<String, String>();
			param.put("e_Photo", updateFileName);
			param.put("e_Id", e_Id);
			service.updateEPhoto(param);

			
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}

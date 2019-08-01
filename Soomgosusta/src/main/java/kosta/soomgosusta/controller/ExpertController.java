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

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import kosta.soomgosusta.domain.AnswerVO;
import kosta.soomgosusta.domain.E_FilesVO;
import kosta.soomgosusta.domain.E_ProfileVO;
import kosta.soomgosusta.domain.ExpertFindInfo;
import kosta.soomgosusta.domain.ExpertInfoVO;
import kosta.soomgosusta.domain.ExpertVO;
import kosta.soomgosusta.domain.LoginDTO;
import kosta.soomgosusta.domain.PartVO;
import kosta.soomgosusta.interceptor.SessionNames;
import kosta.soomgosusta.service.ExpertService;
import kosta.soomgosusta.service.PartService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/expert/*")
@AllArgsConstructor
public class ExpertController {
	private PartService partService;
	private ExpertService service;

	private boolean checkIamgeType(File file) {
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
	public String register(ExpertVO expertVO, Model model) throws UnsupportedEncodingException {

		log.info("=======Member resgister========");
		log.info("expertVO: " + expertVO);

		service.register(expertVO);
		
		return "redirect:/expert/listExpertInfo/";
		//return "redirect:/expert/login";
	}

	@GetMapping("/login")
	public String login() {
		return "/expert/login";
	}

	@PostMapping("/login")
	public String login(LoginDTO loginDTO, Model model, HttpSession session) throws UnsupportedEncodingException {

		String login_Id = loginDTO.getId();

		ExpertVO expertVO = service.findExpert(login_Id);

		int success = service.login(loginDTO);

		if (success == 0) {
			model.addAttribute("expertVO", expertVO);
			session.setAttribute("login", login_Id);
			return "/expert/request/received";
		} else if (success == 1) {
			model.addAttribute("loginResult", success);
			System.out.println("비밀번호 ");
			return "/expert/login";
		} else {
			model.addAttribute("loginResult", success);
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

		return "/main/mainPage";

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

	@PostMapping(value = "/profile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<E_FilesVO>> profile(MultipartFile[] updateFile, String e_Id, ExpertVO expertVO,
			Model model) {

		List<E_FilesVO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = "profile";
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : updateFile) {

			E_FilesVO fileVO = new E_FilesVO();

			String updateFileName = multipartFile.getOriginalFilename();
			updateFileName = updateFileName.substring(updateFileName.lastIndexOf("\\") + 1);

			UUID uuid = UUID.randomUUID();
			updateFileName = uuid.toString() + "_" + updateFileName;

			// File savaFile = new File(uploadFolder, updateFileName);

			try {

				File savaFile = new File(uploadPath, updateFileName);
				multipartFile.transferTo(savaFile);

				fileVO.setEf_Uuid(uuid.toString());
				fileVO.setEf_Path(uploadFolderPath);

				if (checkIamgeType(savaFile)) {

					fileVO.setEf_Type(true);
					fileVO.setEf_From("profile");
					fileVO.setE_Id(e_Id);
					fileVO.setEf_Photo(updateFileName);
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_" + updateFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumnail, 200, 200);
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
	
	@PostMapping(value = "/profile_License", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<E_FilesVO>> licenseFile(MultipartFile[] uploadFile, String e_Id, ExpertVO expertVO,
			Model model) {

		List<E_FilesVO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = "license";
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {

			E_FilesVO fileVO = new E_FilesVO();

			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			fileVO.setEf_Photo(uploadFileName);
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			// File savaFile = new File(uploadFolder, updateFileName);

			try {

				File savaFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(savaFile);

				fileVO.setEf_Uuid(uuid.toString());
				fileVO.setEf_Path(uploadFolderPath);

				if (checkIamgeType(savaFile)) {

					fileVO.setEf_Type(true);
					fileVO.setEf_From("license");
					fileVO.setE_Id(e_Id);
					
					FileOutputStream thumnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumnail, 200, 200);
					thumnail.close();
				}
				list.add(fileVO);
			} catch (Exception e) {
				e.printStackTrace();
			}

			log.info(fileVO);
			service.uploadFile(fileVO);

		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	@GetMapping("/listExpertInfo")
	 public String listExpertInfo(Model model) {
		
		List<PartVO> listExpertInfo = partService.listPartService();
		List<String> lWord = new ArrayList<>();
        List<String> mWord = new ArrayList<>();
	    List<String> sWord = new ArrayList<>();
		    for(int i = 0; i < listExpertInfo.size(); i++){
		       
		       PartVO part = listExpertInfo.get(i);
		       if(!lWord.contains(part.getP_L_Word())){
		          lWord.add(part.getP_L_Word());
		       }
		       if(!mWord.contains(part.getP_M_Word())){
		          mWord.add(part.getP_M_Word());
		       }
		       if(!sWord.contains(part.getP_S_Word())){
		          sWord.add(part.getP_S_Word());
		       }
		    }
		    		    
		    model.addAttribute("large", lWord);
		    model.addAttribute("medium", mWord);
		    model.addAttribute("small", sWord);
			
		    
		    model.addAttribute("listQuestion", partService.listExpertQusetionService());
		    model.addAttribute("listAnswer", partService.listExpertAnswerService());
		    
		    return "expert/listExpertInfo";
		 }
	

	@PostMapping("/listExpertInfo/main")
	public String listExpertInfo(@RequestParam("q_Seq") String[] question, @RequestParam("a_Seq") int[] answer,
			@RequestParam("sido") String[] sido, @RequestParam("sigungu") String[] sigungu,
			@RequestParam("large") String p_L_Word, @RequestParam("medium") String p_M_Word,
			@RequestParam("small") String p_S_Word, ExpertInfoVO expert_Info) {

		/*
		 * for(int i = 0; i < sido.length; i++){ log.info(sido[i]); }
		 */

		log.info(p_L_Word);
		log.info(p_M_Word);
		log.info(p_S_Word);

		String ei_District = "";
		String sumDistrict = "";
		String[] district = new String[3];

		for (int i = 0; i < sido.length; i++) {
			if (!sido[i].equals("시/도 선택")) {
				district[i] = sido[i] + "/" + sigungu[i];
				sumDistrict += district[i];
				sumDistrict += ",";
			}
		}

		ei_District = sumDistrict.substring(0, sumDistrict.length() - 1);

		log.info(ei_District);

		int p_Seq = partService.listPSeqService(p_L_Word, p_M_Word, p_S_Word);
		log.info(p_Seq);

		/*
		 * for(int i = 0; i <question.length; i++){ log.info(question[i]); }
		 */

		List<AnswerVO> listAnswer = partService.listExpertAnswerService();
		String ei_Time = "";
		String ei_Start = "";
		String ei_Gender = "";

		for (int i = 0; i < listAnswer.size(); i++) {
			for (int j = 0; j < answer.length; j++) {
				if (listAnswer.get(i).getA_Seq() == answer[j]) {
					int qSeq = listAnswer.get(i).getQ_Seq();
					if (qSeq == 21) {
						ei_Time += listAnswer.get(i).getA_Contents() + "/";
					} else if (qSeq == 22) {
						ei_Start += listAnswer.get(i).getA_Contents() + "/";
					} else if (qSeq == 23) {
						ei_Gender = listAnswer.get(i).getA_Contents();
					}
				}
			}

		}

		log.info(ei_Time);
		log.info(ei_Start);
		
		ei_Time = ei_Time.substring(0, ei_Time.length() - 1);
		ei_Start = ei_Start.substring(0, ei_Start.length() - 1);

		log.info(ei_Time);
		log.info(ei_Start);
		log.info(ei_Gender);

		expert_Info.setE_Id("nano");
		expert_Info.setEi_Time(ei_Time);
		expert_Info.setEi_Start(ei_Start);
		expert_Info.setEi_District(ei_District);
		expert_Info.setP_Seq(p_Seq);
		expert_Info.setEi_Gender(ei_Gender);

		
		service.insertExpertInfo(expert_Info, p_Seq);

		return "redirect:/expert/login";
	}
	
	@GetMapping("/listExpertFind")
	public void listExpertFind(ExpertFindInfo info){
	
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFiles(String ef_Photo){
		
		File file = new File("c:\\upload\\"+ ef_Photo);
		
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		
		try{
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type",Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
		
}

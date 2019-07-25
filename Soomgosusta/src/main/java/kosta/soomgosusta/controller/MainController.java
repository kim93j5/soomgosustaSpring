package kosta.soomgosusta.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import kosta.soomgosusta.interceptor.SessionNames;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {

	@GetMapping("/mainPage")
	public void main() {

	}
	
	@GetMapping("/regist")
	public void regist(){
		
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
}

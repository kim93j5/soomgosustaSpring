package kosta.soomgosusta.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter implements SessionNames {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			session.removeAttribute(LOGIN);
		}
		return true;
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler,@Nullable ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		
		Object expertVO = modelAndView.getModelMap().get("expertVO");
		Object member = modelAndView.getModelMap().get("member");
		if(expertVO !=null){
			session.setAttribute(LOGIN, expertVO);
			
			if(StringUtils.isNotEmpty(request.getParameter("useCookie"))){
			Cookie loginCookie = new Cookie(LOGIN_COOKIE, session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(7*24*60*60);
			
			response.addCookie(loginCookie);
			}
			
			String attempted = (String)session.getAttribute(ATTEMPTED);
			
			if(StringUtils.isNoneEmpty(attempted)){
			
				response.sendRedirect(attempted);   //기존에 있던 페이지로 전송
				session.removeAttribute(ATTEMPTED);
				
			}else{
			response.sendRedirect("/expert/request/received");
			}
			
			
		}else if(member != null){
			session.setAttribute(LOGIN, member);
			
			if(StringUtils.isNotEmpty(request.getParameter("useCookie"))){
				Cookie loginCookie = new Cookie(LOGIN_COOKIE, session.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(7*24*60*60);
				
				response.addCookie(loginCookie);
				}	
				String attempted = (String)session.getAttribute(ATTEMPTED);
				if(StringUtils.isNoneEmpty(attempted)){
				
					response.sendRedirect(attempted);   //기존에 있던 페이지로 전송
					session.removeAttribute(ATTEMPTED);
					
				}else{
				response.sendRedirect("/main");
				}
			
		}
		
		
		
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}

	/**
	 * This implementation is empty.
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
	}
}

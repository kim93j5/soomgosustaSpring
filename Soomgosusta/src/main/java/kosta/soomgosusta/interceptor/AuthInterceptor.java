package kosta.soomgosusta.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;





public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionNames {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			String uri = request.getRequestURI(); //review/writer 
			String query = request.getQueryString();//?m_id=123
			if(StringUtils.isNotEmpty(query))
				uri +="?"+query;
			
			session.setAttribute(ATTEMPTED, uri);
			
			response.sendRedirect("/login");
		}
		return true;
	}

	
	
}

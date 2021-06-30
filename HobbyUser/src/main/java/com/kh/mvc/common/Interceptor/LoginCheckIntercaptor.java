package com.kh.mvc.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.mvc.member.model.vo.Member;


public class LoginCheckIntercaptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle() call ....");
		
		Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		if(loginMember == null) {
			request.setAttribute("msg", "로그인 후 이용이 가능합니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 실행된 후에 필요한 작업을 할 수 있는 메소드
		System.out.println("postHandle() call ....");
		
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		System.out.println("afterCompletion() call ....");
		
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("afterConcurrentHandlingStarted() call ....");

		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}

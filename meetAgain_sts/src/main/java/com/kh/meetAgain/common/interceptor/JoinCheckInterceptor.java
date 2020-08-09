package com.kh.meetAgain.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.meetAgain.member.model.vo.Member;
import com.kh.meetAgain.myPage.model.service.MyPageService;

/**
 * interceptor 클래스는 HandlerInterceptorAdaptor 가 가진
 * 메소드 3개를 재정의(Override)하여 구현할 수 있다.
 * 
 * 1. preHandle : 특정 컨트롤러의 메소드가 수행 되기 이전에 동작할 내용
 * 2. postHandle : 특정 컨트롤러의 메소드가 수행된 후에 동작할 내용
 *    (동작 기반:해당 코드가 이어 붙음)
 * 3. afterCompletion : 특정 컨트롤러의 메소드가 완료된 이후에 동작할 내용
 *    (결과 기반:return한 결과를 바탕으로 동작함)
 * 
 * @author user1
 *
 */
public class JoinCheckInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	  @Autowired MyPageService ms;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//String path = request.getRequestURI();
		//int idx = path.indexOf("=");
		//String gid = path.substring(idx+1);
		//System.out.println("interceptor path : "+path);
		//System.out.println("interceptor gid:"+gid);
		String gid = (String) session.getAttribute("gid");
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("itc member : "+m);
		System.out.println("itc gid : "+gid);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("userId", m.getUserId());
		map.put("gId",gid);
		
		int result = ms.checkIn(map);
		
		if(result != 1) {
			logger.info("회원이 아닌 유저가 ["+ request.getRequestURI() + "] 경로에 접근 시도함!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "해당 소모임의 회원만 접근할 수 있습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			
			return false;
		}	

		return super.preHandle(request, response, handler);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

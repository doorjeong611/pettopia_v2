package com.example.pettopia;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class SessionInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	    HttpSession session = request.getSession(false);
	    String currentUri = request.getRequestURI();

	    // 이전 URI를 가져오기 위해 세션에서 저장
	    String previousUri = (String) session.getAttribute("previousUri");

	    // 현재 URI와 이전 URI가 다르면 초기화
	    if (previousUri != null && !previousUri.equals(currentUri)) {
	        // 세션 속성 제거
	        session.removeAttribute("highlight");
	        session.removeAttribute("docWriterNo");
	        session.removeAttribute("initApproverNo");
	        session.removeAttribute("midApproverNo");
	        session.removeAttribute("finalApproverNo");
	        session.removeAttribute("approvalStatus");
	        session.removeAttribute("searchWord");
	    }

	    // 현재 URI를 세션에 저장하여 다음 요청에서 사용할 수 있도록 함
	    session.setAttribute("previousUri", currentUri);

	    return true; // 계속 진행
	}

}


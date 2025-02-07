package com.example.pettopia.handler;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.example.pettopia.util.TeamColor;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		log.debug(TeamColor.WJ + "로그인 실패: " + exception.getMessage());

		// 로그인 실패시
		request.getSession().setAttribute("Loginmsg", "아이디 혹은 비밀번호를 확인하세요.");
		response.sendRedirect("login/login");

		
	}

	
	
	
}

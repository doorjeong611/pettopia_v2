package com.example.pettopia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.example.pettopia.handler.LoginFailureHandler;
import com.example.pettopia.handler.LoginSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http
        	.csrf(csrf -> csrf.disable()); // CSRF 보호를 비활성화 (개발 환경에서 편의성을 위해 사용)

        http.authorizeHttpRequests(auth -> auth
					                // 특정 URL 경로에 대한 접근을 허용
					                .requestMatchers("/WEB-INF/view/login/**", "/assets/**", "/rest/**", "/WEB-INF/view/common/**", "/sendTempPassword").permitAll()
					                // "/admin/**" 경로는 ADMIN 역할을 가진 사용자만 접근 가능
					                .requestMatchers("/admin/**").hasRole("ADMIN")
					                // 나머지 모든 요청은 인증된 사용자만 접근 가능
					                .anyRequest().authenticated()
					                );

        http.formLogin(auth -> auth
			            .loginPage("/loginForm") // 커스텀 로그인 페이지 URL 설정
			            .usernameParameter("empNo") // 사용자 이름 파라미터명 설정
			            .passwordParameter("empPw") // 비밀번호 파라미터명 설정
			            .loginProcessingUrl("/login") // 로그인 처리 URL 설정
			            .successHandler(loginSuccessHandler()) // 로그인 성공 후 처리할 핸들러 지정
			            .failureHandler(loginFailureHandler()) // 로그인 실패 후 처리할 핸들러 지정
			            .permitAll() // 로그인 관련 URL은 모두 접근 허용
			            );
        
        http.logout(auth -> auth
                .logoutUrl("/logout") 			// 로그아웃 요청 경로 설정
                .logoutSuccessUrl("/loginForm") // 로그아웃 성공 후 이동할 페이지 설정
                .invalidateHttpSession(true) 	// 로그아웃 시 세션 무효화
                .deleteCookies("JSESSIONID") 	// 로그아웃 시 "JSESSIONID" 쿠키 삭제
                .permitAll() 					// 로그아웃 관련 URL은 모두 접근 허용
        );
        
        // 접근 거부 핸들러 설정: 권한이 없는 사용자가 접근할 때 /pettopia/errorPage로 리다이렉트
        http.exceptionHandling(auth -> auth
                    .accessDeniedHandler((request, response, accessDeniedException) -> {
                        response.sendRedirect("/pettopia/errorPage"); // 권한 거부 시 이동할 페이지 설정
                    })
        );
        
        // 'remember-me' 기능 설정: 사용자가 로그인 상태를 기억할 수 있도록 쿠키를 설정
        http.rememberMe(rememberMe -> 
	        rememberMe
	        .key("pettopiaCookie")					 // 쿠키 서명을 위한 고유 키
	        .tokenValiditySeconds(7 * 24 * 60 * 60) // 7일 동안 유지 (14일로 수정 필요 시)
	        .rememberMeParameter("remember-me") 	 // 클라이언트에서 전달하는 remember-me 파라미터 이름 설정
	    );
        
		return http.build();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(); // BCrypt 암호화 사용
	}
	
	@Bean
	public AuthenticationFailureHandler loginFailureHandler() {
		return new LoginFailureHandler(); // 로그인 실패 핸들러 설정
	}
	
	@Bean
	public LoginSuccessHandler loginSuccessHandler() {
		return new LoginSuccessHandler(); // 로그인 성공 핸들러 설정
	}
}

package com.example.pettopia.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // configuration 클래스로 등록
@EnableWebSecurity // security 설정
public class SecurityConfig { // 이 클래스에 특정한 메서드를 만들어서 등록하면 자동으로 필터에 security 설정을 custom으로 진행 가능.

	// 단방향 암호화 : 비밀번호 암호화 
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		
		return new BCryptPasswordEncoder();
	
	}
	
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return NoOpPasswordEncoder.getInstance();
//	}
	
	
	// 로그인 성공시 이동을 위한 Handler
	
	
	@Bean // Bean에 등록시 자동으로 필터에 security 설정을 custom으로 진행 가능
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		// 특정 경로 요청시 open 조건 로직 작성 부분. 상단부터 하단으로 이동하며 동작하기 때문에 순서에 유의! -> authorizeHttpRequests()로 작성하며, 람다식으로 작성해야함
		// anyRequest() : 위에서 처리하지 못한 경로, authenticated(): 로그인한 직원만 접근 가능
		http.authorizeHttpRequests((auth) -> auth
					.requestMatchers("/assets/**", "/login", "/WEB-INF/view/common/**"  ).permitAll()
					.requestMatchers("/admin").hasRole("ADMIN")
					.anyRequest().authenticated()				
				);
		
		
		
		// CSRF : 위,변조 방지 시스템 -> 현재 프로젝트에서는 구현하지 않음
		http.csrf((auth) -> auth.disable());
		
		// 로그인
		http.formLogin((auth) -> auth.loginPage("/login")
					.usernameParameter("empNo") // 기본으로 username을 사용하지만 해당 프로젝트에서는 empNo로 로그인을 진행하므로 변경해줌
					.loginProcessingUrl("/login")
					.defaultSuccessUrl("/common/petTopiaMain")
					.failureUrl("/login?error=true")
					.permitAll()
				);
		
		http.logout((auth) -> auth
				.logoutSuccessUrl("/login")
				
				);
		
		// 다중 로그인 방지
		http.sessionManagement((auth) -> auth
					.maximumSessions(1)					// 하나의 아이디에 대한 다중 로그인 허용 개수
					.maxSessionsPreventsLogin(true)		// 다중 로그인 개수를 초과하였을 경우 처리 -> true : 새로운 로그인 차단, false : 기존 로그인 삭제 후 새로운 로그인 진행
				);
		
		// 세션 고정 보호
		http.sessionManagement((auth) -> auth
					.sessionFixation().changeSessionId()	// 로그인 시 동일한 세션에 대한 id 변경 
				);
		
		
		
		
		return http.build(); // 인자로 받은 http를 builder 타입으로 반환해야함.
	}
	
	
	
	
	
	
	
	
	
	
}

package com.example.pettopia.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        http
        	.csrf(csrf -> csrf.disable());
        http.authorizeHttpRequests(auth -> auth
					                .requestMatchers("/loginForm", "/WEB-INF/view/login/**", "/assets/**", "/rest/**", "/WEB-INF/view/common/**").permitAll()
					                .requestMatchers("/admin/**").hasRole("ADMIN")
					                .anyRequest().authenticated()
					                );
        http.formLogin(auth -> auth
			            .loginPage("/loginForm")
			            .usernameParameter("empNo")
			            .passwordParameter("empPw")
			            .loginProcessingUrl("/login")
			            .defaultSuccessUrl("/common/petTopiaMain", true)
			            .permitAll()
			            );
        
        http.logout(auth -> auth
                .logoutUrl("/logout") // 로그아웃 요청 경로
                .logoutSuccessUrl("/loginForm") // 로그아웃 성공 후 리다이렉트 경로
                .invalidateHttpSession(true) // 세션 무효화
                .deleteCookies("JSESSIONID") // 쿠키 삭제
                .permitAll() // 로그아웃 요청 허용
        );
        
        // 접근 거부 핸들러 설정
        http.exceptionHandling(auth -> auth
                    .accessDeniedHandler((request, response, accessDeniedException) -> {
                        response.sendRedirect("/pettopia/errorPage"); // 권한이 없을 경우 /404.jsp로 리다이렉트
                    })
        );
        
        
		return http.build();
	}
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}

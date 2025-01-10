package com.example.pettopia.common;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordEncoderTest {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String rawPassword = "1234"; // 기존 비밀번호
        String encodedPassword = encoder.encode(rawPassword); // 비밀번호 암호화
        System.out.println("Encoded password: " + encodedPassword);
    }
}
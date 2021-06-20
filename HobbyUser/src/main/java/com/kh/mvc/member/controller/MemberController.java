package com.kh.mvc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	@GetMapping("/member/enroll")
	public String enrollView() { // 회원가입 페이지를 보여주는 메소드
		log.info("회원가입 페이지 요청");
		
		return "member/enroll";
	}
		
}

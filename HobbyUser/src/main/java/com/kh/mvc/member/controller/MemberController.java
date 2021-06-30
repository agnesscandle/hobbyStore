package com.kh.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인
	@RequestMapping(value = "/member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("memId")String memId, @RequestParam("memPassword")String memPassword) {
		
		log.info("{}, {}", memId, memPassword);
		
		Member loginMember =  service.login(memId, memPassword);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());
		
		
		return "redirect:/";
	}	
	
	// 회원가입 페이지 이동
	@GetMapping("/member/enroll")
	public String enrollView() { 
		log.info("회원가입 페이지 요청");
		
		return "member/enroll";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		System.out.println(member);
		
		int result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	//로그인 페이지 이동
	@GetMapping("/member/login")
	public String loginView() { 
		log.info("로그인 페이지 요청");
		
		return "member/login";
	}
	
	// 아이디 중복검사 
	@GetMapping("/member/memberIdChk")
	@ResponseBody
	public Map<String, Object> memberIdChk(@RequestParam("memId") String memId) {
		log.info("User ID : {}", memId);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(memId));
		
		return map;
	}
	
	// 아이디 찾기 페이지 이동
	@GetMapping("/member/memberIdSearch")
	public String idSearchView() { 
		log.info("아이디 찾기 페이지 요청");
		
		return "member/memberIdSearch";
	}
	
	// 아이디 찾기 실행
	@RequestMapping(value="/member/memberIdSearch", method = {RequestMethod.POST})
	public ModelAndView findId(ModelAndView model, @ModelAttribute Member member,
			@RequestParam("memName")String memName, @RequestParam("memEmail")String memEmail) {
		
		log.info("{}, {}", memName, memEmail);
		
		Member result = service.findByIdAndName(memName, memEmail);
		
		if(result == null) {
			model.addObject("msg", "일치하는 회원이 없습니다.");
			model.addObject("location", "/member/memberIdSearch");
		} else {
			model.addObject("msg", "아이디는 " + result.getMemId() + " 입니다.");
			model.addObject("location", "/member/login");
		}
		model.setViewName("common/msg");
		
		return model;
		
	}
	
	// 마이페이지 이동
		@GetMapping("/member/myInfo")
		public String myInfoView() { 
			log.info("회원정보 페이지 요청");
			
			return "member/myInfo";
		}
		
	// 마이페이지 이동
		@GetMapping("/member/updateMyInfo")
		public String updateMyInfoView() { 
			log.info("회원정보 수정 페이지 요청");
			
			return "member/updateMyInfo";
		}
		
	@PostMapping("/member/update")
		public ModelAndView update(ModelAndView model, 
				@ModelAttribute Member member, 
				@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
			int result = 0;
			
			if(loginMember.getMemId().equals(member.getMemId())) {
				member.setMemNo(loginMember.getMemNo());
				
				result = service.save(member);		
				
				if(result > 0) {
					model.addObject("loginMember" , service.findById(loginMember.getMemId())); 
					model.addObject("msg", "회원정보 수정을 완료했습니다.");
					model.addObject("location", "/member/updateMyInfo");
				} else {
					model.addObject("msg", "회원정보 수정에 실패했습니다.");
					model.addObject("location", "/member/updateMyInfo");
				}			
			} else {
				model.addObject("msg", "잘못된 접근입니다");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
}

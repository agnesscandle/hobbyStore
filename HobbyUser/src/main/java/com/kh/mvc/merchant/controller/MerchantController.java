package com.kh.mvc.merchant.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.merchant.model.service.MerchantMemberService;
import com.kh.mvc.merchant.model.vo.MerchantMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMerMember")
public class MerchantController {
	
	@Autowired
	private MerchantMemberService service;
	
	// 로그인
	@RequestMapping(value = "/merchantMember/merlogin", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("memId")String merId, @RequestParam("memPassword")String merPassword) {
		
		log.info("{}, {}", merId, merPassword);		

       MerchantMember loginMerchantMember =  service.login(merId, merPassword);
		
		if(loginMerchantMember != null) {
			model.addObject("loginMerMember", loginMerchantMember);
			model.setViewName("/merchantMember/merMain");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// 로그아웃
	@RequestMapping("/merlogout")
	public String merlogout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());
		
		
		return "redirect:/";
	}	
	
	// 회원가입 페이지 이동
	@GetMapping("/merchantMember/enroll")
	public String enrollView() { 
		log.info("회원가입 페이지 요청");
		
		return "/merchantMember/enroll";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/merchantMember/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute MerchantMember merchantmember) {
		System.out.println(merchantmember);
		
		int result = service.save(merchantmember);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/login");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/merchantMember/enroll");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	//로그인 페이지 이동
//	@GetMapping("/merchantMember/login")
//	public String loginView() { 
//		log.info("로그인 페이지 요청");
//		
//		return "merchantMember/login";
//	}
		
	// 상인 멤버 로그인 후 상인 메인페이지 이동
	@GetMapping("/merchantMember/merMain")
	public String loginView() { 
		log.info("상인 메인 페이지 요청");
		
		return "merchantMember/merMain";
	}
}
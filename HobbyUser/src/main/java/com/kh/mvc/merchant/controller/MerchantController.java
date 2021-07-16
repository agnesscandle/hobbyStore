package com.kh.mvc.merchant.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

import com.kh.mvc.merchant.model.service.MerchantService;
import com.kh.mvc.merchant.model.vo.MerchantMember;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMerchant")
public class MerchantController {
	
	@Autowired
	private MerchantService service;
	
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

	/*
	 * @GetMapping("/hobby/enroll") public String hobbyView() { log.info("취미관리페이지");
	 * 
	 * return "/hobby/enroll"; }
	 */

	/* 취미 등록페이지 요청 */
	@GetMapping("/merchantMember/hobbyEnroll")
	public ModelAndView enrollView(ModelAndView model, @ModelAttribute Category category) {

		List<Category> list = null;
		list = service.getCateList();

		model.addObject("list", list);
		model.setViewName("merchantMember/hobbyEnroll");

		return model;
	}

	/* 취미 등록 */
	@PostMapping("/merchantMember/hobbyEnroll")
	public ModelAndView enroll(ModelAndView model, @RequestParam("postcode") String postcode,
			@RequestParam("exactAddress") String exactAddress, MultipartHttpServletRequest mtfRequest,
			// @SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, @ModelAttribute Hobby hobby) {

		/* 다중 파일 불러오기 */
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		/* 썸네일 파일 불러오기 */
		MultipartFile thumFile = mtfRequest.getFile("input-file");

		/* 경로, 변수 설정 */
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/hobby/";
		/*
		 * String originalFileString = null; String renamedFileString = null; String
		 * thumOri = null; String thumRename = null;
		 */

		service.saveFiles(fileList, savePath, hobby);
		service.saveFile(thumFile, savePath, hobby);

		int result = 0;
		log.info("게시글 작성요청");

		if (hobby.getHbDiscountStatus() == null) {
			hobby.setHbDiscountStatus("N");
			hobby.setHbDiscountRate(null);
		}

		String location = postcode + "," + hobby.getHbLocation() + "," + exactAddress;
		hobby.setHbLocation(location);

		System.out.println(hobby);
		result = service.save(hobby);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/");
		}

		model.setViewName("common/msg");

		return model;

	}

}
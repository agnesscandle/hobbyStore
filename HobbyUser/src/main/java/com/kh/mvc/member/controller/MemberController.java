package com.kh.mvc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Hobby;
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
		
//		테스트 로그
//		log.info("{}, {}", memId, memPassword); 
		
		Member loginMember =  service.login(memId, memPassword);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/member/login");
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
	public ModelAndView enrollView(ModelAndView model, @ModelAttribute Category category) { 
		log.info("회원가입 페이지 요청");
		
		List<Category> list = null;
		list = service.getCateList();
		
		model.addObject("list", list);
		model.setViewName("member/enroll");
		
		return model;
	}
	
	// 회원가입 이용약관 페이지 이동
	@GetMapping("/member/registerPage_1")
	public String registerPage_1_view() { 
		log.info("회원가입 페이지 요청");
		
		return "member/registerPage_1";
	}
		
	// 회원가입 이용약관2 페이지 이동
	@GetMapping("/member/registerPage_2")
	public String registerPage_2_view() { 
		log.info("회원가입 페이지 요청");
		
		return "member/registerPage_2";
	}
			
	// 회원가입 이용약관2 페이지 이동
	@GetMapping("/member/registerPage_3")
	public String registerPage_3_view() { 
		log.info("회원가입 페이지 요청");
		
		return "member/registerPage_3";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		System.out.println(member);
		
		int result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/login");
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
	
	// 이메일 중복검사 
	@GetMapping("/member/memberEmailChk")
	@ResponseBody
		public Map<String, Object> memberEmailChk(@RequestParam("memEmail") String memEmail) {
			log.info("User Email : {}", memEmail);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("result", service.result(memEmail));
			
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
		
//		테스트 로그
//		log.info("{}, {}", memName, memEmail);
		
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
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/member/memberPwSearch")
	public String pwSearchView() { 
		log.info("비밀번호 찾기 페이지 요청");
		
		return "member/memberPwSearch";
	}
	
	// 마이페이지 이동
    @GetMapping("/member/myInfo")
    public ModelAndView myInfoView(ModelAndView model, 
          @SessionAttribute(name = "loginMember", required = false) Member loginMember,
          @RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
       log.info("회원정보 페이지 요청");
       
       List<Liked> likedList = null;
       List<Reserve> rsList = null;
       List<Hobby> hobbyList = null;
       List<Hobby> hobbyList_ = null;
       
       PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 4);
       
       int memNo = 0;
       memNo = loginMember.getMemNo();
       
       likedList = service.getLikedList();
       rsList = service.getRsList();
       hobbyList = service.getHobbyRsList(memNo, pageInfo);
       hobbyList_ = service.getHobbyLikedList(memNo, pageInfo);
       
       model.addObject("likedList", likedList);
       model.addObject("rsList", rsList);
       model.addObject("hobbyList", hobbyList);
       model.addObject("hobbyList_", hobbyList_);
       model.addObject("pageInfo", pageInfo);
       
       model.setViewName("/member/myInfo");
       
		System.out.println("예약취미 : " + hobbyList);
		System.out.println("좋아요취미: " + hobbyList_);
		// System.out.println(rsList);
		// System.out.println(likedList);
		
       return model;
    }
		
	// 좋아요관리 페이지 이동
		@GetMapping("/member/likedHobby")
		public ModelAndView likedHobbyView(ModelAndView model, 
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
			
			log.info("좋아요관리 페이지 요청");
			
			List<Liked> likedList = null;
			List<Hobby> hobbyList = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
			int memNo = 0;
			memNo = loginMember.getMemNo();
			
			likedList = service.getLikedList();
			hobbyList = service.getHobbyLikedList(memNo, pageInfo);
			
			model.addObject("likedList", likedList);
			model.addObject("hobbyList", hobbyList);
			model.addObject("pageInfo", pageInfo);
			
			
			model.setViewName("/member/likedHobby");
			
			return model;
		}
		
	// 예약관리 페이지 이동
		@GetMapping("/member/reservedHobby")
		public ModelAndView reservedHobbyView(ModelAndView model, 
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
			
			log.info("예약관리 페이지 요청");
			
			List<Reserve> rsList = null;
			List<Hobby> hobbyList = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
			
			int memNo = 0;
			memNo = loginMember.getMemNo();
			
			rsList = service.getRsList();
			hobbyList = service.getHobbyRsList(memNo, pageInfo);
			
			model.addObject("likedList", rsList);
			model.addObject("hobbyList", hobbyList);
			model.addObject("pageInfo", pageInfo);
			
			
			model.setViewName("/member/reservedHobby");
			
			return model;
		}
	
		
	// 마이페이지 수정페이지 이동
		@GetMapping("/member/updateMyInfo")
		public String updateMyInfoView() { 
			log.info("회원정보 수정 페이지 요청");
			
			return "member/updateMyInfo";
		}
	
	// 회원정보 수정
		@PostMapping("/member/update")
		public ModelAndView update(ModelAndView model, HttpServletRequest request,
				@ModelAttribute Member member, @RequestParam("upfile") MultipartFile upfile,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
			
			int result = 0;
			
			log.info("프로필 수정 작성 요청");
			System.out.println(upfile.getOriginalFilename());
			System.out.println(upfile.isEmpty());
			
			
			if(loginMember.getMemId().equals(member.getMemId())) {
				member.setMemNo(loginMember.getMemNo());
				
				if(upfile != null && !upfile.isEmpty()) {
					
					String rootPath = request.getSession().getServletContext().getRealPath("resources");
					String savePath = rootPath + "/upload/profile";
					String renameFileName = service.saveFile(upfile, savePath);
					
					System.out.println(renameFileName);
					
					if(renameFileName != null) {
						member.setMemImgOriginal(upfile.getOriginalFilename());
						member.setMemImgRename(renameFileName); // board 객체에 반환된 renameFileName set 해줌
					}
				}
				
				
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
	
	// 비밀번호 변경 페이지 이동
		@GetMapping("/member/changePw")
		public String changePwView() { 
			log.info("회원정보 수정 페이지 요청");
			
			return "member/changePw";
		}
			
	// 현재 비밀번호 확인 처리 요청
		@PostMapping("/member/changePw")
		public ModelAndView changePw(ModelAndView model,
				@RequestParam("memId")String memId, @RequestParam("memPassword")String memPassword) {
			
			log.info("{}, {}", memId, memPassword);
			
			Member loginMember = service.checkpw(memId, memPassword);
			
			if(loginMember != null) {
				model.setViewName("/member/changePw2");
			} else {
				model.addObject("msg", "패스워드가 일치하지 않습니다.");
				model.addObject("location", "/member/changePw");
				model.setViewName("common/msg");
			}
			
			return model;
		}
		
	// 새로운 비밀번호 변경 처리
		@PostMapping("/member/changePw2")
		public ModelAndView changePw2(ModelAndView model, SessionStatus status,
				@ModelAttribute Member member,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
			
			int result = 0;
			
			if(loginMember.getMemId().equals(member.getMemId())) {
				member.setMemNo(loginMember.getMemNo());
				
				result = service.changePw(member);
			if(result > 0) {
				model.addObject("loginMember" , service.findById(loginMember.getMemId()));
				model.addObject("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
				status.setComplete();
				model.addObject("location", "/member/login");
			} else {
				model.addObject("msg", "비밀번호 변경을 실패하였습니다.");
				model.addObject("location", "/member/changePw2");
			} 
			}else {
				model.addObject("msg", "잘못된 접근입니다");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
			
		}
	
		
	// 회원탈퇴 약관동의 페이지 이동
		@GetMapping("/member/deleteAgree")
		public String deleteAgreeView() { 
			log.info("회원탈퇴 약관동의 페이지 요청");
			
			return "member/deleteAgree";
		}
		
	// 회원 약관동의 후 탈퇴 페이지 이동
		@GetMapping("/member/delete")
		public String delete() { 
			log.info("회원탈퇴 페이지 요청");
			
			return "member/delete";
		}
	
	// 탈퇴처리
		@PostMapping("/member/delete")
		public ModelAndView delete(ModelAndView model,
				@RequestParam("memId")String memId, @RequestParam("memPassword")String memPassword,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
			
			Member chkMember = service.checkpw(memId, memPassword);

			int result = service.delete(loginMember.getMemNo());
			
			if(chkMember != null && result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/logout");
			} else {
				model.addObject("msg", "회원탈퇴에 실패했습니다.");
				model.addObject("location", "/member/delete");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 비밀번호 찾기 실행 전 아이디 확인
		@RequestMapping(value="/member/memberPwSearch", method = {RequestMethod.POST})
		public ModelAndView memberPwSearch(ModelAndView model, 
				@RequestParam("memId")String memId) {
			
			// 테스트 로그
			log.info("회원 아이디 : " + memId);
			
			Member loginMember = service.findById(memId);
			
			if(loginMember != null) {
				model.setViewName("/member/memberPwSearch2");
			} else {
				model.addObject("msg", "일치하는 회원이 없습니다.");
				model.addObject("location", "/member/memberPwSearch");
				model.setViewName("common/msg");
			}
			
			return model;
			
		}
		
		// 비번찾기 핸드폰 번호 입력 페이지 이동
			@PostMapping("/member/memberPwSearch2")
			public String memberPwSearch2_view() { 
				log.info("비밀번호 찾기 핸드폰 번호 인증 페이지 요청");
				
				return "member/memberPwSearch2";
			}
		
			
		// 비번찾기 핸드폰 번호 인증 
			@PostMapping("/member/checkSMS")
			@ResponseBody
			public String checkSMS(@RequestParam("phoneNumber")String memPhone) {

		        Random rand  = new Random();
		        String numStr = "";
		        for(int i=0; i<6; i++) {
		            String ran = Integer.toString(rand.nextInt(10));
		            numStr+=ran;
		        }

		        System.out.println("수신자 번호 : " + memPhone);
		        System.out.println("인증번호 : " + numStr);
//		        service.certifiedPhoneNumber(memPhone,numStr);
		        return numStr;
		    }

		// 임시번호 휴대폰 발송 
			@PostMapping("/member/sendNewPw")
			@ResponseBody
			public String sendNewPw(@RequestParam("phoneNumber")String memPhone) {
			
				Random rand  = new Random();
		        String numStr = "";
		        for(int i=0; i<8; i++) {
		            String ran = Integer.toString(rand.nextInt(10));
		            numStr+=ran;
		        }
		        
		        System.out.println("수신자 번호 : " + memPhone);
		        System.out.println("임시비밀번호 : " + numStr);
//		        service.sendNewPwNumber(memPhone,numStr);
		        service.setNewPw(memPhone, numStr);
		        return numStr;
			}
			
			

}	



			


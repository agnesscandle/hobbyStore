package com.kh.mvc.merchant.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Calculation;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Reserve;

import com.kh.mvc.hobby.model.vo.Review;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.merchant.model.service.MerchantService;
import com.kh.mvc.merchant.model.vo.Merchant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/merchant")
@SessionAttributes("loginMerchant")
public class MerchantController {
	
	
	@Autowired
	private MerchantService service;
	
	// 로그인
	@RequestMapping(value = "/merlogin", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("memId")String merId, @RequestParam("memPassword")String merPassword
			, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		log.info("{}, {}", merId, merPassword);		

       Merchant loginMerchantMember =  service.login(merId, merPassword);
		
		if(loginMerchantMember != null) {
			model.addObject("loginMerchant", loginMerchantMember);
			/* model.addObject("location", "/hobby/list"); */
//			model.setViewName("merchantMember/merMain");
			List<Hobby> list = null;

			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
			list = service.getHobbyList(pageInfo, loginMerchantMember.getMerNo());


			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("merchant/list");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	
	/* 취미 목록페이지 요청 */
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value="merNo") int merNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
          System.out.println("리스트호출");
		List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
		list = service.getHobbyList(pageInfo, merNo);
		System.out.println(list+"맵퍼 확인");
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/list");

		return model;
	}	
	
	
	// 로그아웃
	@RequestMapping("/merlogout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());
		
		
		return "redirect:/";
	}	
	
	// 회원가입 페이지 이동
	@GetMapping("/enroll")
	public ModelAndView merenrollView(ModelAndView model, @ModelAttribute Category category) { 
		log.info("회원가입 페이지 요청");
		
		List<Category> list = null;
		list = service.getCateList();
		
		model.addObject("list", list);
		model.setViewName("merchant/enroll");
		return model;
	}
	
	// 회원가입 이용약관 페이지 이동
	@GetMapping("/registerPage_1")
	public String registerPage_1_view() { 
		log.info("회원가입 페이지 요청");
		
		return "merchant/registerPage_1";
	}
			
	// 회원가입 이용약관2 페이지 이동
	@GetMapping("/registerPage_2")
	public String registerPage_2_view() { 
		log.info("회원가입 페이지 요청");
		
		return "merchant/registerPage_2";
	}
				
	// 회원가입 이용약관3 페이지 이동
	@GetMapping("/registerPage_3")
	public String registerPage_3_view() { 
		log.info("회원가입 페이지 요청");
		
		return "merchant/registerPage_3";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Merchant merchantmember,
			HttpServletRequest request, MultipartHttpServletRequest mtfRequest) {
		
		
		/* 썸네일 파일 불러오기 */
		MultipartFile thumFile = mtfRequest.getFile("input-file");
		
		System.out.println(merchantmember);
		System.out.println(thumFile.getOriginalFilename());
		System.out.println(thumFile.isEmpty());
		
		
		if(!thumFile.isEmpty()) {
			
			/* 경로, 변수 설정 */
			String src = mtfRequest.getParameter("src");
			System.out.println("src value : " + src);
			String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/profile/";
			String thumRename = service.saveMerFile(thumFile, savePath);
			
			if(thumRename != null) {
				merchantmember.setMerImgOriginal(thumFile.getOriginalFilename());
				merchantmember.setMerImgRename(thumRename);
			}
		}
		
		int result = 0;
		
		result = service.save(merchantmember);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/login");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/merchant/enroll");
		}
			
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	// 아이디 중복검사 
		@GetMapping("/idChk")
		@ResponseBody
		public Map<String, Object> merchantIdChk(@RequestParam("merId") String merId) {
			log.info("User ID : {}", merId);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("validate", service.validate(merId));
			
			return map;
		}
		
		
		// 핸드폰번호 중복검사 
			@GetMapping("/dupPhoneNum")
			@ResponseBody
			public Map<String, Object> dupPhoneNum(@RequestParam("merPhone") String merPhone) {
				log.info("User Phone : {}", merPhone);
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("res", service.res(merPhone));
				
				return map;
			}
				
		// 이메일 중복검사 
		@GetMapping("/emailChk")
		@ResponseBody
			public Map<String, Object> merchantEmailChk(@RequestParam("merEmail") String merEmail) {
				log.info("User Email : {}", merEmail);
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("result", service.result(merEmail));
				
				return map;
			}
		
		// 계좌 중복검사 
		@GetMapping("/dupBankNum")
		@ResponseBody
			public Map<String, Object> dupBankNum(@RequestParam("bankNumber") String bankNumber) {
				log.info("User BankNum : {}", bankNumber);
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("rs", service.rs(bankNumber));
				
				return map;
			}
		
		// 닉네임 중복검사 
		@GetMapping("/dupNickName")
		@ResponseBody
			public Map<String, Object> dupNickName(@RequestParam("merNick") String merNick) {
				log.info("NickName : {}", merNick);
				
				Map<String, Object> map = new HashMap<>();
				
				map.put("nickVal", service.nickVal(merNick));
				
				return map;
			}


		// 아이디 찾기 실행
		@RequestMapping(value="/idSearch", method = {RequestMethod.POST})
		public ModelAndView findId(ModelAndView model, @ModelAttribute Merchant merchantmember,
				@RequestParam("memName")String merName, @RequestParam("memEmail")String merEmail) {
			
			// 테스트 로그
			log.info("{}, {}", merName, merEmail);
			
			Merchant result = service.findByIdAndName(merName, merEmail);
			
			if(result == null) {
				model.addObject("msg", "일치하는 회원이 없습니다.");
				model.addObject("location", "/member/memberIdSearch");
			} else {
				model.addObject("msg", "아이디는 " + result.getMerId() + " 입니다.");
				model.addObject("location", "/member/login");
			}
			model.setViewName("common/msg");
			
			return model;
			
		}
		
	   // 프로필 수정 이동
		@GetMapping("/updateMyInfo")
		public String updateMyInfoView() { 
			log.info("프로필수정 페이지 요청");
			
			return "merchant/updateMyInfo";
		}	
		
		
		// 프로필 수정 
		@PostMapping("/updateMyInfo")
		public ModelAndView update(ModelAndView model, HttpServletRequest request,
				@ModelAttribute Merchant merchantmember, MultipartHttpServletRequest mtfRequest,
				@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant) {
			
			log.info("프로필 수정 작성 요청");
			int result = 0;
			
			MultipartFile thumFile = mtfRequest.getFile("input-file");
			
			System.out.println(merchantmember);
			System.out.println(thumFile.getOriginalFilename());
			System.out.println(thumFile.isEmpty());
			
			
			if(loginMerchant.getMerId().equals(merchantmember.getMerId())) {
				merchantmember.setMerNo(loginMerchant.getMerNo());
				
				if(thumFile != null && !thumFile.isEmpty()) {
					
					String rootPath = request.getSession().getServletContext().getRealPath("resources");
					String savePath = rootPath + "/upload/profile/";
					
					if(merchantmember.getMerImgRename() != null) {
						service.deleteFile(savePath + "/" + merchantmember.getMerImgRename());
					}
					
					String thumRename = service.saveMerFile(thumFile, savePath);
					
					System.out.println(thumRename);
					System.out.println(savePath);
					if(thumRename != null) {
						merchantmember.setMerImgOriginal(thumFile.getOriginalFilename());
						merchantmember.setMerImgRename(thumRename); 
					}
				}
				
				result = service.save(merchantmember);		
				
				if(result > 0) {
					model.addObject("loginMerchant" , service.findById(loginMerchant.getMerId())); 
					model.addObject("msg", "회원정보 수정을 완료했습니다.");
					model.addObject("location", "/merchant/updateMyInfo");
				} else {
					model.addObject("msg", "회원정보 수정에 실패했습니다.");
					model.addObject("location", "/merchant/updateMyInfo");
				}			
			} else {
				model.addObject("msg", "잘못된 접근입니다");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 비밀번호 변경 페이지 이동
		@GetMapping("/changePw")
		public String changePwView() { 
			log.info("상인정보 수정 페이지 요청");
			
			return "merchant/changePw";
		}
		
		
		// 현재 비밀번호 확인 처리 요청
		@PostMapping("/changePw")
		public ModelAndView changePw(ModelAndView model,
				@RequestParam("merId")String merId, @RequestParam("merPassword")String merPassword) {
			
			log.info("{}, {}", merId, merPassword);
			
			Merchant loginMerchant = service.checkpw(merId, merPassword);
			
			if(loginMerchant != null) {
				model.setViewName("/merchant/changePw2");
			} else {
				model.addObject("msg", "패스워드가 일치하지 않습니다.");
				model.addObject("location", "/merchant/changePw");
				model.setViewName("common/msg");
			}
			
			return model;
		}
		
		
		// 새로운 비밀번호 변경 처리
		@PostMapping("/changePw2")
		public ModelAndView changePw2(ModelAndView model, SessionStatus status,
				@ModelAttribute Merchant merchantmember,
				@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant) {
			
			int result = 0;
			
			if(loginMerchant.getMerId().equals(merchantmember.getMerId())) {
				merchantmember.setMerNo(loginMerchant.getMerNo());
				
				result = service.changePw(merchantmember);
			if(result > 0) {
				model.addObject("loginMerchant" , service.findById(loginMerchant.getMerId()));
				model.addObject("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
				status.setComplete();
				model.addObject("location", "/member/login");
			} else {
				model.addObject("msg", "비밀번호 변경을 실패하였습니다.");
				model.addObject("location", "/merchant/changePw2");
			} 
			}else {
				model.addObject("msg", "잘못된 접근입니다");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
			
		}
			
		// 회원탈퇴 약관동의 페이지 이동
		@GetMapping("/deleteAgree")
		public String deleteAgreeView() { 
			log.info("상인탈퇴 약관동의 페이지 요청");
			
			return "merchant/deleteAgree";
			}	
	
		// 회원 약관동의 후 탈퇴 페이지 이동
		@GetMapping("/delete")
		public String delete() { 
			log.info("상인탈퇴 페이지 요청");
			
			return "merchant/delete";
		}
	
		// 탈퇴처리
		@PostMapping("/delete")
		public ModelAndView delete(ModelAndView model,
				@RequestParam("merId")String merId, @RequestParam("merPassword")String merPassword,
				@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant) {
			
			Merchant chkMember = service.checkpw(merId, merPassword);

			int result = service.delete(loginMerchant.getMerNo());
			
			if(chkMember != null && result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/merchant/merlogout");
			} else {
				model.addObject("msg", "회원탈퇴에 실패했습니다.");
				model.addObject("location", "/member/delete");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 비밀번호 찾기 실행 전 아이디 확인
		@RequestMapping(value="/findPw", method = {RequestMethod.POST})
		public ModelAndView memberPwSearch(ModelAndView model, 
				@RequestParam("memId")String merId) {
			
			// 테스트 로그
			log.info("회원 아이디 : " + merId);
			
			Merchant loginMerchant = service.findById(merId);
			
			if(loginMerchant != null) {
				model.setViewName("/merchant/memberPwSearch2");
			} else {
				model.addObject("msg", "일치하는 회원이 없습니다.");
				model.addObject("location", "/member/memberPwSearch");
				model.setViewName("common/msg");
			}
			
			return model;
			
		}
		
		
		
		// 비번찾기 핸드폰 번호 인증 
		@PostMapping("/checkSMS")
		@ResponseBody
		public String checkSMS(@RequestParam("phoneNumber")String merPhone) {

	        Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<6; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }

	        System.out.println("수신자 번호 : " + merPhone);
	        System.out.println("인증번호 : " + numStr);
//				        service.certifiedPhoneNumber(memPhone,numStr);
	        return numStr;
	    }
		
		// 임시번호 휴대폰 발송 
		@PostMapping("/sendNewPw")
		@ResponseBody
		public String sendNewPw(@RequestParam("phoneNumber")String merPhone) {
		
			Random rand  = new Random();
	        String numStr = "";
	        for(int i=0; i<8; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }
	        
	        System.out.println("수신자 번호 : " + merPhone);
	        System.out.println("임시비밀번호 : " + numStr);
//				        service.sendNewPwNumber(memPhone,numStr);
	        service.setNewPw(merPhone, numStr);
	        return numStr;
		}
		
	/*
	 * @GetMapping("/hobby/enroll") public String hobbyView() { log.info("취미관리페이지");
	 * 
	 * return "/hobby/enroll"; }
	 */

	/* 취미 등록페이지 요청 */
	@GetMapping("/hobbyEnroll")
	public ModelAndView enrollView(ModelAndView model, @ModelAttribute Category category,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant) {

		List<Category> list = null;
		list = service.getCateList();

		model.addObject("list", list);
		model.setViewName("merchant/hobbyEnroll");

		return model;
	}

	/* 취미 등록 */
	@PostMapping("/hobbyEnroll")
	public ModelAndView enroll(ModelAndView model, @RequestParam("postcode") String postcode,
			@RequestParam("exactAddress") String exactAddress, MultipartHttpServletRequest mtfRequest,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			HttpServletRequest request, @ModelAttribute Hobby hobby) {
		
		List<String> setFile = null;
		
		
		/* 다중 파일 불러오기 */
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		/* 썸네일 파일 불러오기 */
		MultipartFile thumFile = mtfRequest.getFile("input-file");

		/* 상세페이지 이미지 파일 불러오기 */
		MultipartFile detailFile = mtfRequest.getFile("input-file-detail");

		
		/* 경로, 변수 설정 */
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);
		String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/hobby/";
		
		if(!fileList.get(0).isEmpty()) {
			/*
			 * String originalFileString = null; String renamedFileString = null; String
			 * thumOri = null; String thumRename = null;
			 */
			service.saveFiles(fileList, savePath, hobby);
		
		}
		if(!thumFile.isEmpty()) {
			setFile = service.saveFile(thumFile, savePath, hobby);
			hobby.setHbThumOri(setFile.get(0));
			hobby.setHbThumRename(setFile.get(1));

		}
		
		if(!detailFile.isEmpty()) {
			setFile = service.saveFile(detailFile, savePath, hobby);
			hobby.setHbDetailOri(setFile.get(0));
			hobby.setHbDetailRename(setFile.get(1));
		}
		
		
		
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
		
		int merNo= loginMerchant.getMerNo();
		
		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/merchant/list?merNo="+merNo);
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/merchant/list?merNo="+merNo);
		}

		model.setViewName("common/msg");

		return model;

	}
	
	
	@GetMapping("/calculatelist")
	public ModelAndView calculatelist(ModelAndView model,
			@RequestParam(value="merNo") int merNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
          System.out.println("리스트호출");
  		
          
        List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCountByMerNo(merNo), 8);
		list = service.getHobbycalList(pageInfo, merNo);
		
		
		
		System.out.println(list+"callist 확인");
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("calculation/calculationlist");

		return model;

	}
	
	@RequestMapping(value="/calculateview",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calculateview(ModelAndView model,
			@RequestParam(value="hbNo") int hbNo,
			@RequestParam(value="page", required = false, defaultValue = "1")int page) {
          System.out.println("리스트호출");
  		
          
        List<Reserve> list = null;
        PageInfo pageInfo = new PageInfo(page, 10, service.getReserveCount(hbNo), 8);
        
        
		list = service.getReserveList(pageInfo,hbNo);
		System.out.println(list+"뷰확인");
		model.addObject("list", list);
		model.addObject("hbNo",hbNo);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("calculation/calculationview");

		return model;

	}
	
	@GetMapping("/calculateWait")
	public ModelAndView calculateHistory(ModelAndView model,
			@RequestParam("merNo")int merNo,
			@RequestParam(value="page", required = false, defaultValue = "1")int page)
	{
		//Calculation가져오기
		List<Reserve> list = null;
        PageInfo pageInfo = new PageInfo(page, 10, service.getCalculationWaitCount(merNo), 8);
		
		list = service.getCalculateList(merNo);
		
		System.out.println(list+"웨잇확인");
		model.addObject("list", list);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("calculation/calculationWait");
		return model;
	}
	
	
	@GetMapping("/calculateFinish")
	public ModelAndView calculateFinish(ModelAndView model,
			@RequestParam("merNo")int merNo,
			@RequestParam(value="page", required = false, defaultValue = "1")int page)
	{
		//Calculation가져오기
		List<Calculation> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getCalFinishCount(merNo), 8);
		
		System.out.println(merNo);
		list = service.getCalFinishList(merNo);
		System.out.println(list+"웨잇확인");
		model.addObject("list", list);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("calculation/calculationFinish");
		return model;
	}

	
	/*
	@PostMapping("calculateapply")
	public ModelAndView calculateApply(ModelAndView model,
			@RequestParam("resNo")int resNo,
			@RequestParam("merNo")int merNo) {
		System.out.println(resNo + "                " + merNo);
		int result = service.calculateApply(resNo, merNo);
		System.out.println(result);
		/*
		if (result > 0) {
			model.addObject("location", "merchantMember/calculateview");
			model.setViewName("calculation/calculationview");
			
		} else {
			model.addObject("msg", "정산 요청을 실패하였습니다.");
			model.addObject("location", "/");
		}

		
		return model;
	}*/
	
	@PostMapping("/calculateapply")
	public String calculateApply(ModelAndView model,
			@ModelAttribute Reserve reserve,
			HttpServletRequest request) {
		System.out.println("apply 실행");
		int result = service.calculateApply(reserve);

		System.out.println(result+ " 칼큘 인서트 결과 !! ");
		
		if(result >0)
		{
			System.out.println("리절브 실행");
			service.reserveUpdateStatus(reserve);
		}
		String url = "forward:/merchant/calculateview?hbNo="+reserve.getHbNo();
		
		return url;
	}	
	
	//qna관리할 취미리스트페이지로 요청
	@GetMapping("/merQnaList")
	public ModelAndView qnaList(ModelAndView model,
			@RequestParam(value="merNo") int merNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
          System.out.println("리스트호출");
  		
          
        List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
		list = service.getHobbycalList(pageInfo, merNo);
		
		
		
		System.out.println(list+"맵퍼 확인");
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/merQnaList");


		return model;

	}
	
	//qna리스트페이지로이동
	@GetMapping("/merQnaView")
	public ModelAndView merQnaView(ModelAndView model,
			@RequestParam(value="hbNo") int hbNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		Hobby hobby = service.findByNo(hbNo);

		 //Qna리스트 불러오기
	    List<Qna> qnaList = null;

	    PageInfo pageInfo = new PageInfo(page, 10, service.getQnaCount(hbNo), 10);
	    int listCount = pageInfo.getListCount();
	    qnaList = service.getQnaList(pageInfo, hbNo);

	    //리플리스트 불러오기
	    List<Reply> replyList = null;
	    for (int i = 0; i < qnaList.size(); i++) {
	       int qnaNo = qnaList.get(i).getQnaNo();

	       replyList = service.getReplyList(qnaNo);
	       
	       qnaList.get(i).setReply(replyList);
	       System.out.println(qnaList);
	    }
	    model.addObject("hobby", hobby);
	    model.addObject("qnaList", qnaList);
	    model.addObject("pageInfo", pageInfo);
	    model.addObject("listCount", listCount);
	    model.setViewName("merchant/merQnaView");

	    return model;

	}
	
	//reply등록하기
	@PostMapping("/merQnaView")
    public ModelAndView qnaReply(ModelAndView model,
          HttpServletRequest request, 
          @SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
          @ModelAttribute Qna qna, @ModelAttribute Reply reply, @RequestParam("hbNo") int hbNo) {
	   log.info("댓글 작성 요청");
	   System.out.println(reply);
	   

	
	 
       int result = service.saveReply(reply);
       
       if(result > 0) {
          model.addObject("msg", "댓글이 정상적으로 등록되었습니다.");
          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
       } else {
          model.addObject("msg", "댓글 등록을 실패하였습니다.");
          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
       }
	   
       model.setViewName("common/msg");
       return model;
    }
	//reply수정하기
	 @PostMapping("/replyUpdate")
	 public ModelAndView replyUpdate(ModelAndView model, 
	          @SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
	       HttpServletRequest request,
	       @ModelAttribute Qna qna,  @RequestParam("hbNo") int hbNo, @ModelAttribute Reply reply) {
		 int result = 0;
		    
		    result = service.saveReply(reply);
		   System.out.println(hbNo);
		    
		   if(result > 0) {
		          model.addObject("msg", "댓글이 정상적으로 등록되었습니다.");
		          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
		       } else {
		          model.addObject("msg", "댓글 등록을 실패하였습니다.");
		          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
		       }
		    
		    model.setViewName("common/msg");
		    return model;
	 }
//reply삭제하기
	 
	 @GetMapping("/replyDelete")
	 public ModelAndView replyDelete(ModelAndView model,
	          @SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
		       HttpServletRequest request,
		       @ModelAttribute Qna qna, @RequestParam("hbNo") int hbNo, @ModelAttribute Reply reply) {
		 
		 	int result =0;
		    
		    result = service.deleteReply(reply);
		    
		    System.out.println(reply);
			   if(result > 0) {
			          model.addObject("msg", "댓글이 정상적으로 삭제되었습니다.");
			          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
			       } else {
			          model.addObject("msg", "댓글 삭제에 실패하였습니다.");
			          model.addObject("location", "/merchant/merQnaView?hbNo=" + hbNo);
			       }
		    model.setViewName("common/msg");
		 return model;
	 }
	 
		//출석관리할 취미리스트 페이지 접근
		@GetMapping("/attendanceList")
		public ModelAndView attendanceList(ModelAndView model,
				@RequestParam(value="merNo") int merNo,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
	  		
	          
	        List<Hobby> list = null;

			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
			list = service.getHobbycalList(pageInfo, merNo);
			
			
			
			System.out.println(list+"맵퍼 확인");
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("merchant/attendanceList");

			return model;
		}
		
		//출석관리리스트페이지로이동
		@GetMapping("/attendanceView")
		public ModelAndView attendanceView(ModelAndView model,
				@RequestParam(value="hbNo") int hbNo) {
			
			Hobby hobby = service.findByNo(hbNo);

			model.addObject("hbNo",hbNo);
			model.addObject("hobby",hobby);
		    model.setViewName("merchant/attendanceView");

		    return model;

		}
		//출석관리멤버
				@PostMapping("/attendanceMem")
				public ModelAndView attendanceMem(ModelAndView model,
						@RequestParam(value="hbNo") int hbNo, 
						@RequestParam(value="takeDate")  String takeDate) {
						System.out.println(hbNo);
						
						takeDate = takeDate.substring(2); 
						System.out.println(takeDate);
					List<Reserve> list = null;
					
					list = service.getReserveListByTakeDate(hbNo,takeDate);
					Hobby hobby = service.findByNo(hbNo);
					System.out.println(list);
					
					model.addObject("hobby",hobby);
					model.addObject("list", list);
					model.addObject("hbNo",hbNo);
				    model.setViewName("merchant/attendanceMem");

				    return model;

				}
		//출결 상태 변경
				@ResponseBody
				@GetMapping("/changeResAttend")
				public Map<String, String> changeResAttend(ModelAndView model,
						@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
						@RequestParam("hbNo") int hbNo,
						@RequestParam("resNo") int resNo,
						@ModelAttribute Reserve reserve){
					
					log.info("예약 상태 변경 요청");
					
					System.out.println("hbNo : " + hbNo);
					System.out.println("resNo : " + resNo);
					
					int result = 0;
					String history = null;
					Map<String, String>map = new HashMap<>();

					log.info("예약 상태 확인 요청");
					history = service.selectResAttendByNo(hbNo, resNo);
					System.out.println("history : " + history);

					if( history.equals("N")) {
						log.info("출석확인으로 update");
						result = service.resAttendY(hbNo, resNo);
						map.put("history", "Y");
					} 
					
					if( history.equals("Y")) {
						log.info("미출석으로 update");
						result = service.resAttendN(hbNo, resNo);
						map.put("history", "N");
					} 
					
					return map;
				}
				
		
		

	/* 예약 관리 - 상인이 개설한 취미 목록 가져오기 (지영) */
	@GetMapping("/resHbList")
	public ModelAndView resHbList(ModelAndView model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value="merNo") int merNo) {
		
		log.info("상인이 개설한 취미 목록 페이지 요청");
		
		List<Hobby> list = null;
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCountByMerNo(merNo), 8);
		list = service.getHobbyListByMerNo(pageInfo, merNo);
		
		model.addObject("loginMerchant", loginMerchant);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/resHbList");
		
		return model;
	}
	
	/* 예약 목록 리스트 (지영) */
	@GetMapping("/reserveList")
	public ModelAndView reserveList(ModelAndView model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value="hbNo") int hbNo
			) {
		
		log.info("해당 취미에 예약된 예약 리스트 가져오기 요청");
		System.out.println("hbNo : " + hbNo);
		
		
		List<Reserve> list = null;
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getReserveCountByHbNo(hbNo), 8);
		list = service.getReserveListByHbNo(pageInfo, hbNo);
		Hobby hobby = service.findByNo(hbNo);
		
		
		model.addObject("loginMerchant", loginMerchant);
		model.addObject("hobby", hobby);
		model.addObject("hbNo", hbNo);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/reserveList");
		
		return model;
	}
	
	
	@PostMapping("/searchedResList")
	public ModelAndView reserveListBySearch(ModelAndView model,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value="hbNo") int hbNo,
			@RequestParam(value="takeDate")  String takeDate
			) {
		
		log.info("날짜 검색된 예약 리스트 가져오기");
		
		System.out.println(hbNo);
		
		takeDate = takeDate.substring(2); 
		System.out.println(takeDate);
		List<Reserve> list = null;
		
		list = service.getReserveListByTakeDate(hbNo,takeDate);
		Hobby hobby = service.findByNo(hbNo);
		
		
		model.addObject("loginMerchant", loginMerchant);
		model.addObject("hobby", hobby);
		model.addObject("hbNo", hbNo);
		model.addObject("list", list);
		model.setViewName("merchant/searchedResList");
		
		return model;
	}
	
	
	
	
	
	

	/* 예약 상태 변경 */
	@ResponseBody
	@GetMapping("/changeRes")
	public Map<String, String> changeReserve(ModelAndView model,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam("hbNo") int hbNo,
			@RequestParam("resNo") int resNo,
			@ModelAttribute Reserve reserve){
		
		log.info("예약 상태 변경 요청");
		
		System.out.println("hbNo : " + hbNo);
		System.out.println("resNo : " + resNo);
		
		int result = 0;
		String history = null;
		Map<String, String>map = new HashMap<>();


		log.info("예약 상태 확인 요청");
		history = service.selectResStatusByNo(hbNo, resNo);
		System.out.println("history : " + history);
		
		if( history.equals("Y")) {
			log.info("예약 취소로 update");
			result = service.resCancle(hbNo, resNo);
			map.put("status", "N");
		} 
		
		return map;
	}
	
	@GetMapping("/manual")
	public ModelAndView manual(ModelAndView model,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant) {
		
		log.info("운영 메뉴얼 요청");
		
		System.out.println("loginMerchant : " + loginMerchant);
		
		String nickName = loginMerchant.getMerNick();
		model.addObject("nickName", nickName);
		model.setViewName("merchant/manual");
		
		return model;
	}
	
	@GetMapping("/faq")
	public String faq() {
		log.info("자주 묻는 질문 페이지 요청");
		
		return "merchant/faq";
	}
	
	
	
	/*후기 가져오기*/
	@GetMapping("/Reviewmanagement")
	public ModelAndView reviewList(ModelAndView model,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		
		
		List<Review> reviewList = null;
		int merNo = loginMerchant.getMerNo();

		PageInfo pageInfo = new PageInfo(page, 6, service.getReviewCount(merNo), 6);
		reviewList = service.getReviewList(pageInfo, merNo);

		/* 후기 타이틀 이름 가져오기 */
		List<String> hobbyTitle = null;
		hobbyTitle = service.getHobbyTitle(merNo);
		
		
		int sumScore = 0;
		for(int i=0; i<reviewList.size();i++) {

			sumScore += reviewList.get(i).getRvScore();
		}
		
		double avgScore = (double)sumScore/reviewList.size();
		sumScore = (int)Math.round(avgScore);
		
		
		model.addObject("size",reviewList.size());
		model.addObject("hobbyTitle",hobbyTitle);
		model.addObject("sumScore",sumScore);
		model.addObject("reviewList", reviewList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/Reviewmanagement");

		return model;

	}
	
	/* 각 취미별로 후기 가져오기*/
	@GetMapping("/ReviewByTitle")
	public ModelAndView reviewList(ModelAndView model,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value="hbNo") int hbNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int merNo = loginMerchant.getMerNo();
		
		/* review(리뷰) 리스트 가져오기 */
		List<Review> reviewList = null;
		int count = service.getReviewCount(hbNo);
		PageInfo pageInfo = new PageInfo(page, 10, count, 6);
		int listCount = pageInfo.getListCount(); 
		reviewList = service.getReviewListByNo(pageInfo, hbNo);

		/* 후기 타이틀 이름 가져오기 */
		List<String> hobbyTitle = null;
		hobbyTitle = service.getHobbyTitle(merNo);
		
		
		int sumScore = 0;
		for(int i=0; i<reviewList.size();i++) {

			sumScore += reviewList.get(i).getRvScore();
		}
		
		double avgScore = (double)sumScore/reviewList.size();
		sumScore = (int)Math.round(avgScore);
		
		model.addObject("size",reviewList.size());
		model.addObject("hobbyTitle",hobbyTitle);
		model.addObject("sumScore",sumScore);
		model.addObject("reviewList", reviewList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("count", count);
		model.addObject("listCount", listCount);
		model.setViewName("merchant/Reviewmanagement");

		return model;
	}
	
	//취미수정페이지이동
	@GetMapping("/hobbyUpdate")
	public ModelAndView hobbyUpdateView(ModelAndView model,
			HttpServletRequest request,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam("hbNo") int hbNo) {
		
		Hobby hobby = service.findByNo(hbNo);
		List<Category> list = null;
		list = service.getCateList();

		model.addObject("list", list);
	       model.addObject("hbNo", hbNo);
	       model.addObject("hobby",hobby);
	       model.setViewName("/merchant/hobbyUpdate");
		
		
		return model;
	}
	
	//취미수정
	@PostMapping("/hobbyUpdate")
	public ModelAndView hobbyUpdate(ModelAndView model,@RequestParam("postcode") String postcode,
	        @RequestParam("exactAddress") String exactAddress, 
			MultipartHttpServletRequest mtfRequest,
			@RequestParam("hbNo") int hbNo,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@ModelAttribute Hobby hobby) {
		
		List<String> setFile = null;
		
		
		/* 다중 파일 불러오기 */
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		/* 썸네일 파일 불러오기 */
		MultipartFile thumFile = mtfRequest.getFile("input-file");
		
		/* 상세페이지 이미지 파일 불러오기 */
		MultipartFile detailFile = mtfRequest.getFile("input-file-detail");
		
		
		/* 경로, 변수 설정 */
		String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/hobby/";
		
		if(hobby.getHbImgsRename() != null) {
			// 이전에 업로드된 첨부파일 삭제
			service.deleteFile(savePath +"/" + hobby.getHbImgsRename() + hobby.getHbImgsOri());
		}
		if(hobby.getHbThumRename() != null) {
			// 이전에 업로드된 첨부파일 삭제
			service.deleteFile(savePath +"/" + hobby.getHbThumRename() + hobby.getHbThumOri());
		}
		if(hobby.getHbDetailRename() != null) {
			// 이전에 업로드된 첨부파일 삭제
			service.deleteFile(savePath +"/" + hobby.getHbDetailRename() + hobby.getHbDetailOri());
		}
		
		if(!fileList.get(0).isEmpty()) {
			/*
			 * String originalFileString = null; String renamedFileString = null; String
			 * thumOri = null; String thumRename = null;
			 */
			service.saveFiles(fileList, savePath, hobby);
		
		}
		if(!thumFile.isEmpty()) {
			setFile = service.saveFile(thumFile, savePath, hobby);
			hobby.setHbThumOri(setFile.get(0));
			hobby.setHbThumRename(setFile.get(1));
		
		}
		
		if(!detailFile.isEmpty()) {
			setFile = service.saveFile(detailFile, savePath, hobby);
			hobby.setHbDetailOri(setFile.get(0));
			hobby.setHbDetailRename(setFile.get(1));
		}

		
		int result = 0;
		
		
		if(loginMerchant.getMerNo() == hobby.getMerNo()) {
			
			if (hobby.getHbDiscountStatus() == null) {
				hobby.setHbDiscountStatus("N");
				hobby.setHbDiscountRate(null);
			}

			String location = postcode + "," + hobby.getHbLocation() + "," + exactAddress;
			hobby.setHbLocation(location);
			result = service.save(hobby);
			System.out.println("result" + result);
	    	if(result > 0) {
	    		model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
	    		model.addObject("location", "/merchant/list?merNo=" + loginMerchant.getMerNo());
	    	} else {
	    		model.addObject("msg", "게시글 수정을 실패하였습니다.");
	    		model.addObject("location", "/merchant/list?merNo=" + loginMerchant.getMerNo());
	    	}
	    }else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/merchant/list?merNo=" + loginMerchant.getMerNo());
	    }
		model.addObject("hbNo",hbNo);
		model.setViewName("common/msg");
		return model;
	}
	
	//추가이미지삭제버튼 구현
	@PostMapping("/imgsDelete")
	public ModelAndView imgsDelete(ModelAndView model,
			@RequestParam("hbNo") int hbNo) {

		int result = service.imgsDelete(hbNo);


		model.addObject("hbNo",hbNo);
		
		model.setViewName("/common/msg");

		return model;
	}
	
}
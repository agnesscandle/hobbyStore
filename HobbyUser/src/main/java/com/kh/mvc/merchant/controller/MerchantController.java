package com.kh.mvc.merchant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			list = service.getHobbyList(pageInfo);

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
	
	// 회원가입 처리
	@RequestMapping(value = "/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Merchant merchantmember,
			HttpServletRequest request, @RequestParam("upfile") MultipartFile upfile) {
		
		System.out.println(merchantmember);
		System.out.println(upfile.getOriginalFilename());
		System.out.println(upfile.isEmpty());
		
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/profile";
			String renameFileName = service.saveMerFile(upfile, savePath);
			
			System.out.println(renameFileName);
			
			if(renameFileName != null) {
				merchantmember.setMerImgOriginal(upfile.getOriginalFilename());
				merchantmember.setMerImgRename(renameFileName); // board 객체에 반환된 renameFileName set 해줌
			}
		
		
		result = service.save(merchantmember);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/login");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/merchant/enroll");
		}
		}	else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 아이디 중복검사 
		@GetMapping("/idChk")
		@ResponseBody
		public Map<String, Object> memberIdChk(@RequestParam("merId") String merId) {
			log.info("User ID : {}", merId);
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("validate", service.validate(merId));
			
			return map;
		}
		
	/*
	 * @GetMapping("/hobby/enroll") public String hobbyView() { log.info("취미관리페이지");
	 * 
	 * return "/hobby/enroll"; }
	 */

	/* 취미 등록페이지 요청 */
	@GetMapping("/hobbyEnroll")
	public ModelAndView enrollView(ModelAndView model, @ModelAttribute Category category) {

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

		/* 다중 파일 불러오기 */
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		/* 썸네일 파일 불러오기 */
		MultipartFile thumFile = mtfRequest.getFile("input-file");
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
			System.out.println("타나?");
		
		}
		if(!thumFile.isEmpty()) {
			service.saveFile(thumFile, savePath, hobby);
			System.out.println("타나?썸네일");
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
	
	/*후기 가져오기*/
	@GetMapping("/Reviewmanagement")
	public ModelAndView reviewList(ModelAndView model,
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		
		
		List<Hobby> list = null;


		PageInfo pageInfo = new PageInfo(page, 6, service.getHobbyCount(), 6);
		list = service.getHobbyList(pageInfo, loginMerchant.getMerNo());

		System.out.println(list);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("merchant/Reviewmanagement");

		return model;

	}
	
	/* 각 취미별로 후기 가져오기*/
	@GetMapping("/Review")
	public ModelAndView reviewList(ModelAndView model,
			@RequestParam(value="hbNo") int hbNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {


		/* review(리뷰) 리스트 가져오기 */
		List<Review> reviewList = null;
		int count = service.getReviewCount(hbNo);
		PageInfo pageInfo = new PageInfo(page, 10, count, 6);
		int listCount = pageInfo.getListCount(); 
		reviewList = service.getReviewList(pageInfo, hbNo);


		model.addObject("reviewList", reviewList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("count", count);
		model.addObject("listCount", listCount);
		model.setViewName("merchant/review");

		return model;
	}
	
	
	

	
	@GetMapping("/calculatelist")
	public ModelAndView calculatelist(ModelAndView model,
			@RequestParam(value="merNo") int merNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
          System.out.println("리스트호출");
  		
          
        List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getCalculateCount(), 8);
		list = service.getHobbycalList(pageInfo, merNo);
		
		
		
		System.out.println(list+"callist 확인");
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("calculation/calculationlist");

		return model;

	}
	
	@RequestMapping(value="/calculateview",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calculateview(ModelAndView model,
			@RequestParam(value="hbNo") int hbNo) {
          System.out.println("리스트호출");
  		
          
        List<Reserve> list = null;
		
		list = service.getReserveList(hbNo);
		
		
		
		System.out.println(list+"맵퍼 확인");
		model.addObject("list", list);

		model.setViewName("calculation/calculationview");

		return model;

	}
	
	@GetMapping("/calculateWait")
	public ModelAndView calculateHistory(ModelAndView model,
			@RequestParam("merNo")int merNo)
	{
		//Calculation가져오기
		List<Calculation> list = null;
		System.out.println(merNo);
		list = service.getCalculateList(merNo);
		System.out.println(list+"웨잇확인");
		model.addObject("list", list);

		model.setViewName("calculation/calculationWait");
		return model;
	}
	
	@GetMapping("/calculateFinish")
	public ModelAndView calculateFinish(ModelAndView model,
			@RequestParam("merNo")int merNo)
	{
		//Calculation가져오기
		List<Calculation> list = null;
		System.out.println(merNo);
		list = service.getCalFinishList(merNo);
		System.out.println(list+"웨잇확인");
		model.addObject("list", list);

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
	          System.out.println("리스트호출");
	  		
	          
	        List<Hobby> list = null;

			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
			list = service.getHobbycalList(pageInfo, merNo);
			
			
			
			System.out.println(list+"맵퍼 확인");
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("merchant/attendanceList");

			return model;
		}
		
		//qna리스트페이지로이동
		@GetMapping("/attendanceView")
		public ModelAndView attendanceView(ModelAndView model,
				@RequestParam(value="hbNo") int hbNo,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
			System.out.println(hbNo);
//			 //Qna리스트 불러오기
//		    List<Qna> qnaList = null;
//
//		    PageInfo pageInfo = new PageInfo(page, 10, service.getQnaCount(hbNo), 10);
//		    int listCount = pageInfo.getListCount();
//		    qnaList = service.getQnaList(pageInfo, hbNo);
//
//		    //리플리스트 불러오기
//		    List<Reply> replyList = null;
//		    for (int i = 0; i < qnaList.size(); i++) {
//		       int qnaNo = qnaList.get(i).getQnaNo();
//
//		       replyList = service.getReplyList(qnaNo);
//		       
//		       qnaList.get(i).setReply(replyList);
//		       System.out.println(qnaList);
//		    }
//		    
//		    model.addObject("qnaList", qnaList);
//		    model.addObject("pageInfo", pageInfo);
//		    model.addObject("listCount", listCount);
			model.addObject("hbNo",hbNo);
		    model.setViewName("merchant/attendanceView");

		    return model;

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
	
}
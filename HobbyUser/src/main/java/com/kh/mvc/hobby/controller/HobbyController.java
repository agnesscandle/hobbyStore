package com.kh.mvc.hobby.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.service.HobbyService;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Report;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Review;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.merchant.model.vo.Merchant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hobby")
public class HobbyController {

	@Autowired
	private HobbyService service;

	/* 취미 상세페이지 요청 */
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, @RequestParam("hbNo") int hbNo) {

		/* Hobby(취미) 상세내용 가져오기 */
		Hobby hobby = service.findByNo(hbNo);

		/*CategoryName(카테고리명) 가져오기*/
		String cateName = service.findCateNameByNo(hobby.getCateNo());
		hobby.setCateName(cateName);
		//System.out.println("카테고리명 : " + cateName);
		
		model.addObject("hobby", hobby);
		model.setViewName("hobby/view");

		return model;
	}

	/* 취미 후기페이지 요청 */
	@GetMapping("/view/reviewList")
	public ModelAndView reviewList(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("hbNo") int hbNo) {

		/* Hobby(취미) 상세내용 가져오기 */
		Hobby hobby = service.findByNo(hbNo);

		/* review(리뷰) 리스트 가져오기 */
		List<Review> reviewList = null;
		int count = service.getReviewCount(hbNo);
		PageInfo pageInfo = new PageInfo(page, 10, count, 6);
		int listCount = pageInfo.getListCount(); 
		reviewList = service.getReviewList(pageInfo, hbNo);

		/* review(리뷰) 작성 가능한지 검사 : 로그인 상태 && 수강 이력이 있고, 후기를 한번도 작성하지 않은 상태 검사 */
		if (loginMember != null && service.reviewFindByNo(hbNo, loginMember.getMemNo()) == null) {

			int memNo = loginMember.getMemNo();
			int reserveCount = service.getReserveCount(hbNo, memNo);
			model.addObject("reserveCount", reserveCount);
		}
		/* review(리뷰) 작성 가능한지 검사 : 로그인 상태 && 수강 이력이 있고, 후기를 작성했다면 수정을 위해 후기 정보 가져오기 */
		if (loginMember != null && service.reviewFindByNo(hbNo, loginMember.getMemNo()) != null) {
			int memNo = loginMember.getMemNo();
			Review reviewByNo = service.reviewFindByNo(hbNo, memNo);
			model.addObject("reviewByNo", reviewByNo);
		}
		
		model.addObject("hobby", hobby);
		model.addObject("reviewList", reviewList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("count", count);
		model.addObject("listCount", listCount);
		model.setViewName("hobby/reviewList");

		return model;
	}
	
	@GetMapping("/view/deleteReview")
	public ModelAndView deleteReview(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("hbNo") int hbNo,
			@RequestParam("rvNo") int rvNo) {

		int memNo = loginMember.getMemNo();
		int result = service.deleteReview(rvNo);
		
		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		} else {
			model.addObject("msg", "게시글이 삭제를 실패하였습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		}

		model.setViewName("common/msg");

		return model;
	}
	
	
	@PostMapping("/view/updateReview")
	public ModelAndView update(ModelAndView model, 
			@RequestParam("hbNo") int hbNo,
			@RequestParam("rvNo") int rvNo,
			MultipartHttpServletRequest mtfRequest,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Review review) {
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		if(!fileList.get(0).isEmpty()) {
			/*
			 * String src = mtfRequest.getParameter("src");
			 * System.out.println("src value : " + src);
			 */
			String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/review/";
			/*
			 * String originalFileString = null; String renamedFileString = null;
			 */
			service.saveFiles(fileList, savePath, review);	
		}

		
		int result = 0;
		
		review.setRvNo(rvNo);
		review.setHbNo(hbNo);
		review.setMemNo(loginMember.getMemNo());
		result = service.save(review);
		
		if (result > 0) {
			model.addObject("msg", "후기를 정상적으로 수정하였습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		} else {
			model.addObject("msg", "후기 수정에 실패하였습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		}

		model.setViewName("common/msg");

		return model;
		
	}
	
	
	@PostMapping("/view/writeReview")
	public ModelAndView writeReview(ModelAndView model, 
			@RequestParam("hbNo") int hbNo,
			MultipartHttpServletRequest mtfRequest,
			@SessionAttribute(name = "loginMember", 
			required = false) Member loginMember,
			@ModelAttribute Review review) {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		
		if(!fileList.get(0).isEmpty()) {
			/*
			 * String src = mtfRequest.getParameter("src");
			 * System.out.println("src value : " + src);
			 */
			String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/review/";
			/*
			 * String originalFileString = null; String renamedFileString = null;
			 */
			service.saveFiles(fileList, savePath, review);
		}

		int result = 0;
		
		review.setHbNo(hbNo);
		review.setMemNo(loginMember.getMemNo());
		result = service.save(review);
		
		if (result > 0) {
			model.addObject("msg", "후기를 정상적으로 등록하었습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		} else {
			model.addObject("msg", "후기 등록에 실패하였습니다.");
			model.addObject("location", "/hobby/view/reviewList?hbNo="+hbNo);
		}

		model.setViewName("common/msg");

		return model;
	}

	/* 취미 목록페이지 요청 */
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
		list = service.getHobbyList(pageInfo);

		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("hobby/list");

		return model;

	}

	/* 헤더에서 취미 검색 */
	@GetMapping("/list/search")
	public ModelAndView searchList(ModelAndView model, @RequestParam("searchDate") String search,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		List<Hobby> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbySearchCount(search), 8);
		list = service.getHobbySearchList(pageInfo, search);

		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("hobby/list");

		return model;

	}

	
	@GetMapping("/list/cate")
	public ModelAndView listByCateNo(ModelAndView model, @RequestParam("cateNo") int cateNo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		List<Hobby> list = null;
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCountByCateNo(cateNo), 8);
		list = service.getHobbyListByCateNo(pageInfo, cateNo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("hobby/list");
		
		return model;
	}
	
	
	/* 취미 등록페이지 요청 */
	@GetMapping("/enroll")
	public ModelAndView enrollView(ModelAndView model, @ModelAttribute Category category) {

		List<Category> list = null;
		list = service.getCateList();

		model.addObject("list", list);
		model.setViewName("hobby/enroll");

		return model;
	}

	/* 취미 등록 */
	@PostMapping("/enroll")
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

	/* 상인정보보기 */
	@GetMapping("/merInfo")
	public ModelAndView merInfo(ModelAndView model,
			@RequestParam("hbNo") int hbNo, @RequestParam("merNo") int merNo){
		
		log.info("상인정보 팝업창 요청");
		
		Hobby hobby = service.findByNo(hbNo);
		
		Merchant merchant = service.findMerInfoByNo(merNo);		
		
		model.addObject("hobby", hobby);
		model.addObject("merchant", merchant);
		model.setViewName("hobby/merInfo");
		
		return model;
	}
	
	
	/* 좋아요 */
	@ResponseBody
	@GetMapping("/liked")
	public Map<String, String> liked(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant,
			@RequestParam("hbNo") int hbNo,
			@ModelAttribute Liked liked) {

		log.info("좋아요 요청");
		System.out.println("로그인 회원 번호 : " + loginMember.getMemNo());
		System.out.println("취미번호 : " + hbNo);
		
		int result = 0;
		String history = null;
		Map<String, String>map = new HashMap<>();
		
		// 로그인 상태 확인
		if (loginMember != null) {
			liked.setHbNo(hbNo);
			liked.setMemNo(loginMember.getMemNo());

			log.info("로그인 체크 성공");
			System.out.println("취미번호 : " + hbNo);
			System.out.println("좋아요 누른 회원 번호 : " + liked.getMemNo());
			System.out.println("getLikedNo : " + liked.getLikedNo());

			history = service.selectLikedStatusByNo(liked.getHbNo(), liked.getMemNo());

			System.out.println("history : " + history);
			log.info("좋아요 상태 확인 요청");

			// 좋아요 status 체크
			// 1. null인 경우 insert : insertLiked
			if (history == null) {

				log.info("좋아요 insert");
				result = service.insertLiked(liked);
				map.put("status", "Y");
				
			// 2. N인 경우 Y로 update : updateLiked
			} else if (history.equals("N")) {
				log.info("좋아요 update");
				result = service.updateLiked(liked.getHbNo(), liked.getMemNo());
				map.put("status", "Y");
				
				
			// 3. Y인 경우 N으로 update : updateUnliked
			} else {
				log.info("안 좋아요 update");
				result = service.updateUnliked(liked.getHbNo(), liked.getMemNo());
				map.put("status", "N");
			}			
		}

		return map;
	}

	/* 신고하기 페이지 요청 */
	@GetMapping("/report")
	public String reportView(@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		log.info("신고글 작성 페이지 요청");
		return "hobby/report";
	}

	/* 신고하기 */
	@PostMapping("/report")
	public ModelAndView report(ModelAndView model, @RequestParam("hbNo") int hbNo,
			@RequestParam("hbTitle") String hbTitle,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Report report) {

		int result = 0;
		log.info("신고글 작성 요청");

		// 1. 로그인 정보 확인
		// loginMember의 아이디로 report의 rpWriterNo로 set해줌

		System.out.println("로그인 성공된 회원 아이디 : " + loginMember.getMemId());
		System.out.println("report.getRpWriterId() : " + report.getRpWriterId());
		if (loginMember.getMemId().equals(report.getRpWriterId())) {
			report.setRpWriterNo(loginMember.getMemNo());

			// 2. DB에 저장 : saveReport(report)
			result = service.saveReport(report);

			if (result > 0) {
				model.addObject("msg", "신고글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/");
			} else {
				model.addObject("msg", "신고글 등록을 실패하였습니다.");
				model.addObject("location", "/hobby/view?hbNo=" +hbNo);
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}

		model.setViewName("common/msg");
		return model;
	}


	 /* 문의 및 댓글 */
    @GetMapping("/question")
    public ModelAndView question(ModelAndView model,
          @RequestParam("hbNo") int hbNo
          ,@SessionAttribute(name = "loginMember", required = false) Member loginMember,
          @ModelAttribute Qna qna) {
       
       Hobby hobby = service.question(hbNo);
       System.out.println(hobby);
       if(loginMember.getMemNo() == qna.getMemNo()) {

       }else {
          
          model.addObject("msg", "잘못된 접근입니다");
          model.addObject("location", "/");
       }
       model.addObject("hobby",hobby);
       model.setViewName("/hobby/question");
       
       return model;
    }
    
    @PostMapping("/question")
    public ModelAndView write(ModelAndView model, HttpServletRequest request,
          @SessionAttribute(name = "loginMember", required = false) Member loginMember,
          @ModelAttribute Qna qna) {
       int result =0;
       qna.setMemNo(loginMember.getMemNo());
       result = service.saveQna(qna);
      
       if(result > 0) {
          model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
          model.addObject("location", "/");
       } else {
          model.addObject("msg", "게시글이 등록을 실패하였습니다.");
          model.addObject("location", "/");
       }
       model.setViewName("common/msg");
       
       return model;
    }

 @GetMapping("/qnaList")
 public ModelAndView qnaList(ModelAndView model,
       @RequestParam(value = "page", required = false, defaultValue = "1") int page,
       @RequestParam("hbNo") int hbNo) {

    List<Qna> qnaList = null;

    PageInfo pageInfo = new PageInfo(page, 10, service.getQnaCount(hbNo), 10);
    int listCount = pageInfo.getListCount();
    qnaList = service.getQnaList(pageInfo, hbNo);

    List<Reply> replyList = null;
    for (int i = 0; i < qnaList.size(); i++) {
       int qnaNo = qnaList.get(i).getQnaNo();

       replyList = service.getReplyList(qnaNo);
       
       qnaList.get(i).setReply(replyList);
       
    }
    
    model.addObject("qnaList", qnaList);
    model.addObject("pageInfo", pageInfo);
    model.addObject("listCount", listCount);
    model.setViewName("hobby/qnaList");

    return model;
 }
   @PostMapping("/qnaList")
    public ModelAndView qnaReply(ModelAndView model,
//          ,@SessionAttribute(name = "loginMerchant", required = false) Merchant loginMerchant)
          HttpServletRequest request,
          @ModelAttribute Reply reply,  @RequestParam("hbNo") int hbNo) {
       int result = service.saveReply(reply);
       
       if(result > 0) {
          model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
          model.addObject("location", "/hobby/qnaList?hbNo=" + hbNo);
       } else {
          model.addObject("msg", "게시글이 등록을 실패하였습니다.");
          model.addObject("location", "/hobby/qnaList");
       }
       model.setViewName("common/msg");
       return model;
    }
   
   
  @GetMapping("/qnaUpdate")
  public ModelAndView qnaUpdateView(ModelAndView model,
    //    @SessionAttribute(name = "loginMember", required = false) Member loginMember,
        @RequestParam("qnaNo") int qnaNo) {
     
     Qna qna = service.findByQnaNo(qnaNo);
     
//       if(loginMember.getNo() == board.getWriterNo()) {
//          model.addObject("board", board);
//          model.setViewName("/board/update");
//       }else {
//          model.addObject("msg", "잘못된 접근입니다");
//          model.addObject("location", "/board/list");
//          model.setViewName("common/msg");
//       }
     System.out.println(qnaNo);
       model.addObject("qna", qna);
       model.setViewName("/hobby/qnaUpdate");
     
     return model;
  }
 @PostMapping("/qnaUpdate")
 public ModelAndView qnaUpdate(ModelAndView model,
//       @SessionAttribute(name = "loginMember", required = false) Member loginMember,
       HttpServletRequest request,
       @ModelAttribute Qna qna, @ModelAttribute Hobby hobby) {
    int result = 0;
    
    result = service.saveQna(qna);
    
    if(result > 0) {
       model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
       model.addObject("location", "/hobby/qnaList?hbNo=" + hobby.getHbNo());
    } else {
       model.addObject("msg", "게시글 수정을 실패하였습니다.");
       model.addObject("location", "/hobby/qnaUpdate?qnaNo=" + qna.getQnaNo());
    }
    
    model.setViewName("common/msg");
    return model;
 }

 @GetMapping("/qnaDelete")
 public ModelAndView qnaDelete(ModelAndView model,
       //@SessionAttribute(name = "loginMember", required = false) Member loginMember,
       HttpServletRequest request,
       @ModelAttribute Qna qna, @ModelAttribute Hobby hobby) {
    
    int result =0;
    
    result = service.deleteQna(qna);
    
    if(result > 0) {
       model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
       model.addObject("location", "/hobby/qnaList?hbNo=" + hobby.getHbNo());
    } else {
       model.addObject("msg", "게시글 수정을 실패하였습니다.");
       model.addObject("location", "/hobby/qnaList?qnaNo=" + qna.getQnaNo());
    }
    model.setViewName("common/msg");
    return model;
 }


	

	/*
	 * @PostMapping("/qnaList") public ModelAndView qnaReply(ModelAndView model, //
	 * ,@SessionAttribute(name = "loginMerchant", required = false) Merchant
	 * loginMerchant)
	 * 
	 * @ModelAttribute Reply reply) { int result = service.saveReply(reply);
	 * 
	 * if(result > 0) { model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
	 * model.addObject("location", "/"); } else { model.addObject("msg",
	 * "게시글이 등록을 실패하였습니다."); model.addObject("location", "/"); }
	 * model.setViewName("common/msg"); return model; } }
	 */
	
	
	/* 예약 및 결제 페이지 요청 */
	@GetMapping("/reserve")
	public ModelAndView reserveView(ModelAndView model, @RequestParam("hbNo") int hbNo,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {

		log.info("예약 및 결제 페이지 요청");
		
		/* Hobby(취미) 상세내용 가져오기 */
		Hobby hobby = service.findByNo(hbNo);

		
		model.addObject("hobby", hobby);
		model.setViewName("hobby/reserve");

		return model;
	}
	
	/* 예약 및 결제하기 */
	@PostMapping("/reserve")
	public ModelAndView reserve(ModelAndView model,
			HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Reserve reserve) {

		log.info("예약 및 결제 요청");
		System.out.println("로그인 회원 아이디 : " + loginMember.getMemId());
		System.out.println("결제 금액 : " + reserve.getPayFee());
		int result = 0;		
		
		result = service.saveReserve(reserve);
		
		if(result>0) {
			model.addObject("msg", "결제가 완료되었습니다.");
            model.addObject("location", "/");
		} else {
			model.addObject("msg", "결제가 실패되었습니다.");
            model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		return model;
	}


}
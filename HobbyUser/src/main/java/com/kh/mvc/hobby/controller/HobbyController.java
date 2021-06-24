package com.kh.mvc.hobby.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.service.HobbyService;
import com.kh.mvc.hobby.model.vo.Hobby;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hobby")
public class HobbyController {


	
	@Autowired
	private HobbyService service;
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model) {

		model.setViewName("hobby/view");
		
		return model;
	}
	
	@GetMapping("/list")
	   public ModelAndView list(ModelAndView model,
	         @RequestParam(value="page", required= false,defaultValue="1")int page) {
	      
	      List<Hobby> list = null;
	      
	      PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 8);
	      list = service.getHobbyList(pageInfo);
	      
	      
	      
	      
	      model.addObject("list", list);
	      model.addObject("pageInfo", pageInfo);
	      model.setViewName("hobby/list");
	      
	      return model;
	      
	   }

	
	@GetMapping("/enroll")
	public void enrollView() {
		log.info("취미 등록 페이지로 요청");
	}

	@PostMapping("/enroll")
	public ModelAndView enroll(ModelAndView model,
	//	@SessionAttribute(name = "loginMember", required = false) Member loginMember,, HttpServletRequest request
		@ModelAttribute Hobby hobby) {
		
		int result = 0;
		log.info("게시글 작성요청");
		

		
		result = service.save(hobby);
		
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
}

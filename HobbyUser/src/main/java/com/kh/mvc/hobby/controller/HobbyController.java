package com.kh.mvc.hobby.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.service.HobbyService;
import com.kh.mvc.hobby.model.vo.Hobby;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HobbyController {

	@Autowired
	private HobbyService service;
	
	@GetMapping("/hobby/list")
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
	
	
		
}

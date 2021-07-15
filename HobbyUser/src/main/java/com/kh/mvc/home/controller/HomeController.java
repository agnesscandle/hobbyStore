package com.kh.mvc.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.controller.HobbyController;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.home.model.service.HomeService;
import com.kh.mvc.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	@Autowired
	private HomeService service;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(ModelAndView model
			) {
		
		List<Hobby> list = null;

		list = service.getHobbyList();
		model.addObject("list", list);

		model.setViewName("home");
		//System.out.println(list);
		return model;
		
		
		
	}
	
}

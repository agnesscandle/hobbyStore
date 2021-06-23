package com.kh.mvc.hobby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/hobby")
public class HobbyController {

	@GetMapping("/view")
	public ModelAndView view(ModelAndView model) {

		model.setViewName("hobby/view");
		return model;
	}
}

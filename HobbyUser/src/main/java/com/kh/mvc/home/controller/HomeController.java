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
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 메인 취미리스트 불러오기
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView home(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		// category가 커리어 취미
		List<Hobby> listS = null; 
		// 지금 할인중인 취미
		List<Hobby> listD = null;
		// 인기있는 취미
		List<Hobby> listP = null;
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 4);
		
		listD = service.getDHobbyList(pageInfo);
		listS = service.getSHobbyList(pageInfo);
		listP = service.getPHobbyList(pageInfo);
		
		model.addObject("listD", listD);
		model.addObject("listS", listS);
		model.addObject("listP", listP);
		
		model.addObject("pageInfo", pageInfo);
		
		model.setViewName("home");
		
		 
		return model;
		
	}
	
	// 이벤트 페이지 이동
		@GetMapping("/main/event")
		public ModelAndView eventView(ModelAndView model,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
			log.info("이벤트 페이지 요청");
			
			List<Hobby> listD = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 12);

			listD = service.getDHobbyList(pageInfo);
			
			model.addObject("listD", listD);
			model.addObject("pageInfo", pageInfo);

			model.setViewName("main/event");
			
			return model;
		}
		
	// 오픈 예정 페이지 이동
		@GetMapping("/main/grandOpening")
		public ModelAndView openView(ModelAndView model,
				@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
			log.info("오픈 예정 페이지 요청");
			
			List<Hobby> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getHobbyCount(), 12);
			list = service.getOpenHobbyList(pageInfo);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("main/grandOpening");
			
			return model;
		}
		
		// 베스트 페이지 이동
				@GetMapping("/main/best")
				public ModelAndView bestView(ModelAndView model) { 
					log.info("베스트 페이지 요청");
					
					List<Hobby> list = null;
					list = service.getBestHobbyList();
					
					model.addObject("list", list);
					model.setViewName("main/best");
					
					return model;
				}
				
		// skillUp 전체보기
			@GetMapping("/main/skillUp")
			public ModelAndView skillUpView(ModelAndView model,
					@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
				log.info("skillUp 페이지 요청");
				// category가 커리어 취미
				List<Hobby> listS = null; 
				PageInfo pageInfo = new PageInfo(page, 10, service.getSHobbyCount(), 8);
				
				listS = service.getSHobbyList(pageInfo);
				
				model.addObject("listS", listS);
				model.addObject("pageInfo", pageInfo);
				
				model.setViewName("main/skillUp");
				
				return model;
			}	
			
			// discount 전체보기
				@GetMapping("/main/discount")
				public ModelAndView discountView(ModelAndView model,
						@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
					log.info("discount 페이지 요청");
					
					List<Hobby> listD = null;
					PageInfo pageInfo = new PageInfo(page, 10, service.getDHobbyCount(), 8);

					listD = service.getDHobbyList(pageInfo);
					
					model.addObject("listD", listD);
					model.addObject("pageInfo", pageInfo);

					model.setViewName("main/discount");
					
					return model;
				}	
				
			// 인기UP 전체보기
			@GetMapping("/main/popular")
			public ModelAndView popularView(ModelAndView model,
					@RequestParam(value = "page", required = false, defaultValue = "1") int page) { 
				log.info("인기UP 페이지 요청");
				
				List<Hobby> listP = null;
				PageInfo pageInfo = new PageInfo(page, 10, service.getPHobbyCount(), 8);

				listP = service.getPHobbyList(pageInfo);
				
				model.addObject("listP", listP);
				model.addObject("pageInfo", pageInfo);

				model.setViewName("main/popular");
				
				return model;
			}	
}

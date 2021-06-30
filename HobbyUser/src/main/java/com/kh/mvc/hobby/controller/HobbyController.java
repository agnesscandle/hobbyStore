package com.kh.mvc.hobby.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.service.HobbyService;
import com.kh.mvc.hobby.model.vo.Category;
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
   
   @GetMapping("/list/search")
      public ModelAndView searchList(ModelAndView model,
          @RequestParam("searchDate") String search,
            @RequestParam(value="page", required= false,defaultValue="1")int page) {
         
      
      List<Hobby> list = null;
      
   
         PageInfo pageInfo = new PageInfo(page, 10, service.getHobbySearchCount(search), 8);
         list = service.getHobbySearchList(pageInfo,search);
         model.addObject("list", list);
         model.addObject("pageInfo", pageInfo);
         model.setViewName("hobby/list");

      return model;
         
      }


   
    @GetMapping("/enroll")
      public ModelAndView enrollView(ModelAndView model,@ModelAttribute Category category) {
      log.info("취미 등록 페이지로 요청");
      List<Category> list = null;

        list = service.getCateList();
        
        model.addObject("list", list);
        model.setViewName("hobby/enroll");
        
        return model;
   }
   
   
   @GetMapping("/title")
   public void enrollTitle() {
      log.info("취미 등록 페이지로 요청");
   }
   
   @GetMapping("/hobby-images")
   public void enrollImages() {
      log.info("취미 등록 페이지로 요청");
   }
   
   
   @PostMapping("/enroll")
   public ModelAndView enroll(ModelAndView model, 
         @RequestParam("postcode") String postcode,
         @RequestParam("exactAddress") String exactAddress,
         MultipartHttpServletRequest mtfRequest,   
   //   @SessionAttribute(name = "loginMember", required = false) Member loginMember,, HttpServletRequest request
      @ModelAttribute Hobby hobby) {

      
      /* 다중 파일 불러오기 */
      List<MultipartFile> fileList = mtfRequest.getFiles("file");
      /* 썸네일 파일 불러오기 */
      MultipartFile thumFile = mtfRequest.getFile("input-file");
      
      /* 경로, 변수 설정 */
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);
        String rootPath = mtfRequest.getSession().getServletContext().getRealPath("resources");
        String savePath = rootPath + "/upload/hobby/";
        String originalFileString = null;
        String renamedFileString = null;
        String thumOri = null;
        String thumRename = null;
        
        service.saveFiles(fileList,savePath, hobby);
        service.saveFile(thumFile,savePath, hobby);
        
        

      int result = 0;
      log.info("게시글 작성요청");

      if(hobby.getHbDiscountStatus()==null) {
         hobby.setHbDiscountStatus("N");
         hobby.setHbDiscountRate(null);
      }
      
      
      String location = postcode +","+ hobby.getHbLocation()+","+exactAddress;
      hobby.setHbLocation(location);
      
      
      
      System.out.println(hobby);
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
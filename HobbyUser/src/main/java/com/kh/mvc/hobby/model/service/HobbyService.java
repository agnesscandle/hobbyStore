package com.kh.mvc.hobby.model.service;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Review;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface HobbyService {
   
   int getHobbyCount();

   List<Hobby> getHobbyList(PageInfo pageInfo);

   int save(Hobby hobby);

   List<Category> getCateList();

   void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

   void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);

   
   /* 검색된 목록 가져오기 위한 인터페이스 [김예원]*/
   int getHobbySearchCount(String search);

   List<Hobby> getHobbySearchList(PageInfo pageInfo, String search);

   
	/* review(후기) 관련 인터페이스 [김예원]*/
   int getReviewCount(int hbNo);

   List<Review> getReviewList(PageInfo pageInfo, int hbNo);

   Hobby findByNo(int hbNo);





}
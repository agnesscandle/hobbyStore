package com.kh.mvc.hobby.model.service;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface HobbyService {
   
   int getHobbyCount();

   List<Hobby> getHobbyList(PageInfo pageInfo);

   int save(Hobby hobby);

   List<Category> getCateList();

   void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

   void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);

   int getHobbySearchCount(String search);

   List<Hobby> getHobbySearchList(PageInfo pageInfo, String search);

}
package com.kh.mvc.merchant.model.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.merchant.model.vo.MerchantMember;

public interface MerchantService {

	MerchantMember login(String merId, String merPassword);
	
	int save(MerchantMember merchantMember);

	MerchantMember findById(String merId);

	
	/* 취미 등록 */
	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo);

	int save(Hobby hobby);

	List<Category> getCateList();

	void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

	void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);
	
	
	boolean validate(String merid);
}

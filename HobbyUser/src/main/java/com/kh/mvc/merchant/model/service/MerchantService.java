package com.kh.mvc.merchant.model.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

import com.kh.mvc.merchant.model.vo.Merchant;


import com.kh.mvc.hobby.model.vo.Reserve;


public interface MerchantService {

	Merchant login(String merId, String merPassword);
	
	int save(Merchant merchantMember);

	Merchant findById(String merId);

	
	/* 취미 등록 */
	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo,int adNo);

	int save(Hobby hobby);

	List<Category> getCateList();

	void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

	void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);
	
	
	boolean validate(String merid);

	List<Hobby> getHobbyList(PageInfo pageInfo);

	List<Hobby> getHobbycalList(PageInfo pageInfo, int merNo);

	int calculateApply(Reserve reserve);

	int getReserveCount(int merNo);

	List<Reserve> getReserveList(int hbNo);

	int reserveUpdateStatus(Reserve reserve);

	int getHobbyCountByMerNo(int merNo);

	List<Hobby> getHobbyListByMerNo(PageInfo pageInfo, int merNo);

	int getReserveCountByHbNo(int hbNo);

	List<Reserve> getReserveListByHbNo(PageInfo pageInfo, int hbNo);

	String selectResStatusByNo(int hbNo, int resNo);

	int resCancle(int hbNo, int resNo);

	Hobby findByNo(int hbNo);


}

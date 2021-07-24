package com.kh.mvc.merchant.model.service;


import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Calculation;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Review;

import com.kh.mvc.merchant.model.vo.Merchant;


import com.kh.mvc.hobby.model.vo.Reserve;


public interface MerchantService {

	Merchant login(String merId, String merPassword);
	
	int save(Merchant merchantMember);

	Merchant findById(String merId);

	
	/* 취미 등록 */
	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo,int merNo);

	int save(Hobby hobby);

	List<Category> getCateList();

	List<String> saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

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

	List<Calculation> getCalculateList(int merNo);

	List<Calculation> getCalFinishList(int merNo);

	int getCalculateCount();

	String selectResStatusByNo(int hbNo, int resNo);

	int resCancle(int hbNo, int resNo);

	Hobby findByNo(int hbNo);

	List<Qna> getQnaList(PageInfo pageInfo, int hbNo);

	List<Reply> getReplyList(int qnaNo);

	int getQnaCount(int hbNo);

	int saveReply(Reply reply);

	int deleteReply(Reply reply);

	List<Reserve> getReserveListByTakeDate(int hbNo, String takeDate);
	
	/* 후기 관련 메서드[김예원] */
	int getReviewCount(int memNo);

	List<Review> getReviewList(PageInfo pageInfo, int memNo);

	List<String> getHobbyTitle(int merNo);

	List<Review> getReviewListByNo(PageInfo pageInfo, int hbNo);


	int resAttendY(int hbNo, int resNo);

	String selectResAttendByNo(int hbNo, int resNo);

	int resAttendN(int hbNo, int resNo);

	void deleteFile(String string);

	int imgsDelete(int hbNo);

}

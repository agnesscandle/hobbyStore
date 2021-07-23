package com.kh.mvc.merchant.model.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Calculation;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Review;
import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.merchant.model.vo.Merchant;


import com.kh.mvc.hobby.model.vo.Reserve;


public interface MerchantService {

	Merchant login(String merId, String merPassword);
	
	Merchant checkpw(String merId, String merPassword);
	
	int save(Merchant merchantMember);
	
	int changePw(Merchant merchantmember);
	
	int delete(int merNo);
	
	Merchant findByIdAndName(String merName, String merEmail);

	Merchant findById(String merId);
	
	Merchant findByPhone(String merPhone);
	
	Merchant findByEmail(String merEmail);
	
	Merchant findByBankNum(String bankNumber);
	
	Merchant findByNick(String merNick);
	
	int setNewPw(String merPhone, String numStr);
	
	boolean validate(String merId);
	
	boolean result(String merEmail);
	
	boolean res(String merPhone);
	
	boolean rs(String bankNumber);
	
	boolean nickVal(String merNick);

	String saveMerFile(MultipartFile thumFile, String savePath);
	
	
	
	
	
	/* 취미 등록 */
	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo,int merNo);

	int save(Hobby hobby);

	List<Category> getCateList();

	void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

	void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);
	
	
	

	
	
	
	List<Hobby> getHobbyList(PageInfo pageInfo);


	List<Hobby> getHobbycalList(PageInfo pageInfo, int merNo);

	int calculateApply(Reserve reserve);

	int getReserveCount(int merNo);

	List<Reserve> getReserveList(int hbNo);

	int reserveUpdateStatus(Reserve reserve);


	
	/* 후기 */
	
	int getReviewCount(int hbNo);

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

	List<Review> getReviewList(PageInfo pageInfo, int hbNo);

	List<Qna> getQnaList(PageInfo pageInfo, int hbNo);

	List<Reply> getReplyList(int qnaNo);

	int getQnaCount(int hbNo);

	int saveReply(Reply reply);

	int deleteReply(Reply reply);

	void deleteFile(String filePath);



	

	

	

	

	

	

	

	

	

	

	

	

	
}

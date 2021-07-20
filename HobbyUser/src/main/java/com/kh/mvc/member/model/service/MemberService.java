package com.kh.mvc.member.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.member.model.vo.Member;

public interface MemberService {

	Member login(String memId, String memPassword);
	
	Member findById(String memId);

	Member findByIdAndName(String memName, String memEmail);
	
	Member findByEmail(String memEmail);
	
	Member checkpw(String memId, String memPassword);
	
	boolean validate(String memId);

	boolean result(String memEmail);

	int save(Member member);

	int changePw(Member member);

	int delete(int memNo);

	void certifiedPhoneNumber(String memPhone, String cerNum);
	
	void sendNewPwNumber(String memPhone, String cerNum);

	String saveFile(MultipartFile upfile, String savePath);

	int setNewPw(String memPhone, String numStr);
	

	
	Hobby findByNo(int hbNo);
	
	int getHobbyCount();
	
	List<Hobby> getHobbyLikedList(int memNo, PageInfo pageInfo);
	
	List<Hobby> getHobbyRsList(int memNo, PageInfo pageInfo);


	List<Liked> getLikedList();
	
	int getLikedHobbyCount();

	
	List<Reserve> getRsList(int memNo);

	int getRsHobbyCount();

	
	
	
	List<Category> getCateList();

	Reserve findReserveViewByNo(int memNo, int hbNo);

	Reserve findReserveByNo(int memNo, int hbNo, int resNo);























}

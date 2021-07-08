package com.kh.mvc.member.model.service;

import org.springframework.web.multipart.MultipartFile;

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











}

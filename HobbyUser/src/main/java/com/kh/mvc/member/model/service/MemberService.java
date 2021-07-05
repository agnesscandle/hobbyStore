package com.kh.mvc.member.model.service;

import com.kh.mvc.member.model.vo.Member;

public interface MemberService {

	Member login(String memId, String memPassword);
	
	int save(Member member);

	Member findById(String memId);

	boolean validate(String memId);

	Member findByIdAndName(String memName, String memEmail);

	Member checkpw(String memId, String memPassword);

	int changePw(Member member);

	int delete(int memNo);

	void certifiedPhoneNumber(String memPhone, String cerNum);

	Member findByEmail(String memEmail);
	
	boolean result(String memEmail);









}

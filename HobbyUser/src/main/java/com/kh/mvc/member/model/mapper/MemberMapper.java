package com.kh.mvc.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMember(@Param("memId") String memId);

	int insertMember(Member member);

	Member findId(@Param("memName") String memName, @Param("memEmail") String memEmail);

	int updateMember(Member member);

	Member checkPw(@Param("memPassword") String memPassword);

	int updateMemPwd(Member member);

	int deleteMember(int memNo);

	Member searchEmail(@Param("memEmail") String memEmail);

	Member findByPhone(String memPhone);











}

package com.kh.mvc.member.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Reserve;
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
	
	List<Category> selectCateList();
	
	List<Liked> selectLikedList();

	List<Hobby> selectHobbyLikedList(int memNo, RowBounds rowBounds);

	int selectHobbyCount();

	List<Hobby> selectHobbyRsList(int memNo, RowBounds rowBounds);

	List<Reserve> selectRsList();

	Reserve selectRsByNo(@Param("memNo") int memNo, @Param("hbNo") int hbNo);











}

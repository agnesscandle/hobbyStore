package com.kh.mvc.merchant.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.merchant.model.vo.MerchantMember;

@Mapper
public interface MerchantMemberMapper {
	MerchantMember selectMerchantMember(@Param("merId") String merId);

	int insertMerchantMember(MerchantMember merchantMember);
	

	int selectHobbyCount();

	/*
	 * int selectHobbySearchCount(String sreach);
	 */
	List<Hobby> selectHobbyList(RowBounds rowBounds);

	/* List<Hobby> getHobbySearchList(RowBounds rowBounds, String search); */

	int insertHobby(Hobby hobby);

	List<Category> selectCateList();


}

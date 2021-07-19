package com.kh.mvc.merchant.model.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

import com.kh.mvc.merchant.model.vo.Merchant;


import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Review;

@Mapper
public interface MerchantMapper {
	Merchant selectMerchantMember(@Param("merId") String merId);

	int insertMerchantMember(Merchant merchantMember);
	
	/* 취미 등록 */
	int selectHobbyCount();

	List<Hobby> selectHobbyList(RowBounds rowBounds);

	int insertHobby(Hobby hobby);

	List<Category> selectCateList();

	List<Hobby> selectHobbyMerList(RowBounds rowBounds, int adNo);

	List<Hobby> selectHobbyCalList(RowBounds rowBounds, int merNo);

	int insertCalApply(Reserve reserve);

	int selectReserveCount(int hbNo);

	List<Reserve> selectReserveList(int hbNo);

	int reserveUpdateStatus(Reserve reserve);

	
	
	int selectReviewCount(int merNo);

	List<Review> selectReviewList(RowBounds rowBounds, int merNo);

	List<String> selectHobbyTitle(@Param("merNo") int merNo);

	List<Review> selectReviewListByNo(RowBounds rowBounds, int hbNo);
}

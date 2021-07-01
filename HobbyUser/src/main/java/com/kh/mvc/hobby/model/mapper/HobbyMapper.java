package com.kh.mvc.hobby.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Review;

import java.util.List;
@Mapper
public interface HobbyMapper {
   int selectHobbyCount();

   List<Hobby> selectHobbyList(RowBounds rowBounds);

   int insertHobby(Hobby hobby);
   
   List<Category> selectCateList();

	/* 검색된 목록 가져오기 위한 mapper [김예원]*/
   int selectHobbySearchCount(String sreach);

   List<Hobby> getHobbySearchList(RowBounds rowBounds, String search);

	/* review(후기)관련 mapper  [김예원]*/
   int selectReviewCount(int hbNo);

   List<Review> selectReviewList(RowBounds rowBounds, int hbNo);

   Hobby selectHobbyByNo(int hbNo);

}

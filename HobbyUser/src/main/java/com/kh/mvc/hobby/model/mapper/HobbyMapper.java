package com.kh.mvc.hobby.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Report;
import com.kh.mvc.hobby.model.vo.Review;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface HobbyMapper {
	
	/* 취미 목록 & 취미번호로 취미 객체 불러오는 mapper [공통] */
	int selectHobbyCount();

	List<Hobby> selectHobbyList(RowBounds rowBounds);

	int insertHobby(Hobby hobby);
	
	Hobby selectHobbyByNo(int hbNo);

	/* 카테고리 목록 관련 mapper [이재용] */
	List<Category> selectCateList();

	/* 취미 검색된 목록 가져오기 위한 mapper [김예원] */
	int selectHobbySearchCount(String sreach);

	List<Hobby> getHobbySearchList(RowBounds rowBounds, String search);

	
	/* review(후기)관련 mapper [김예원] */
	int selectReviewCount(int hbNo);

	List<Review> selectReviewList(RowBounds rowBounds, @Param("hbNo") int hbNo);

	/* review(후기) 작성 관련 mapper [김예원] */
	int selectReserveCount(@Param("hbNo") int hbNo, @Param("memNo") int memNo);

	Review selectReviewByNo(@Param("hbNo") int hbNo, @Param("memNo") int memNo);

	int insertReview(Review review);
	
	int updateReview(Review review);
	
	int deleteReview(@Param("rvNo") int rvNo);
	
	/* Liked(좋아요) 관련 mapper [심지영] */

	String selectLikedStatusByNo(HashMap<String, Integer> hashMap);

	int insertLiked(Liked liked);

	int updateLiked(HashMap<String, Integer> hashMap);

	int updateUnliked(HashMap<String, Integer> hashMap);

	
	/* Report(신고하기) 관련 mapper [심지영]*/
	int saveReport(Report report);

	/* Qnd(문의) 관련 mapper [이재용]*/
	int selectQnaCount(int hbNo);

	List<Qna> selectQnaList(RowBounds rowBounds,@Param("hbNo") int hbNo);

	List<Reply> selectReplyList(@Param("qnaNo") int qnaNo);

	int saveReply(Reply reply);

	Qna selectQnaByNo(int qnaNo);

	int deleteQna(Qna qna);

	Hobby selectHobbyByNoQna(int hbNo);

	int updateQna(Qna qna);

	int insertQna(Qna qna);

	

	

	

}

package com.kh.mvc.hobby.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Report;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Review;
import com.kh.mvc.merchant.model.vo.Merchant;

public interface HobbyService {

	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo);

	int save(Hobby hobby);

	List<Category> getCateList();

	void saveFile(MultipartFile thumFile, String savePath, Hobby hobby);

	void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby);

	/* 검색된 목록 가져오기 위한 인터페이스 [김예원] */
	int getHobbySearchCount(String search);

	List<Hobby> getHobbySearchList(PageInfo pageInfo, String search);

	/* review(후기) 관련 인터페이스 [김예원] */
	int getReviewCount(int hbNo);

	List<Review> getReviewList(PageInfo pageInfo, int hbNo);

	Hobby findByNo(int hbNo);

	/* review(후기)작성 관련 인터페이스 [김예원] */
	int getReserveCount(int hbNo, int memNo);

	Review reviewFindByNo(int hbNo, int memNo);

	void saveFiles(List<MultipartFile> fileList, String savePath, Review review);

	int save(Review review);

	int deleteReview(int rvNo);
	
	
	/* 도움돼요 */
	int getUpGoodReview(int rvNo);

	int selectGoodReviewCount(int rvNo);

	/* Liked(좋아요) 관련 인터페이스 */
	String selectLikedStatusByNo(int hbNo, int memNo);

	int insertLiked(Liked liked);

	int updateLiked(int hbNo, int memNo);

	int updateUnliked(int hbNo, int memNo);

	/* Report(신고하기) 관련 인터페이스 */
	int saveReport(Report report);

	/* Qna(신고하기) 관련 인터페이스 */
	List<Qna> getQnaList(PageInfo pageInfo, int hbNo);

	int getQnaCount(int hbNo);

	List<Reply> getReplyList(int qnaNo);

	Hobby question(int hbNo);

	int saveQna(Qna qna);

	int saveReply(Reply reply);

	Qna findByQnaNo(int qnaNo);

   /* 상인 정보 관련 인터페이스 */
   Merchant findMerInfoByNo(int merNo);

   String findCateNameByNo(int cateNo);

   int saveReserve(Reserve reserve);

	int deleteQna(int qnaNo);

	int deleteReply(Reply reply);

	Reply findByReplyNo(int replyNo);

	int getReplyCount(int qnaNo, int merNo);

	/* 카테고리에 해당하는 취미 목록 */
	int getHobbyCountByCateNo(int cateNo);

	List<Hobby> getHobbyListByCateNo(PageInfo pageInfo, int cateNo);

	
}
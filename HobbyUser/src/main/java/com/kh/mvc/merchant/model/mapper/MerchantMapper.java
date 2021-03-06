package com.kh.mvc.merchant.model.mapper;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.format.annotation.DateTimeFormat;

import com.kh.mvc.hobby.model.vo.Calculation;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.merchant.model.vo.Merchant;
import com.kh.mvc.merchant.model.vo.Notice;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Review;

@Mapper
public interface MerchantMapper {
	
	Merchant selectMerchantMember(@Param("merId") String merId);

	int insertMerchantMember(Merchant merchantMember);
	
	int updateMerPwd(Merchant merchantmember);
	
	int updateMerchantMember(Merchant merchantMember);
	
	int deleteMerchant(@Param("merNo") int merNo);
	
	Merchant searchEmail(@Param("merEmail") String merEmail);
	
	Merchant searchPhone(@Param("merPhone") String merPhone);
	
	Merchant findMerId(@Param("merName") String merName, @Param("merEmail") String merEmail);
	
	Merchant searchNick(@Param("merNick") String merNick);
	
	Merchant findByPhone(String merPhone);

	Merchant searchBankNum(@Param("bankNumber") String bankNumber);
	
	/* 취미 등록 */
	int selectHobbyCount();

	List<Hobby> selectHobbyList(RowBounds rowBounds);

	int insertHobby(Hobby hobby);

	List<Category> selectCateList();

	List<Hobby> selectHobbyMerList(RowBounds rowBounds, int adNo);

	List<Hobby> selectHobbyCalList(RowBounds rowBounds, int merNo);

	int insertCalApply(Reserve reserve);

	int selectReserveCount(int hbNo);

	List<Reserve> selectReserveList(RowBounds rowBounds, int hbNo);

	int reserveUpdateStatus(Reserve reserve);


	int selectQnaCount(int hbNo);

	List<Reply> selectReplyList(int qnaNo);

	List<Qna> selectQnaList(RowBounds rowBounds, int hbNo);

	int saveReply(Reply reply);

	int updateReply(Reply reply);

	int deleteReply(Reply reply);

	/* 예약 관리 (지영) */
	int selectHobbyCountByMerNo(int merNo);

	List<Hobby> getHobbyListByMerNo(RowBounds rowBounds, int merNo);

	int selectReserveCountByHbNo(int hbNo);

	List<Reserve> getReserveListByHbNo(RowBounds rowBounds, int hbNo);

	String selectResStatusByNo(HashMap<String, Integer> hashMap);

	int resCancle(HashMap<String, Integer> hashMap);

	Hobby selectHobbyByNo(int hbNo);

	List<Reserve> selectCalWaitList(int merNo);

	List<Calculation> selectCalFinishList(int merNo);

	int selectCalculateCount();
	
	List<Reserve> selectReserveByTakeDate(@Param("hbNo") int hbNo, @Param("takeDate") String takeDate);

	/* 후기 관련 mapper[김예원] */

	int selectReviewCount(int merNo);
	
	List<Review> selectReviewList(RowBounds rowBounds, int merNo);
	
	List<String> selectHobbyTitle(@Param("merNo") int merNo);

	List<Review> selectReviewListByNo(RowBounds rowBounds, int hbNo);
	
	int resAttendY(HashMap<String, Integer> hashMap);

	String selectResAttendByNo(HashMap<String, Integer> hashMap);

	int resAttendN(HashMap<String, Integer> hashMap);

	int updateHobby(Hobby hobby);

	int selectCalculWaitCount(int merNo);

	int selectCalFinishCount(int merNo);

	

	

	

	

	

	

	


	

	

	

	


	int imgsDelete(int hbNo);

	int getNoticeCount();

	List<Notice> getNoticelist(RowBounds rowBounds);

	Notice selectNoticeByNo(int noticeNum);

}

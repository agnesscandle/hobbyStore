package com.kh.mvc.hobby.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.mapper.HobbyMapper;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Qna;
import com.kh.mvc.hobby.model.vo.Reply;
import com.kh.mvc.hobby.model.vo.Report;
import com.kh.mvc.hobby.model.vo.Reserve;
import com.kh.mvc.hobby.model.vo.Review;
import com.kh.mvc.merchant.model.vo.Merchant;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HobbyServiceImpl implements HobbyService {

	@Autowired
	private HobbyMapper mapper;

	@Override
	public int getHobbyCount() {
		return mapper.selectHobbyCount();
	}

	@Override
	public int getHobbySearchCount(String sreach) {

		return mapper.selectHobbySearchCount(sreach);
	}

	@Override
	public List<Hobby> getHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectHobbyList(rowBounds);
	}

	@Override
	public List<Hobby> getHobbySearchList(PageInfo pageInfo, String search) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.getHobbySearchList(rowBounds, search);
	}

	@Override
	@Transactional
	public int save(Hobby hobby) {
		int result = 0;

		if (hobby.getHbNo() != 0) {
			// 업데이트
		} else {
			result = mapper.insertHobby(hobby);
		}
		return result;
	}

	@Override
	public List<Category> getCateList() {
		// TODO Auto-generated method stub
		return mapper.selectCateList();
	}

	@Override
	public void saveFiles(List<MultipartFile> fileList, String savePath, Hobby hobby) {
		String originalFileString = null;
		String renamedFileString = null;
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String fileName = System.currentTimeMillis() + originFileName;

			String safeFile = savePath + fileName;

			try {
				mf.transferTo(new File(safeFile));

				if (renamedFileString == null) {
					originalFileString = originFileName;
					renamedFileString = fileName;
				} else {
					originalFileString = originalFileString + "," + originFileName;
					renamedFileString = renamedFileString + "," + fileName;
				}

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		hobby.setHbImgsOri(originalFileString);
		hobby.setHbImgsRename(renamedFileString);
	}

	@Override
	public void saveFile(MultipartFile thumFile, String savePath, Hobby hobby) {

		String thumOri = null;
		String thumRename = null;

		/* 썸네일 이미지 저장 */
		thumOri = thumFile.getOriginalFilename();
		thumRename = System.currentTimeMillis() + thumOri;

		try {
			String safeFile = savePath + thumRename;
			thumFile.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		hobby.setHbThumOri(thumOri);
		hobby.setHbThumRename(thumRename);

	}

	
	
	/* 리뷰관련 */
	@Override
	public int getReviewCount(int hbNo) {

		return mapper.selectReviewCount(hbNo);
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo, int hbNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectReviewList(rowBounds, hbNo);
	}

	@Override
	public Hobby findByNo(int hbNo) {
		return mapper.selectHobbyByNo(hbNo);
	}

	@Override
	public int getReserveCount(int hbNo, int memNo) {

		return mapper.selectReserveCount(hbNo, memNo);
	}

	@Override
	public Review reviewFindByNo(int hbNo,int memNo) {

		return mapper.selectReviewByNo(hbNo,memNo);
	}

	@Override
	public void saveFiles(List<MultipartFile> fileList, String savePath, Review review) {
		String originalFileString = null;
		String renamedFileString = null;
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String fileName = System.currentTimeMillis() + originFileName;

			String safeFile = savePath + fileName;

			try {
				mf.transferTo(new File(safeFile));

				if (renamedFileString == null) {
					originalFileString = originFileName;
					renamedFileString = fileName;
				} else {
					originalFileString = originalFileString + "," + originFileName;
					renamedFileString = renamedFileString + "," + fileName;
				}

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		review.setRvOriginalFilename(originalFileString);
		review.setRvRenameFilename(renamedFileString);

		
	}

	@Override
	@Transactional
	public int save(Review review) {
		int result = 0;

		if (review.getRvNo() != 0) {
			result = mapper.updateReview(review);
		} else {
			result = mapper.insertReview(review);
		}
		return result;
	}

	@Override
	@Transactional
	public int deleteReview(int rvNo) {
		int result = 0;
		
		result = mapper.deleteReview(rvNo);
		
		return result;
		
	}
	
	
	
	
	
	
	/* 좋아요 */
	@Override
	public String selectLikedStatusByNo(int hbNo, int memNo) {

		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("hbNo", hbNo);
		hashMap.put("memNo", memNo);

		return mapper.selectLikedStatusByNo(hashMap);
	}

	@Override
	public int insertLiked(Liked liked) {

		return mapper.insertLiked(liked);
	}

	@Override
	public int updateLiked(int hbNo, int memNo) {

		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("hbNo", hbNo);
		hashMap.put("memNo", memNo);

		return mapper.updateLiked(hashMap);
	}

	@Override
	public int updateUnliked(int hbNo, int memNo) {

		HashMap<String, Integer> hashMap = new HashMap<>();
		hashMap.put("hbNo", hbNo);
		hashMap.put("memNo", memNo);

		return mapper.updateUnliked(hashMap);
	}

	/* 신고하기 */
	@Override
	public int saveReport(Report report) {

		return mapper.saveReport(report);
	}

	
	  /* 문의하기 */
	   @Override
	      public Hobby question(int hbNo) {
	         // TODO Auto-generated method stub
	         return mapper.selectHobbyByNoQna(hbNo);
	      }

	      @Override
	      public int saveQna(Qna qna) {
	      int result = 0;
	         
	         if(qna.getQnaNo() !=0) {
	            result = mapper.updateQna(qna);
	         } else {
	            result= mapper.insertQna(qna);
	         }
	         return result;
	      }

	   @Override
	   public int getQnaCount(int hbNo) {
	      return mapper.selectQnaCount(hbNo);
	   }

	   @Override
	   public List<Qna> getQnaList(PageInfo pageInfo,  int hbNo) {
	      int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	      RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
	      return mapper.selectQnaList(rowBounds,hbNo);
	   }

	   @Override
	   public List<Reply> getReplyList(int qnaNo) {
	      
	      return mapper.selectReplyList(qnaNo);
	   }
	      @Override
	      public int saveReply(Reply reply) {
	   int result = 0;
	         
	         if(reply.getReplyNo() !=0) {
	            result = mapper.updateReply(reply);
	         } else {
	            result= mapper.saveReply(reply);
	         }
	         return result;
	      }

	   @Override
	   public Qna findByQnaNo(int qnaNo) {
	      return mapper.selectQnaByNo(qnaNo);
	   }

	   @Override
	   public int deleteQna(int qnaNo) {
	      return mapper.deleteQna(qnaNo);
	   }


	@Override
	public int deleteReply(Reply reply) {
	      return mapper.deleteReply(reply);
	}

	@Override
	public Reply findByReplyNo(int replyNo) {
		return mapper.findByReplyNo(replyNo);
	}


	   
	@Override
	public Merchant findMerInfoByNo(int merNo) {
		
		return mapper.selectMerInfoByNo(merNo);
	}

	@Override
	public String findCateNameByNo(int cateNo) {
		
		return mapper.selectCateNameByNo(cateNo);
	}

	@Override
	public int saveReserve(Reserve reserve) {
		
		return mapper.saveReserve(reserve);
	}

	@Override
	public int getReplyCount(int qnaNo, int merNo) {
		return mapper.selectReplyCount(qnaNo, merNo);
	}


	public int getHobbyCountByCateNo(int cateNo) {
		
		return mapper.selectHobbyCountByCateNo(cateNo);
	}

	@Override
	public List<Hobby> getHobbyListByCateNo(PageInfo pageInfo, int cateNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.getHobbyListByCateNo(rowBounds, cateNo);
	}
	

}
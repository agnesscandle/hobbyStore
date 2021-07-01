package com.kh.mvc.hobby.model.service;

import java.io.File;
import java.io.IOException;
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
import com.kh.mvc.hobby.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HobbyServiceImpl implements HobbyService{
   
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
      int offset = (pageInfo.getCurrentPage()-1)*pageInfo.getListLimit();
      RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
      
      return mapper.selectHobbyList(rowBounds);
   }

   @Override
   public List<Hobby> getHobbySearchList(PageInfo pageInfo, String search) {
       int offset = (pageInfo.getCurrentPage()-1)*pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
         
      return  mapper.getHobbySearchList(rowBounds,search);
   }

   @Override
   @Transactional
   public int save(Hobby hobby) {
      int result = 0;
      
      if(hobby.getHbNo() !=0) {
         //업데이트
      } else {
         result= mapper.insertHobby(hobby);
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

            String fileName =  System.currentTimeMillis() + originFileName;
            
            String safeFile = savePath + fileName;

            try {
                mf.transferTo(new File(safeFile));
                
                if(renamedFileString == null) {
                   originalFileString = originFileName;
                   renamedFileString = fileName;
                }
                else {
                   originalFileString = originalFileString+","+originFileName;
                   renamedFileString = renamedFileString+","+fileName;
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
      }catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       hobby.setHbThumOri(thumOri);
        hobby.setHbThumRename(thumRename);
      
   }

	@Override
	public int getReviewCount(int hbNo) {
		
		return mapper.selectReviewCount(hbNo);
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo, int hbNo) {
		 int offset = (pageInfo.getCurrentPage()-1)*pageInfo.getListLimit();
	     RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
	     
		return mapper.selectReviewList(rowBounds, hbNo);
	}

	@Override
	public Hobby findByNo(int hbNo) {
		return mapper.selectHobbyByNo(hbNo);
	}



   

   

}
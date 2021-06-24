package com.kh.mvc.hobby.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.mapper.HobbyMapper;
import com.kh.mvc.hobby.model.vo.Hobby;

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
   public List<Hobby> getHobbyList(PageInfo pageInfo) {
      int offset = (pageInfo.getCurrentPage()-1)*pageInfo.getListLimit();
      RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
      
      return mapper.selectHobbyList(rowBounds);
   }


	@Override
	@Transactional
	public int save(Hobby hobby) {
		int result = 0;
		
		if(hobby.getHb_no() !=0) {
			//업데이트
		} else {
			result= mapper.insertHobby(hobby);
		}
		return result;
	}
	

	

}
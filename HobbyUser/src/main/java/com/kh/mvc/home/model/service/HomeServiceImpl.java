package com.kh.mvc.home.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.mapper.HobbyMapper;
import com.kh.mvc.hobby.model.service.HobbyService;
import com.kh.mvc.hobby.model.service.HobbyServiceImpl;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.home.model.mapper.HomeMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper mapper;
	
	@Override
	public int getHobbyCount() {
		return mapper.selectHobbyCount();
	}

	@Override
	public List<Hobby> getHobbyList() {
		

		return mapper.selectHobbyList();
	}

	

	@Override
	public String findCateNameByNo(int cateNo) {
		
		return mapper.selectCateNameByNo(cateNo);
	}
	



	
	
}

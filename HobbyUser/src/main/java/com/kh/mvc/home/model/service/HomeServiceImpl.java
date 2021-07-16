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
	public String findCateNameByNo(int cateNo) {
		
		return mapper.selectCateNameByNo(cateNo);
	}

	@Override
	public List<Hobby> getSHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectSHobbyList(rowBounds);
	}

	@Override
	public List<Hobby> getDHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectDHobbyList(rowBounds);
	}

	@Override
	public List<Hobby> getPHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectPHobbyList(rowBounds);
	}


	@Override
	public List<Hobby> getOpenHobbyList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectOpenHobbyList(rowBounds);
	}

	@Override
	public List<Hobby> getBestHobbyList() {
		return mapper.selectBestHobbyList();
	}
	



	
	
}

package com.kh.mvc.hobby.model.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Hobby;

public interface HobbyMapper {

	int selectHobbyCount();

	List<Hobby> selectHobbyList(RowBounds rowBounds);
	
}

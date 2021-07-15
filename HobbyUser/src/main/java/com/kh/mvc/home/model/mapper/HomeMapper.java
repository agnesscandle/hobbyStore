package com.kh.mvc.home.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

@Mapper
public interface HomeMapper {

	public int selectHobbyCount();

	public List<Category> selectCateList();

	public String selectCateNameByNo(int cateNo);

	public List<Hobby> selectHobbyList();

	public List<Hobby> selectSHobbyList(RowBounds rowBounds);

	public List<Hobby> selectDHobbyList(RowBounds rowBounds);

	public List<Hobby> selectPHobbyList(RowBounds rowBounds);

	public List<Hobby> selectOpenHobbyList(RowBounds rowBounds);

	public List<Hobby> selectBestHobbyList();
	

}

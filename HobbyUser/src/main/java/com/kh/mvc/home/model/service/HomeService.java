package com.kh.mvc.home.model.service;

import java.util.List;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

public interface HomeService {

	 int getHobbyCount();


	String findCateNameByNo(int cateNo);

	List<Hobby> getHobbyList();


}

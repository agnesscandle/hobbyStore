package com.kh.mvc.home.model.service;

import java.util.List;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;

public interface HomeService {

	int getHobbyCount();

	String findCateNameByNo(int cateNo);

	/* category가 커리어 취미 */
	List<Hobby> getSHobbyList(PageInfo pageInfo);
	
	/* 할인중인 취미 */
	List<Hobby> getDHobbyList(PageInfo pageInfo);
	
	/* 인기있는 취미 */ 
	List<Hobby> getPHobbyList(PageInfo pageInfo);
	
	/* 오픈예정 취미*/
	List<Hobby> getOpenHobbyList(PageInfo pageInfo);

	/* 베스트 취미 */
	List<Hobby> getBestHobbyList();




}

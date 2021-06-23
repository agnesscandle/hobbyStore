package com.kh.mvc.hobby.model.service;

import java.util.List;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Hobby;

public interface HobbyService {

	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo);

}

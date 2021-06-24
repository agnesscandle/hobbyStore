package com.kh.mvc.hobby.model.service;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Hobby;
import java.util.List;

public interface HobbyService {
	
	int getHobbyCount();

	List<Hobby> getHobbyList(PageInfo pageInfo);

	int save(Hobby hobby);



}

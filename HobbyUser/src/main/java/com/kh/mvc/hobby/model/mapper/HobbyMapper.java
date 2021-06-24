package com.kh.mvc.hobby.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.mvc.hobby.model.vo.Hobby;
import java.util.List;
@Mapper
public interface HobbyMapper {
	int selectHobbyCount();

	List<Hobby> selectHobbyList(RowBounds rowBounds);

	int insertHobby(Hobby hobby);

}

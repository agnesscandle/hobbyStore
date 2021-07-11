package com.kh.mvc.merchant.model.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.mvc.merchant.model.vo.MerchantMember;

@Mapper
public interface MerchantMapper {
	MerchantMember selectMerchantMember(@Param("merId") String merId);

	int insertMerchantMember(MerchantMember merchantMember);


}

package com.kh.mvc.merchant.model.service;


import com.kh.mvc.merchant.model.vo.MerchantMember;

public interface MerchantMemberService {

	MerchantMember login(String merId, String merPassword);
	
	int save(MerchantMember merchantMember);

	MerchantMember findById(String merId);

	

	boolean validate(String merid);
}

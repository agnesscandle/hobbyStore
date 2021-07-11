package com.kh.mvc.merchant.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.merchant.model.mapper.MerchantMapper;
import com.kh.mvc.merchant.model.vo.MerchantMember;

@Service
public class MerchantServiceImpl implements MerchantService{
	@Autowired
	private MerchantMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MerchantMember login(String merId, String merPassword) {
		
		
		MerchantMember merchantmember = this.findById(merId);
		
		// 암호화된 비밀번호와 맞는지 확인
		// System.out.println(passwordEncoder.matches(merPassword, merchantmember.getMerPassword()));
		
		return merchantmember != null && 
				passwordEncoder.matches(merPassword, merchantmember.getMerPassword()) ? merchantmember : null;
	}

	@Override
	@Transactional 
	public int save(MerchantMember merchantMember) {
		int result = 0;
		
		if(merchantMember.getMerNo() != 0) {
			// update
//			result = mapper.updateMember(member);
		} else {
			merchantMember.setMerPassword(passwordEncoder.encode(merchantMember.getMerPassword()));
			
			result = mapper.insertMerchantMember(merchantMember);
		}
		
		return result;
	}
	
	@Override
	public MerchantMember findById(String merId) {
       MerchantMember a = mapper.selectMerchantMember(merId);
       System.out.println(a);

		return mapper.selectMerchantMember(merId);
	}
	
	

	@Override
	public boolean validate(String merid) {
		// TODO Auto-generated method stub
		return false;
	}
	
}

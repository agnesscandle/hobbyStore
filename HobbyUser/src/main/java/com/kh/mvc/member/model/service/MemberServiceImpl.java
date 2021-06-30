package com.kh.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.member.model.mapper.MemberMapper;
import com.kh.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Member login(String memId, String memPassword) {
		
		Member member = this.findById(memId);
		
		
		return member != null && 
				passwordEncoder.matches(memPassword, member.getMemPassword()) ? member : null;
	}

	@Override
	@Transactional 
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemNo() != 0) {
			result = mapper.updateMember(member);
		} else {
			member.setMemPassword(passwordEncoder.encode(member.getMemPassword()));
			
			result = mapper.insertMember(member);
		}
		
		return result;
	}
	
	@Override
	public Member findById(String memId) {

		return mapper.selectMember(memId);
	}

	@Override
	public boolean validate(String memId) {
		
		return this.findById(memId) != null;
	}

	
	public Member findByIdAndName(String memName, String memEmail) {

		return mapper.findId(memName, memEmail);
	}


	
	
	
	
}

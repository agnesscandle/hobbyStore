package com.kh.mvc.member.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.member.model.mapper.MemberMapper;
import com.kh.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	@Autowired 
	private BCryptPasswordEncoder bcPasswordEncoder;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@Override
	public Member login(String memId, String memPassword) {
		
		Member member = this.findById(memId);
		
		
		return member != null && 
				bcPasswordEncoder.matches(memPassword, member.getMemPassword()) ? member : null;
	}

	@Override
	@Transactional 
	public int save(Member member) {
		int result = 0;
		
		if(member.getMemNo() != 0) {
			result = mapper.updateMember(member);
		} else {
			
			// 패스워드 읽어서 암호화해서 다시 저장
			member.setMemPassword(bcPasswordEncoder.encode(member.getMemPassword()));
			
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

	// 아이디 찾기
	public Member findByIdAndName(String memName, String memEmail) {

		return mapper.findId(memName, memEmail);
	}

	// 비밀번호 변경 1단계 (현재 비밀번호 확인)
	@Override
	public Member checkpw(String memId, String memPassword) {
		Member member = this.findById(memId);
		
		System.out.println("ture or false : " + bcPasswordEncoder.matches(memPassword, member.getMemPassword()));
		
		return member != null && 
				bcPasswordEncoder.matches(memPassword, member.getMemPassword()) ? member : null;
	}

	// 비밀번호 변경 2단계 (새로운 비밀번호 변경)
	@Override
	public int changePw(Member member) {
		int result = 0;
		
		if(member.getMemNo() != 0) {
			
			member.setMemPassword(bcPasswordEncoder.encode(member.getMemPassword()));
			result = mapper.updateMemPwd(member);
		}
		
		return result;
	}

	// 탈퇴 처리 
	public int delete(int memNo) {
		
			return mapper.deleteMember(memNo);
	}
	
	

	

	


	
	





	
	
	
	
}

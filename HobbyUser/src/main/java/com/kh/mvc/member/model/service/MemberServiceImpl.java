package com.kh.mvc.member.model.service;


import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.mvc.member.model.mapper.MemberMapper;
import com.kh.mvc.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	public Member findByEmail(String memEmail) {

		return mapper.searchEmail(memEmail);
	}
	

	@Override
	public boolean validate(String memId) {
		
		return this.findById(memId) != null;
	}
	
	@Override
	public boolean result(String memEmail) {
		
		return this.findByEmail(memEmail) != null;
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

	// 핸드폰 번호 인증
	@Override
	public void certifiedPhoneNumber(String memPhone, String cerNum) {
		 	String api_key = "NCSNUA19NYDFS14M"; // 개인 api key
	        String api_secret = "GKNWAFFDUOSR8YUK67XDLHAIJTAWHMDZ"; // 개인 secret api key
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", memPhone);    // 수신전화번호
	        params.put("from", "01026582644");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "취미상점 휴대폰인증 메시지 : 인증번호는" + "["+cerNum+"]" + "입니다.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }
		
	}
	
	

	

	


	
	





	
	
	
	
}

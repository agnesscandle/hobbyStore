package com.kh.mvc.member.model.service;


import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mvc.common.util.PageInfo;
import com.kh.mvc.hobby.model.vo.Category;
import com.kh.mvc.hobby.model.vo.Hobby;
import com.kh.mvc.hobby.model.vo.Liked;
import com.kh.mvc.hobby.model.vo.Reserve;
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

	// 핸드폰 인증번호 보내기
	@Override
	public void certifiedPhoneNumber(String memPhone, String cerNum) {
		 	String api_key = "NCSIXJYPZAVEE32W"; // 개인 api key
	        String api_secret = "K9BX4JP35AEEQETZJCSADKUYZEZAUWGY"; // 개인 secret api key
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", memPhone);    // 수신전화번호
	        params.put("from", "01073545288");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
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
	
	// 핸드폰 임시비밀번호 보내기
		@Override
		public void sendNewPwNumber(String memPhone, String cerNum) {
			 	String api_key = "NCSIXJYPZAVEE32W"; // 개인 api key
		        String api_secret = "K9BX4JP35AEEQETZJCSADKUYZEZAUWGY"; // 개인 secret api key
		        Message coolsms = new Message(api_key, api_secret);

		        HashMap<String, String> params = new HashMap<String, String>();
		        params.put("to", memPhone);    // 수신전화번호
		        params.put("from", "01073545288");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		        params.put("type", "SMS");
		        params.put("text", "취미상점 임시비밀번호 : " + "["+cerNum+"]" + "입니다.");
		        params.put("app_version", "test app 1.2"); // application name and version
		        
		        
		        try {
		            JSONObject obj = (JSONObject) coolsms.send(params);
		            System.out.println(obj.toString());
		        } catch (CoolsmsException e) {
		            System.out.println(e.getMessage());
		            System.out.println(e.getCode());
		        }
			
		}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
		
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/"  + renameFileName;
		
		try {
			// 업로드한 파일 데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 비밀번호 찾기 새 비밀번호로 변경
	@Override
	public int setNewPw(String memPhone, String numStr) {
		Member member = mapper.findByPhone(memPhone);
		int result = 0;
        System.out.println(member);
        
        if(member.getMemNo() != 0) {
        	member.setMemPassword(bcPasswordEncoder.encode(numStr));
        	result= mapper.updateMemPwd(member);
        }
		
		return result;
	}

	/* 카테고리 */
	@Override
	public List<Category> getCateList() {
		return mapper.selectCateList();
	}

	/* 좋아요 */
	@Override
	public List<Liked> getLikedList() {
		return mapper.selectLikedList();
	}
	
	/* 취미 */
	@Override
	public List<Hobby> getHobbyLikedList(int memNo, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectHobbyLikedList(memNo, rowBounds);
	}

	@Override
	public int getHobbyCount() {
		return mapper.selectHobbyCount();
	}

	

	/* 예약 */
	@Override
	public List<Reserve> getRsList() {
		return mapper.selectRsList();
	}

	@Override
	public List<Hobby> getHobbyRsList(int memNo, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectHobbyRsList(memNo, rowBounds);
	}

	@Override
	public Reserve findReserveByNo(int memNo, int hbNo) {
		return mapper.selectRsByNo(memNo, hbNo);
	}
		
		
	
	

	

	


	
	





	
	
	
	
}

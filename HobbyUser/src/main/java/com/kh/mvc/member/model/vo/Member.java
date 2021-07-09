package com.kh.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int memNo;
	
	private String memId;
	
	private String memPassword;
	
	private String memEmail;
	
	private String memName;
	
	private String memPhone;
	
	private String status;
	
	private String memImgOriginal;
	
	private String memImgRename;
	
	private Date memDate;
	
	private int cateNo;
	
	
}

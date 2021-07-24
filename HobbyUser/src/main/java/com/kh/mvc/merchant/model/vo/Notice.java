package com.kh.mvc.merchant.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeNum;
	
	private String noticeTitle;
	
	private int adminNo;
	
	private String adminId;
	
	private String noticeCont;
	
	private int noticeReadCount;

}

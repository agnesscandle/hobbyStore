package com.kh.mvc.hobby.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reserve {
	private int resNo;
	
	private int hbNo;
	
	private int memNo;
	
	private String merNo;
	
	private String memId;
	
	private String resName;
	
	private String resPhone;
	
	private int resCount;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	/* @DateTimeFormat(pattern = "yyyy-MM-dd") */
	private Date resDate;
	
	/* @DateTimeFormat(pattern = "yyyy-MM-dd") */
	private String takeDate;
	
	private String payFee;
	
	private String resAttend;
	
	private String resStatus;
	
	private String calStatus;
	
	private String calFinish;

	
	
}

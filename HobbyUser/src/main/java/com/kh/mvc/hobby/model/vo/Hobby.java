package com.kh.mvc.hobby.model.vo;


import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hobby {
	private int hbNo;
	
	private int merNo;

	private int cateNo;
	
	private String cateName;
	
	private String hbTitle;
	
	private String hbSummary;
	
	private String hbFee;
	
	private String hbDiscountRate;
	
	private String hbDiscountStatus;	

	/* @DateTimeFormat(pattern = "yyyy-MM-dd") */
	private Date hbStartDate;
	
	/* @DateTimeFormat(pattern = "yyyy-MM-dd") */
	private Date hbEndDate;

	private String hbImgsOri;
	
	private String hbImgsRename;
	
	private String hbThumOri;
	
	private String hbThumRename;
	
	private String hbInfo;
	
	private String hbLocation;
	
	private String status;
}

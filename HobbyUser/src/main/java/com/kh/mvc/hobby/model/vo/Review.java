package com.kh.mvc.hobby.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	
	private int rvNo;
	
	private int hbNo;
	
	private int memNo;
	
	private String memName;
	
	private String memImgRename;
	
	private int rvScore;
	
	private String rvContent;
	
	private Date rvCreateDate;
	
	private Date rvModifyDate;
	
	private int goodReview;
	
	private String rvOriginalFilename;
	
	private String rvRenameFilename;
	
	private String status;

}

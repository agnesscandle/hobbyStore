package com.kh.mvc.hobby.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hobby{
	private int hb_no;
	private int mer_no;
	private int cate_no;
	private String hb_title;
	private String hb_summary;
	private Date hb_startdate;
	private Date hb_enddate;
	private String url;
	private String hb_thum_url;
	private String hb_thum_name;
	private String hb_info;
	private String hb_location;
	private String status;
}

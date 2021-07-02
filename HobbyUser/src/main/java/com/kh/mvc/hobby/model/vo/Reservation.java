package com.kh.mvc.hobby.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {

	private int payNo;
	
	private int hbNo;
	   
	private int merNo;
	
	private int payFee;
	
	private Date resDate;
	
	private String resCalander;
	
	private String resAttend;
	
	private Date payDate;
}

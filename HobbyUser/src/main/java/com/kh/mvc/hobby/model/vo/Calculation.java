package com.kh.mvc.hobby.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Calculation {

	int calNo;
	
	String status;
	
	int payNo;
	
	int merNo;
	
	String calFinish;
}

package com.kh.mvc.hobby.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {

   private int rpNo;
   
   private int hbNo;
   
   private int rpWriterNo;
   
   private String rpWriterId;
   
   private String rpTitle;
   
   private String rpContent;
   
   /* @DateTimeFormat(pattern = "yyyy-MM-dd") */
   private Date rpDate;
   
   private String status;
}
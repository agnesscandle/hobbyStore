package com.kh.mvc.merchant.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Merchant {
   private int merNo;
   
   private String merId;
   
   private String merPassword;
   
   private String merEmail;
   
   private String merName;
   
   private String merPhone;
   
   private Date merDate;
   
   private String Bank;
   
   private String merNick;
   
   private String status;
   
   private String merImgOriginal;
   
   private String merImgRename;
   
   private String merIDCARD;
   
   private int cateNo;
   
   private String greeting;
   

   
}
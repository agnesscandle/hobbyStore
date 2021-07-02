package com.kh.mvc.hobby.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Liked {
   
   private int likedNo;
   
   private int hbNo;
   
   private int memNo;
   
   private String likedStatus;
}
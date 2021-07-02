package com.kh.mvc.hobby.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
   private int replyNo;
   
   private int qnaNo;
   
   private int merNo;
   
   private String replyContent;
   
   private Date replayDate;

}
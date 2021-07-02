package com.kh.mvc.hobby.model.vo;

import java.sql.Date;
import java.util.List;

import com.kh.mvc.hobby.model.vo.Hobby;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
   
   private int qnaNo;
   
   private int hbNo;
   
   private int memNo;
   
   private String qnaTitle;
   
   private String qnaContent;
   
   private String status;
   
   private Date qnaDate;
   
   private List<Reply> reply;
   
   private String qnaSecure;

}
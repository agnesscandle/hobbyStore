<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/headerWithoutNav.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/merchantMember_css/enroll2.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<span class="merEnroll_t">상인 회원가입</span>
<div class="divEnroll">
   <div class="ul">
      <ul class="gnb">
         <li class="step step-1 active"><span>Step 1</span></li>
         <li class="step step-2"><span>Step 2</span></li>
         <li class="step step-3"><span>Step 3</span></li>
      </ul>
   </div>


	
   <form name="memberEnrollFrm" action="${ path }/merchant/enroll" method="POST"
      enctype="multipart/form-data">

      <div class="enroll enroll-1 active">
         <section>
            <div class="title">
            	<span>이름</span> 
            	<input class="enrollInput req" type="text" id="merName" name="merName" placeholder="홍길동" required="required" />
				<div class="name regex"></div>
				
               <span>아이디</span> 
               <input type="text" class="enrollInput req" id="merId" name="merId" placeholder="hobbystore7777" required="required"> 
               <div class="id_validate"></div>
				<span class="id_input_re_1"></span>
				<span class="id_input_re_2"></span>
				<div class="duplicate regex"></div>
				
               <span>비밀번호</span>
               <input class="enrollInput req" type="password" id="merPassword" name="merPassword" placeholder="Password" required="required"/>
               <div class="p-alert pw-success" id="pw-success"></div>
   				<div class="p-alert pw-success"id="pw-danger"></div>
              
               <span>비밀번호 확인</span>
               <input class="enrollInput req" type="password" id="merPassword2" required="required"/>
               <div class="alert alert-success" id="alert-success"></div>
   				<div class="alert alert-danger" id="alert-danger"></div>
                 
                 <span>전화번호</span>   
                 <input class="enrollInput req" type="text" name="merPhone" id="merPhone" placeholder="ex) 01012345678" required="required"> 
               	 <div class="phone_input_re_1"></div>
				<div class="phone_input_re_2"></div>
        		<div class="phone regex"></div>
        		
        		<span>이메일</span>  
        		 <input class="enrollInput req" type="text" name="merEmail" id="merEmail" placeholder="hobbyuser@market.com" required="required">
			       <div class="email_input_re_1"></div>
				   <div class="email_input_re_2"></div>
			       <div class="email regex"></div>
        		
                

               <div class="btn">

                  <!-- <button>이전으로</button> -->
                  <input type="button" class="next" value="다음으로" />

               </div>
            </div>
            
         </section>
      </div>
      <div class="enroll enroll-2">
         <section>
            <div class="title">
            	<h2>계좌 정보</h2><br>
            		
                  <span>입금 계좌</span>
			       <select id="bank" name="bank" class="req">
                         <option value="" selected> 은행명 </option>       
                         <option value="국민">국민</option>
                         <option value="농협">농협</option>
                         <option value="신한">신한</option>
                         <option value="우리">우리</option>
                         <option value="하나">하나</option>
                         <option value="기업">기업</option>
                         <option value="제일">제일</option>
                         <option value="씨티">씨티</option>
                         <option value="수협">수협</option>
                         <option value="카카오">카카오</option>
                    </select>
                    

               <span>계좌 번호</span>
		        <input class="enrollInput req" type="text" name="bankNumber" id="bankNumber" placeholder="(-)없이 숫자만 입력하세요."  required="required">
		        <div class="bankNumber regex"></div>


               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> <input
                     type="button" class="next" value="다음으로" />
               </div>
            </div>
         </section>
      </div>
      <div class="enroll enroll-3">
         <section>
            <div class="title">
            
            <div class=" profile-wrapper preview-image">
			<input type="file" id="my-profile" class="my-file" name="upfile"/>
			<label class="my-file-button" for="my-profile"></label>
			<input type="file" id="input-file" name="input-file" class="upload-hidden">
			</div>
            
               <span>닉네임</span> 
       			 <input class="enrollInput req" type="text" name="merNick" id="merNick" placeholder="요리천재39" required="required">
       			 <div class="bank regex"></div>
       			 
       			<span>간단한 소개</span> 
       			<div>
       			<textarea class="enrollArea req" name="greeting" id="greeting" placeholder="간단한 소개를 작성해주세요 :)" ></textarea>
       			 </div>
       			 
               <span>카테고리</span> 
               <select id="cateNo" name="cateNo" class="req">
                         <option value="" selected> 카테고리 </option>       
                          <c:forEach var="category" items="${ list }">
                         <option value="${ category.cateNo }">
                         <c:out value="${ category.cateName }"/>
                         </option>
                         </c:forEach>
                    </select>
				
				
				<script>
                   $(document).ready(function(){
                  $("#cateNo").change(function(){
                     var a = $(this).val();
                  });
                      
                    });
                
                </script>
                
               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> 
                  <input type="submit" class="next" value="가입하기" />
               </div>
            </div>
            
         </section>
      </div>
         </form>
         
         
      
               

             
   

<script>


/* 다음으로 버튼 클릭 시 각 section 항목들이 다 작성되어있는지 검사 */
var seq = 1;
$('.next').click(function(){
   
   var is_empty = false;
   $('.enroll-'+seq).find('.req').each(function(){
          if(!$(this).val()) {
              is_empty = true;
          }
   });
   if(is_empty) {
       alert('값을 전부 입력해주십시오.');
       return;
   }
   if($("input:checkbox[id='hbDiscountStatus']").is(":checked") == true ){
      $('#disStat').find('.reqDisRate').each(function(){
          if(!$(this).val()) {
              is_empty = true;
          }
      });
      if(is_empty) {
          alert('값을 전부 입력해주십시오.');
          return;
      }
   }

   seq = seq +1;
    $('.step').siblings('.step').removeClass('active')
    $('.step-'+seq).addClass('active')
    $('.enroll').siblings('.enroll').removeClass('active')
    $('.enroll-'+seq).addClass('active')
    
  });
 $('.before').click(function(){
   seq = seq -1;
    $('.step').siblings('.step').removeClass('active')
    $('.step-'+seq).addClass('active')
    $('.enroll').siblings('.enroll').removeClass('active')
    $('.enroll-'+seq).addClass('active')
  });
 
 
 /* 등록하기 버튼 클릭 시 마지막 section 항목들이 다 작성되어있는지 검사 */
 $('.register').click(function(){
    var is_empty = false;
      $('.enroll-5').find('.req').each(function(){
             if(!$(this).val()) {
                 is_empty = true;
             }
      });
      if(is_empty) {
          alert('값을 전부 입력해주십시오.');
          return;
      }else{
         $('#enrollForm').submit();
      }
 });
 
  
  
 /* 썸네일 이미지 파일 미리보기 */


var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();

    if(window.FileReader){
         //image 파일만
         if (!$(this)[0].files[0].type.match(/image\//)) return;

         var reader = new FileReader();
         reader.onload = function(e){
              var src = e.target.result;
              parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
         }
         reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

         var img = $(this).siblings('.upload-display').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});

//이름 유효성 검사
$("#merName").on("input",function(){
    var regex = /[가-힣]{2,}/;
    var result = regex.exec($("#merName").val());
    
    if(result != null){
       $(".name.regex").html("");  
    }else{
        $(".name.regex").html("한글만 입력 가능합니다.");
    }
    
});

//아이디 유효성 검사
$("#merId").on("input",function(){
          var regex = /^[a-zA-Z0-9]{6,12}$/;
          var result = regex.exec($("#merId").val())
          
          if(result != null){
              $(".id_validate").html("");
          }else{
              $(".id_validate").html("영어 대소문자,숫자 6-12자리");
              $(".id_validate").css("color","red")
          }
      });
      
//비밀번호 유효성 검사
$(function() {
	$("#pw-success").hide();
	$("#pw-danger").hide();
	
	$("input").keyup(function() {
		var pw = $("#merPassword").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(pw.length == ""){
			$("#pw-danger").show();
			$("#pw-success").hide();
			$("#pw-danger").html("");
		} else if(pw.length < 4 || pw.length > 20) {
			$("#pw-danger").show();
			$("#pw-success").hide();
			$("#pw-danger").html("10자리 ~ 20자리 이내로 입력해주세요.").css("color","red");
		} else if(pw.search(/\s/) != -1){
			 $("#pw-danger").show();
			 $("#pw-success").hide();
			 $("#pw-danger").html("비밀번호는 공백 없이 입력해주세요.");
		} else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			$("#pw-danger").show(); 
			$("#pw-success").hide();
			$("#pw-danger").html("영문,숫자,특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		} else {
			 $("#pw-success").show();
			 $("#pw-danger").hide();
			 $("#pw-success").html("사용가능한 비밀번호입니다.").css("color","blue");	 
		}
	});
}); 

//비밀번호 일치 확인
$(function() {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		var merPassword = $("#merPassword").val();
		var merPassword2 = $("#merPassword2").val();
		if (merPassword != "" || merPassword2 != "") {
			if (merPassword == merPassword2) {
				$("#alert-success").show();
				$("#alert-success").html("비밀번호가 일치합니다.").css("color","blue");
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#alert-danger").html("비밀번호가 일치하지 않습니다.").css("color","red");	
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});

//전화번호 유효성검사
$("#merPhone").on("input",function(){
     var regex = /^01\d\d{3,4}\d{4}$/;
     var result = regex.exec($("#merPhone").val());
    
    if(result != null){
       $(".phone.regex").html("");  
    } 
    else{
        $(".phone.regex").html("올바른 번호가 아닙니다");
    }
    
});

//email 유효성 검사
$("#merEmail").on("input",function(){
     var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     var result = regex.exec($("#merEmail").val());
     var merEmail = $("#merEmail").val();
    if(result != null){
       $(".email.regex").html("");  
    		
    }else{
    	if(merEmail != ""){
        $(".email.regex").html("올바른 이메일이 아닙니다");
    	}
    }
});

//아이디 중복검사
$('#merId').on("propertychange change keyup paste input", function(){
   var merId = $("#merId").val();  
   
   if(merId.length < 6){
	   $(".id_validate").html("아이디는 최소 6글자 이상 입력하세요.");
		
		return;
	}
   
   $.ajax({
      type : "get",
      url : "${path}/merchant/idChk",
      dataType : "json",
      data: {
    	  merId
      },
      success : function(data){
    	  $('.id_input_re_2').hide();
    	  $('.id_input_re_1').hide();
    	  
    	  
    	   if(data.validate === true) {
        	  $('.id_input_re_2').show();
        	  $('.id_input_re_1').hide();
        	  $('.id_input_re_2').html("아이디가 이미 존재합니다.").css("display","inline-block");
        	  $('.id_input_re_1').css("display", "none");
            } else {
          	  $('.id_input_re_1').show();
        	  $('.id_input_re_2').hide();
        	  $('.id_input_re_1').html("사용 가능한 아이디입니다.").css("display","inline-block");
			  $('.id_input_re_2').css("display", "none");
            }
      },
      error: function(e){
         console.log(e);
      }
   }); 
});

// 이메일 중복 검사
$('#merEmail').on("input", function(){
	var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var result = regex.exec($("#merEmail").val());
	var merEmail = $("#merEmail").val(); 
	   
	  
	
	$.ajax({
	      type : "get",
	      url : "${path}/merchant/emailChk",
	      dataType : "json",
	      data: {
	    	  merEmail
	      },
	      success : function(data){
	    	  $('.email_input_re_2').hide();
	    	  $('.email_input_re_1').hide();
	    	  
	    	   if(data.result === true) {
	        	  $('.email_input_re_2').show();
	        	  $('.email_input_re_1').hide();
	        	  $('.email_input_re_2').html("이미 존재하는 이메일입니다.").css("display","inline-block");
	        	  $('.email_input_re_1').css("display", "none");
	            } else{
	            	if(merEmail == ""){
	            		$('.email_input_re_1').hide();
	          	  		$('.email_input_re_1').css("display", "none");
	            	} else{
	          		$('.email_input_re_2').hide();
				 		 $('.email_input_re_2').css("display", "none");
	            	}
	        	  
	            }
	      },
	      error: function(e){
	         console.log(e);
	      }
	   }); 
});
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/enroll.css">

<section class="memEnrollWrapper">
<form name="memberEnrollFrm" id="signform"
	action="${ path }/member/enroll" method="POST">
		<div class="memEnrollTitle">회원 가입</div>

		<!-- 이름 -->
		<label class="memEnrollLabel">이름</label><br> 
		<input class="enrollInput" type="text" id="memName" name="memName" placeholder="홍길동" required="required" />
		<div class="name regex"></div>

		<!-- 아이디 -->
		<label class="memEnrollLabel">아이디</label><br>
		<input class="enrollInput" type="text" class="" id="memId" name="memId" placeholder="hobbystore7777" required="required"> 
		<div class="id_validate"></div>
		<span class="id_input_re_1"></span>
		<span class="id_input_re_2"></span>
		<div class="duplicate regex"></div>
		
		<!-- 비밀번호 -->
        <label class="memEnrollLabel">비밀번호</label><br>
        <input class="enrollInput" type="password" id="memPassword" name="memPassword" placeholder="Password" required="required"/>
   		<div class="p-alert pw-success" id="pw-success"></div>
   		<div class="p-alert pw-success"id="pw-danger"></div>
   		
   		<!-- 비밀번호 확인 -->
        <label class="memEnrollLabel">비밀번호 확인</label><br>
        <input class="enrollInput" type="password" id="memPassword2" required="required"/>
   		<div class="repw regex"></div>
   		
   		<div class="alert alert-success" id="alert-success"></div>
   		<div class="alert alert-danger" id="alert-danger"></div>
   		<!-- 전화번호 -->
   		<label class="memEnrollLabel">전화번호</label><br>
        <input class="enrollInput" type="text" name="memPhone" id="memPhone" placeholder="ex) 01012345678" required="required">
        <div class="phone regex"></div>
        
   		<!-- 이메일 -->
   		<label class="memEnrollLabel">이메일</label><br>
        <input class="enrollInput" type="text" name="memEmail" id="memEmail" placeholder="hobbyuser@market.com" required="required">
        <div class="email regex"></div>
        
   		<!-- 관심분야 -->
   		<label class="memEnrollLabel">관심 분야 체크</label><label> (관심 분야를 1개 이상 체크해주세요.)</label><br>
   		
   		<input  type="checkbox" name="hobby" value="여행"/>여행
        <input  type="checkbox" name="hobby" value="액티비티"/>액티비티
        <input  type="checkbox" name="hobby" value="공예(DIY)"/>공예(DIY)
        <input  type="checkbox" name="hobby" value="음악"/>음악
        <input  type="checkbox" name="hobby" value="미술"/>미술<br>
        <input  type="checkbox" name="hobby" value="커리어"/>커리어
        <input  type="checkbox" name="hobby" value="사진"/>사진
        <input  type="checkbox" name="hobby" value="요리"/>요리
        <input  type="checkbox" name="hobby" value="반려동물"/>반려동물
        <input  type="checkbox" name="hobby" value="건강"/>건강<br>
        <input  type="checkbox" name="hobby" value="뷰티"/>뷰티
        <input  type="checkbox" name="hobby" value="모임"/>모임
        <input  type="checkbox" name="hobby" value="키즈"/>키즈
	
	<br><br><br>
	<hr>
	<br><br>
	<div class="agree_wrap">
		<input type="checkbox" id="memAgree" name="memAgree" class="agree_chk">
		<label for="memAgree">이용 약관 및 개인정보 수집 및 이용에 대한 내용을 확인하였고 동의합니다.</label>
	</div>
	
	<!-- 회원가입 버튼 -->
	<div id="mSignup">
      <br><input class="enrollInput" type="submit" id="enrollSubmit" value="가입하기"/>
      <br><input class="enrollInput" type="submit" id="kakaoSubmit" value="카카오로 가입하기" style="background-image:url('${path}/images/kakaosymbol.png')"/>
   </div>
</form>

<form name="checkIdForm">
   <input type="hidden" name="userId" id="checkid">
</form>
</section>

<script>

//이름 유효성 검사
$("#memName").on("input",function(){
    var regex = /[가-힣]{2,}/;
    var result = regex.exec($("#memName").val());
    
    if(result != null){
       $(".name.regex").html("");  
    }else{
        $(".name.regex").html("한글만 입력 가능합니다.");
    }
    
});

// 아이디 유효성 검사
 $("#memId").on("input",function(){
           var regex = /^[a-zA-Z0-9]{6,12}$/;
           var result = regex.exec($("#memId").val())
           
           if(result != null){
               $(".id_validate").html("");
           }else{
               $(".id_validate").html("영어 대소문자,숫자 6-12자리");
               $(".id_validate").css("color","red")
           }
       });

//아이디 중복검사
$('.enrollInput').on("propertychange change keyup paste input", function(){

   var memId = $("#memId").val();  
   
   if(memId.length < 6){
	   $(".id_validate").html("아이디는 최소 6글자 이상 입력하세요.");
		
		return;
	}
   
   
   
   $.ajax({
      type : "get",
      url : "${path}/member/memberIdChk",
      dataType : "json",
      data: {
         memId
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

//비밀번호 유효성 검사
 $(function() {
	$("#pw-success").hide();
	$("#pw-danger").hide();
	
	$("input").keyup(function() {
		var pw = $("#memPassword").val();
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
			$("#pw-danger").html("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
		} else {
			 $("#pw-success").show();
			 $("#pw-danger").hide();
			 $("#pw-success").html("사용가능한 비밀번호입니다.").css("color","blue");	 
		}
	});
});


// 비밀번호 일치 확인
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var memPassword = $("#memPassword").val();
			var memPassword2 = $("#memPassword2").val();
			if (memPassword != "" || memPassword2 != "") {
				if (memPassword == memPassword2) {
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
    $("#memPhone").on("input",function(){
         var regex = /^01\d\d{3,4}\d{4}$/;
         var result = regex.exec($("#memPhone").val());
        
        if(result != null){
           $(".phone.regex").html("");  
        } 
        else{
            $(".phone.regex").html("올바른 번호가 아닙니다");
        }
        
    });
	
	//email유효성 검사
    $("#memEmail").on("input",function(){
         var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         var result = regex.exec($("#memEmail").val());
        
        if(result != null){
           $(".email.regex").html("");  
        }else{
            $(".email.regex").html("올바른 이메일이 아닙니다");
        }
    });
	
  
</script>


<%@ include file="../../views/common/footer.jsp"%>
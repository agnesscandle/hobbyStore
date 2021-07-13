<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/css/merchantMember_css/enroll.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>상인 회원 가입</h2>
	
	<div class="memEnrollWrapper">
		<form name="memberEnrollFrm" action="${ path }/merchantMember/enroll" method="POST">
		<div class="memEnrollTitle">상인 회원 가입</div>
			<table>
				<!-- 아이디 -->
		<label class="memEnrollLabel">아이디</label><br>
		<input class="enrollInput" type="text" class="" id="merId" name="merId" placeholder="hobbystore7777" required="required"> 
		<div class="id_validate"></div>
		<span class="id_input_re_1"></span>
		<span class="id_input_re_2"></span>
		<div class="duplicate regex"></div>
				
			
			<!-- 비밀번호 -->
        <label class="memEnrollLabel">비밀번호</label><br>
        <input class="enrollInput" type="password" id="merPassword" name="merPassword" placeholder="Password" required="required"/>
   		<div class="p-alert pw-success" id="pw-success"></div>
   		<div class="p-alert pw-success"id="pw-danger"></div>
   		
   		<!-- 비밀번호 확인 -->
        <label class="memEnrollLabel pwCheck">비밀번호 확인</label><br>
        <input class="enrollInput" type="password" id="merPassword2" required="required"/>
   		
   		<div class="alert alert-success" id="alert-success"></div>
   		<div class="alert alert-danger" id="alert-danger"></div>
			
			
			
		<!-- 이름 -->
		<label class="memEnrollLabel">이름</label><br> 
		<input class="enrollInput" type="text" id="merName" name="merName" placeholder="홍길동" required="required" />
		<div class="name regex"></div>
				
				
		<!-- 전화번호 -->
   		<label class="memEnrollLabel">전화번호</label><br>
        <input class="enrollInput" type="text" name="merPhone" id="merPhone" placeholder="ex) 01012345678" required="required">
        <div class="phone_input_re_1"></div>
		<div class="phone_input_re_2"></div>
        <div class="phone regex"></div>
        		
		
		<!-- 이메일 -->
   		<label class="memEnrollLabel">이메일</label><br>
        <input class="enrollInput" type="text" name="merEmail" id="merEmail" placeholder="hobbyuser@market.com" required="required">
        <div class="email_input_re_1"></div>
		<div class="email_input_re_2"></div>
        <div class="email regex"></div>
		
		
		<!-- 은행명 -->
   		<label class="memEnrollLabel">은행명</label><br>
        <input class="enrollInput" type="text" name="bank" id="bank" placeholder="한국은행" required="required">
        <div class="bank regex"></div>
        
        
		<!-- 계좌번호 -->
   		<label class="memEnrollLabel">계좌번호</label><br>
        <input class="enrollInput" type="text" name="bankNumber" id="bankNumber" placeholder="ex) 1111-1234-1234"  required="required">
        <div class="bankNumber regex"></div>
		
		<!-- 닉네임 -->
   		<label class="memEnrollLabel">닉네임</label><br>
        <input class="enrollInput" type="text" name="merNick" id="merNick" placeholder="요리천재39" required="required">
        <div class="bank regex"></div>
		
		<!-- 간단한 소개 -->
   		<label class="memEnrollLabel">간단한 소개말</label><br>
        <input class="enrollInput" type="text" name="greeting" id="greeting" placeholder="ex) 요리천재입니다. 쉽고 빠른 요리 배워요." required="required">
        <div class="bank regex"></div>
		
				
		    <div class="col-md-4">
		     <label for="inputState" name= cateNo class="memEnrollLabel">관심분야</label>
		     <select id="enrollSubmit" name= cateNo class="memEnrollLabel">
		      <option selected value="1">Choose...</option>
		      <option value="1">여행</option>
		      <option value="2">액티비티</option>
		      <option value="3">공예</option>
		      <option value="4">음악</option>
		      <option value="5">미술</option>
		      <option value="6">커리어</option>
		      <option value="7">사진</option>
		      <option value="8">요리</option>
		      <option value="9">반려동물</option>
		      <option value="10">건강</option>
		      <option value="11">뷰티</option>
		      <option value="12">모임</option>
		      <option value="13">키즈</option>
		    </select>
		    </div>
        
			</table>
			
			<div class="agree_wrap">
		<input type="checkbox" id="memAgree" name="memAgree" class="agree_chk">
		<a href="${path}/merchant/registerPage_1" class="registerPage">이용약관</a>,
		<a href="${path}/merchant/registerPage_2" class="registerPage">개인정보 수집 및 이용</a>
		<a href="${path}/merchant/registerPage_3"class="registerPage">개인정보 제공</a> 내용을 확인하였고 동의합니다.
	</div>
	
	<!-- 회원가입 버튼 -->
	<div id="mSignup">
		<button class="enrollInput subTitle" type="submit" id="enrollSubmit">동의하고 가입하기</button>
	
   </div>
			
		</form>
	</div>

<script>

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

// 아이디 유효성 검사
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

//아이디 중복검사
$('#merId').on("propertychange change keyup paste input", function(){

   var memId = $("#merId").val();  
   
   if(memId.length < 6){
	   $(".id_validate").html("아이디는 최소 6글자 이상 입력하세요.");
		
		return;
	}
   
   $.ajax({
      type : "get",
      url : "${path}/merchantMember/merrmemberIdChk",
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

// 비밀번호 유효성 검사
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
			$("#pw-danger").html("영문,숫자,특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
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
	
	// 전화번호 유효성검사
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
	
	//email 유효성 검사
    $("#memEmail").on("input",function(){
         var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         var result = regex.exec($("#memEmail").val());
         var memEmail = $("#memEmail").val();
        if(result != null){
           $(".email.regex").html("");  
        		
        }else{
        	if(memEmail != ""){
            $(".email.regex").html("올바른 이메일이 아닙니다");
        	}
        }
    });
	
 // 이메일 중복 검사
    $('#memEmail').on("input", function(){
    	var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var result = regex.exec($("#memEmail").val());
    	var memEmail = $("#memEmail").val(); 
    	   
    	  
    	
    	$.ajax({
    	      type : "get",
    	      url : "${path}/member/memberEmailChk",
    	      dataType : "json",
    	      data: {
    	         memEmail
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
    	            	if(memEmail == ""){
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
 
   // 약관동의 체크 했는지 검사
   $("#enrollSubmit").click(function(){
	  if($("input:checkbox[name='memAgree']").is(":checked")==false){
		  alert('약관에 동의해주세요.');
		  return false;
	  } else{
		  return true;
	  }
   });
   
   $("#enrollSubmit").click(function(){
	   if($("select:select[name='cateNo']").is(":selected")==false){
			  alert('1개 이상의 관심분야를 선택하세요.');
			  return false;
		  } else{
			  return true;
		  }
   });
   
</script>

	
</body>
</html>
<%@ include file="../../views/common/footer.jsp"%>
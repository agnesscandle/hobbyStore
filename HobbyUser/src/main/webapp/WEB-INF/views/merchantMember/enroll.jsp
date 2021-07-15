<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>상인 회원 가입</h2>
	
	<div id="enroll-container">
		<form name="memberEnrollFrm" action="${ path }/merchantMember/enroll" method="POST">
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="merId" id="merId" placeholder="아이디(4글자이상)" required />
						<input type="button" id="checkDuplicate" value="중복검사" />
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="merPassword" id="merPassword" required /> 
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password" id="pass2"/> 
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="merName" required />
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td>
						<input type="tel" name="merPhone" maxlength="11" placeholder="(-없이)01012345678">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="merEmail" placeholder="abc@abc.com" />
					</td>
				</tr>
				<tr>
					<th>은행명</th>
					<td>
						<input type="text" name="bank" />
					</td>
				</tr>
					<tr>
					<th>계좌 번호</th>
					<td>
						<input type="text" name="bankNumber" />
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="merNick" />
					</td>
				</tr>
				<th>자기소개</th>
					<td>
						<input type="text" name="greeting" />
					</td>
				<tr>
					<th>취미</th>
					<td>

						<label><input type="checkbox" name="hobby" value="액티비티"/>액티비티</label>
						<label><input type="checkbox" name="hobby" value="등산"/>등산</label>
						<label><input type="checkbox" name="hobby" value="독서"/>독서</label>
						<label><input type="checkbox" name="hobby" value="게임"/>게임</label>
						<label><input type="checkbox" name="hobby" value="여행"/>여행</label>
					</td>
				</tr>
			</table>
			
			<input type="submit" id="enrollSubmit" value="가입"/>
			<input type="reset" value="취소"/>
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
	   if($("input:checkbox[name='cateNo']").is(":checked")==false){
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
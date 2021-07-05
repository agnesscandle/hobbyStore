<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
.changePwPage {
	padding: 7% 33% 8% 33%;
}

.mPw_Change_Title {
	text-align: left;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 10px 0px;
}

.mPw_Change_step {
	margin-bottom: 5%;;
	font-size: 22px;
	font-weight: bold;
}

.newPw_btn, .pwChangeInput {
	font-size: 15px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 8px;
    border: 1px solid rgb(239, 239, 239);
    background-color: white;
    height: 48px;
    flex: 1 1 auto;
    width: 100%;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 16px;
    border-radius: 3px;
}

.newPw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.labelMPw {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.change_box{
	margin-bottom: 3%;
}
</style>

<div class="changePwPage">
<form id="mChangePwFrm_2" action="${ path }/member/changePw2" method="POST">
<div class="mPw_Change_Title">비밀번호 변경</div>
<div class="mPw_Change_step">step 2) 새로운 비밀번호를 입력하세요.</div>

<div class="change_box">
	<input type="hidden" name="memId" value="${ loginMember.memId }" readonly/>
	<label class="labelMPw">새 비밀번호</label><br>
	<input type="password" class="pwChangeInput newPw" id="memPassword" name="memPassword" required />
	<div id="pw-success"></div>
	<div id="pw-danger"></div>
</div>

<div class="change_box">
	<label class="labelMPw">새 비밀번호 확인</label><br>
	<input type="password" class="pwChangeInput newPw" id="memPassword2" required />
		<div id="alert-success"></div>
		<div id="alert-danger"></div>
</div>
		
<p>
	<input type="submit" class="newPw_btn" id="newPwUpdate" value="비밀번호 변경" />
</p>

</form>
</div>


<script>
$("#memPassword").on("input",function(){
	$("#pw-success").hide();
	$("#pw-danger").hide();
	
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

$("#memPassword2").on("input",function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();

	var memPassword = $("#memPassword").val();
	var memPassword2 = $("#memPassword2").val();
	
	if (memPassword != "" || memPassword2 != "") {
		if (memPassword == memPassword2) {
			$("#alert-success").show();
			$("#alert-success").html("비밀번호가 일치합니다.").css("color","blue");
			$("#alert-danger").hide();
			$("#newPwUpdate").removeAttr("disabled");
		} else {
			$("#alert-success").hide();
			$("#alert-danger").show();
			$("#alert-danger").html("비밀번호가 일치하지 않습니다.").css("color","red");	
			$("#newPwUpdate").attr("disabled", "disabled");
		}
	}
});
</script>


	<%@ include file="../../views/common/footer.jsp"%>

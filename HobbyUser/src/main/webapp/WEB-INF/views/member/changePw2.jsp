<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}
</style>
<contents>
<form id="memberFrm" action="${ path }/member/changePw2" method="POST">
<h2>비밀번호 변경</h2>
<br>
<div>step 2/ 새로운 비밀번호를 입력하세요.</div>
<br>
<table>
	<tr class="hide">
		<td><input type="hidden" name="memId" value="${ loginMember.memId }" readonly/></td>
	</tr>
	<tr>
		<th>새 비밀번호</th>
		<td><input type="password" class="newPw" id="memPassword" name="memPassword" required /></td>
		<td><div id="pw-success"></div><td>
		<td><div id="pw-danger"></div><td>
	</tr>
	<tr>
		<th>새 비밀번호 확인</th>
		<td><input type="password" class="newPw" id="memPassword2" required /></td>
		<td><div id="alert-success"></div><td>
		<td><div id="alert-danger"></div><td>
	</tr>
	<tr>
		<td><input type="submit" id="newPwUpdate" value="비밀번호 변경" /></td>
	</tr>
</table>

	
</form>
</contents>


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


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>

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
		<input class="enrollInput" type="button" id="checkDuplicate" value="중복검사" />
		<div class="id regex"></div>
		<div class="duplicate regex"></div>
		
		<!-- 비밀번호 -->
        <label class="memEnrollLabel">비밀번호</label><br>
        <input class="enrollInput" type="password" id="memPassword" name="memPassword" placeholder="Password" required="required"/>
   		<div class="pw regex"></div>
   		
   		<!-- 비밀번호 확인 -->
        <label class="memEnrollLabel">비밀번호 확인</label><br>
        <input class="enrollInput" type="password" id="memPassword2" required="required"/>
   		<div class="repw regex"></div>
   		
   		<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
   		<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다. </div>
   		<!-- 전화번호 -->
   		<label class="memEnrollLabel">전화번호</label><br>
        <input class="enrollInput" type="text" name="memPhone" id="memPhone" placeholder="ex) 01012345678" required="required">
        <div class="phone regex"></div>
        
   		<!-- 이메일 -->
   		<label class="memEnrollLabel">이메일</label><br>
        <input class="enrollInput" type="text" name="memEmail" id="memEmail" placeholder="E-amil" required="required">
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
</section>

<script>
//비밀번호 일치 확인
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var memPassword = $("#memPassword").val();
			var memPassword2 = $("#memPassword2").val();
			if (memPassword != "" || memPassword2 != "") {
				if (memPassword == memPassword2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	
	
	
</script>
<%@ include file="../../views/common/footer.jsp"%>
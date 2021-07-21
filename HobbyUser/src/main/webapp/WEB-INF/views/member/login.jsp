<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">
<div class="mLoginWrapper">
<form name="memberLoginFrm" id="loginForm" method="post" name="form">
	<div class="loginTitle">로그인</div>
	<!-- 아이디 -->
	<div class="loginGroup">
	<label class="mloginLabel">아이디</label><br>
	<input type="text" class="mloginInput" placeholder="아이디를 입력하세요." name="memId" required /> <br>
	<span id="find_mId_btn" class="find mId">아이디를 잊으셨나요?</span>	
	</div>
	 
	 <!-- 비밀번호 -->
	 <div class="loginGroup">
	 <label class="mloginLabel">비밀번호</label><br>
     <input type="password" class="mloginInput" placeholder="비밀번호를 입력하세요." name="memPassword" required/> <br>
	 <span id="find_mPw_btn" class="find mPw">비밀번호를 잊으셨나요?</span>	
	 </div>
	 
	 <hr>
	 <br><br>
	<!-- 손님 로그인 버튼 -->
	<div id="mLoginBtn">
	<input class="mloginInput_b" type="submit" id="mLoginSubmit" value="손님으로 로그인" 
	onclick="javascript: form.action='${path}/member/login';"/>
	
	<!-- 손님회원 가입하기 버튼 -->
	<button type="button" class="mloginInput_b" id="mEnrollSubmit" onclick="location.href='${path}/member/enroll'">손님회원 가입하기</button>
	</div>
	<div id="EnrollBtn">
	
	<!-- 상인 로그인 버튼 -->
	<input class="mloginInput_b" type="submit" id="merLoginSumit" 
	onclick="javascript: form.action='${path}/merchant/merlogin';"  value="상인으로 로그인"/>
	
	<!-- 상인회원 가입하기 버튼  -->
	<button type="submit" class="mloginInput_b" id="merEnrollSubmit" 
	onclick="location.href='${path}/merchant/enroll'" >상인회원 가입하기</button>
	</div>
	<br>
</form>
</div>

<script>
	$(function(){
		$("#find_mId_btn").click(function(){
			location.href='${ path }/member/memberIdSearch';
		})
	})
	
	$(function(){
		$("#find_mPw_btn").click(function(){
			location.href='${ path }/member/memberPwSearch';
		})
	})
</script>
<%@ include file="../../views/common/footer.jsp"%>

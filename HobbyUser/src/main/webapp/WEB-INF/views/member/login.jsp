<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">

<section class="mLoginWrapper">
<form name="memberLoginFrm" id="loginForm"
	action="${ path }/member/login" method="POST">
	<div class="loginTitle">로그인</div>
	<!-- 아이디 -->
	<div class="loginGroup">
	<label class="mloginLabel">아이디</label><br>
	<input type="text" class="mloginInput" placeholder="아이디를 입력하세요." name="memId" required /> <br>
	<div class="find_mId"><a>아이디를 잊으셨나요?</a></div>	
	</div>
	 
	 <!-- 비밀번호 -->
	 <div class="loginGroup">
	 <label class="mloginLabel">비밀번호</label><br>
     <input type="password" class="mloginInput" placeholder="비밀번호를 입력하세요." name="memPassword" required/> <br>
	 <div class="find_mPw"><a>비밀번호를 잊으셨나요?</a></div>	
	 </div>
	 
	<!-- 로그인 버튼 -->
	<div id="mLoginBtn">
		<input class="mloginInput" type="submit" id="mLoginSubmit" value="손님으로 로그인"/>
	</div>
	<div id="mLoginBtn">
		<input class="mloginInput" type="button" id="mLoginSubmit"  onclick="" value="상인으로 로그인"/>
	</div>
	<hr>
	
	<!-- 손님회원 가입하기 버튼 -->
	<div id="memEnrollBtn">
	<button type="button" class="mloginInput" id="mLoginSubmit" onclick="location.href='${path}/member/enroll'">손님회원 가입하기</button>
	</div>
	
	<!-- 상인회원 가입하기 버튼  -->
	<div>
	<button type="button" class="mloginInput" id="mLoginSubmit">상인회원 가입하기</button>
	</div>
	
	
</form>
</section>
<%@ include file="../../views/common/footer.jsp"%>
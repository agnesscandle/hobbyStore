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
<form name="form" id="loginForm" method="post" name="form">
	<div class="loginTitle">로그인</div>
	
	<!-- 라디오 체크 -->
	<div class="login_gubun">
	<div class="gubun_cont">
      <label for="member_flag_mem" class="container_radio" >
         손님
      <input type="radio" id="member_flag_mem" name="member_flag"  value="m" checked>
      <span class="checkmark"></span>
      </label>
      
      <label for="member_flag_mer" class="container_radio" >
         상인
      <input type="radio" id="member_flag_mer" name="member_flag"  value="s">   
      <span class="checkmark"></span>
      </label>
   </div>
   </div>
   
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
	 
	 <!-- 로그인 버튼 -->
	<div id="mLoginBtn">
	<button class="mloginInput_b" type="submit" id="mLoginSubmit" value="로그인" 
	onclick="radio_chk();">로그인</button>
	
	 <hr class="barline">
	
	<!-- 손님회원 가입하기 버튼 -->
	<button type="button" class="mloginInput_b" id="mEnrollSubmit" onclick="location.href='${path}/member/enroll'">손님회원 가입하기</button>
	
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
	
	function radio_chk(){
	var member_flag = $('input[name=member_flag]:checked').val();
	
	if(member_flag == 'm'){
		form.action='${path}/member/login';
		
	}
	
	if(member_flag == 's'){
		form.action='${path}/merchant/merlogin';
	}
}
</script>
<br>
<%@ include file="../../views/common/footer.jsp"%>

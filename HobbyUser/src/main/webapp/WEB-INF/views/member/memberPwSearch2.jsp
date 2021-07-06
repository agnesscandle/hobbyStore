<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.searchPwPage2 {
	padding: 7% 40% 8% 40%;
}

.mPw_Search_Title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 40px 0px;
}

.searchPw_btn, .pwSearchInput {
	font-size: 15px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 10px;
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

.inputMemPhone {
	margin-bottom: 0px;
}


.searchPw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.labelMName, .labelMPhone {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.search_box{
	margin-bottom: 5%;
}
</style>

<div class="searchPwPage2">
<form name="mPwSearchFrm2" id="PwSearchForm2" 
	action="${ path }/member/memberPwSearch2" method="POST">
	<div class="mPw_Search_Title">비밀번호 찾기</div>
	
	<div class="search_box">
	<label class="labelMName">이름</label><br>
	<input type="text" class="pwSearchInput" name="memName" id="memName" placeholder="홍길동"/><br>
	<label class="labelMPhone">휴대전화</label><br>
	<input type="text" class="pwSearchInput inputMemPhone" name="memPhone" id="memPhone" placeholder="(-)없이 숫자만 입력"/> <input id="sendPhoneNumber" class="pwSearchInput" type="submit" value="인증번호 받기">
	<input type="text"  class="pwSearchInput" id="inputCertifiedNumber" name="phNumCode" placeholder="인증번호 6자리 숫자 입력">
	</div>
	
	<p>
		<button type="submit" id="checkBtn" class="searchPw_btn">다음</button>
	</p>

	

</form>
</div>

<script>
$(function(){
	$("#find_mId_btn").click(function(){
		location.href='${ path }/member/memberIdSearch';
	})
})


</script>

<%@ include file="../../views/common/footer.jsp"%>

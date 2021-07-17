<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">

<style>
.searchPwPage {
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

.labelMId {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.searchPw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.search_box{
	margin-bottom: 8%;
}

#find_mId_btn{
	font-size: 14px;
	color: rgb(163, 162, 162);
}

#searchPw_submit {
	cursor: pointer;
}

</style>

<div class="searchPwPage">
<form name="mPwSearchFrm" id="PwSearchForm" 
	action="${ path }/member/memberPwSearch" method="POST">
	<div class="mPw_Search_Title">비밀번호 찾기</div>
	
	<div class="search_box">
	<label class="labelMId">아이디</label><br>
	<input type="text" class="pwSearchInput" name="merId" id="merId" placeholder="hobbymarket"/>
	<div id="find_mId_btn">아이디를 잊으셨나요?</div>
	</div>
	
	<p>
		<button type="submit" id="searchPw_submit" class="searchPw_btn">다음</button>
	</p>

</form>
</div>

<script>

<!-- 아이디찾기 페이지로 이동 -->
$(function(){
	$("#find_mId_btn").click(function(){
		location.href='${ path }/merchantMember/memberIdSearch';
	})
})

$("#searchPw_submit").on("click",function(){
	var id = $("#merId").val();
	
	if(id == ""){
		alert("아이디를 입력해주세요!");
		return false;
	}
});

</script>


<%@ include file="../../views/common/footer.jsp"%>

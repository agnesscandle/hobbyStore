<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">



<div class="findIdPage">
<form name="mIdSearchFrm" id="idSearchForm" 
	action="${ path }/member/memberIdSearch" method="POST">
	<div class="mId_Search_Title">아이디 찾기</div>
	<div class="search_box">
		<label class="labelMname">이름</label><br>
		<input type="text" class="idSearchInput"  name="merName" id="merName" placeholder="홍길동"/>
		<div class="name regex"></div>
	</div>
	
	<div class="search_box">
		<label class="labelMemail">이메일 주소</label><br>
		<input type="email" class="idSearchInput" name="merEmail" id="merEmail" placeholder="hobbyuser@market.com"/>
		<div class="email regex"></div>
	</div>
	
	<p>
		<button type="submit" id="searchId_submit" class="searchId_btn">아이디 찾기</button>
	</p>



</form>
</div>

<style>
.findIdPage {
	padding: 7% 40% 10% 40%;
}

.mId_Search_Title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 40px 0px;
}

.searchId_btn, .idSearchInput {
	font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px;
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

.labelMname, .labelMemail {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.regex {
	font-size: 14px;
	padding: 5px 0;
	color: red;
}

.search_box{
	margin-bottom: 8%;
}

.searchId_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

#searchId_submit{
	cursor: pointer;
}
</style>

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

//email유효성 검사
$("#merEmail").on("input",function(){
     var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     var result = regex.exec($("#merEmail").val());
    
    if(result != null){
       $(".email.regex").html("");  
    }else{
        $(".email.regex").html("올바른 이메일이 아닙니다");
    }
});


</script>
	<%@ include file="../../views/common/footer.jsp"%>

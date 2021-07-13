<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 잠깐 테스트 -->
<html>
<%-- <head>
<meta charset="UTF-8">
<meta name="viewport" content="widh=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/css/style.css">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />

<script src="${ path }/js/jquery-3.6.0.min.js"></script> --%>

<title>취미상점</title>


</head>

<%-- 
	<header>
		<div class="logo" onclick="location.href='${path}'">
			<img class="logoImg" src="${ path }/images/logo.png">
			<h4>취미상점 상인</h4>
		</div>

	</header> --%>


<nav>

<div class="topMenu1">
    <ul class="dept01"></ul>
        <li>
            <span>취미관리</span>
            <ul class="dept01">
               
                <li id="hobbyEnroll" class="hobbyEnroll">취미만들기</li>
                  <!--  <a href="/hobbyEnroll">취미만들기</a> -->
               
                 <li id="asd">
                    취미관리
                </li>
                    
                    
            </ul>
        </li>
</div>
</nav>

<nav>
<div class="topMenu2">        
        <li>
            <span>손님관리</span>
            <ul class="dept02">
                
                 <li id="hobbyEnroll" class="hobbyEnroll">출석</li>
                  <li id="hobbyEnroll" class="hobbyEnroll">예약</li>
                  <li id="qnaList" class="qnaList">문의</li>
                 <li id="hobbyEnroll" class="hobbyEnroll">후기</li>
                    
                    
            </ul>        
        </li>
 </div>       
</nav>

<nav>
<div class="topMenu3">        
        <li>
            <span>정산</span>
            <ul class="dept03">
                 <li id="hobbyEnroll" class="hobbyEnroll">정산관리</li>
                  <li id="hobbyEnroll" class="hobbyEnroll">정산요청</li>
            </ul>        
        </li>
 
</div>
</nav>

<nav>
<div class="topMenu4"> 		
 		<li>
            <span>지원센터</span>
            <ul class="dept04">
                 <li id="hobbyEnroll" class="hobbyEnroll">공지사항</li>
                 <li id="hobbyEnroll" class="hobbyEnroll">운영메뉴얼</li>
                 <li id="hobbyEnroll" class="hobbyEnroll">자주 묻는 질문</li>
                 <li id="hobbyEnroll" class="hobbyEnroll">후기</li>
                   
            </ul>        
        </li>
           
</div>   
  
</nav>







<script>

$(document).on('mouseover', '.topMenu1 span', function () {
    $('.dept01').slideDown(700);
});
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu1')) {
        $('.dept01').slideUp(700);
    }
});

<!-- 취미만들기 페이지 이동 -->
$(function(){
   $("#hobbyEnroll").click(function(){
      location.href='${ path }/merchantMember/hobbyEnroll';
   })
})



$(document).on('mouseover', '.topMenu2 span', function () {
    $('.dept02').slideDown(700);
});
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu2')) {
        $('.dept02').slideUp(700);
    }
});
<!-- qna 페이지 이동 -->
$(function(){
   $("#qnaList").click(function(){
      location.href='${ path }/hobby/qnaList';
   })
})

$(document).on('mouseover', '.topMenu3 span', function () {
    $('.dept03').slideDown(700);
});
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu3')) {
        $('.dept03').slideUp(700);
    }
});

$(document).on('mouseover', '.topMenu4 span', function () {
    $('.dept04').slideDown(700);
});
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu4')) {
        $('.dept04').slideUp(700);
    }
});
</script>

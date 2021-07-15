<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 잠깐 테스트 -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widh=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/css/merchantMember_css/test.css">
<%-- <link rel="stylesheet" href="${path}/css/style.css"> --%>
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<title>취미상점</title>
</head>
<!-- <style>
.topMenu1{
    margin : 5px;
    padding : 5px;
    font: 20px; 
    color: blak;
    justify-content : flex-start;
    align-items : center;
    min-height : 8vh;
    font-family : 'Noto Sans KR', sans-serif;
}
</style> -->

	<header>
		<div class="logo" onclick="location.href='${path}'">
			<img class="logoImg" src="${ path }/images/logo.png">
			<h4>취미상점 상인</h4>
		</div>

		<div class="member">
			<table class="container" align="center">
				
				<!-- 로그인 되어있는 경우 -->
				<c:if test="${ loginMerMember != null }">
					<tr class="main info">
				<td colspan="3" class="infoId">${ loginMerMember.merName }님,환영합니다</td>
					</tr>
					<tr>
						<td class="btn logout"><button type="button"
								onclick="location.replace('${path}/merchantMember/merlogout')">로그아웃</button></td>
					</tr>
				</c:if>
			</table>
		</div>
	</header>
<div style="width:200px; float:left;">

<nav>

<div class="topMenu1">
    <ul class="dept01"></ul>
        
            <span style="color:navy; font-size:30px; font-weight:bold">취미관리</span>
            <ul class="dept01">
               
                <div id="hobbyEnroll" class="hobbyEnroll">취미만들기</div>
                  <!--  <a href="/hobbyEnroll">취미만들기</a> -->
               
                 <div id="hobbylist" class="hobbylist">
                    취미관리
                </div>
                    
                    
            </ul>
        
</div>
</nav>

<nav>
<div class="topMenu2">        
        
            <span style="color:navy; font-size:30px; font-weight:bold">손님관리</span>
            <ul class="dept02">
                
                 <div id="hobbyEnroll" class="hobbyEnroll">출석</div>
                  <div id="hobbyEnroll" class="hobbyEnroll">예약</div>
                  <div id="qnaList" class="qnaList">문의</div>
                 <div id="hobbyEnroll" class="hobbyEnroll">후기</div>
                    
                    
            </ul>        
        
 </div>       
</nav>

<nav>
<div  class="topMenu3">        
      
            <span style="color:navy; font-size:30px; font-weight:bold">정산</span>
            <ul class="dept03">
                 <div id="hobbyEnroll" class="hobbyEnroll">정산관리</div>
                  <div id="hobbyEnroll" class="hobbyEnroll">정산요청</div>
            </ul>        
      
 
</div>
</nav>

<nav>
<div class="topMenu4"> 		
 		
            <span style="color:navy; font-size:30px; font-weight:bold">지원센터</span>
            <ul class="dept04">
                 <div id="hobbyEnroll" class="hobbyEnroll"><a href="/html/intro">공지사항</a></div>
                 <div id="hobbyEnroll" class="hobbyEnroll"><a href="/html/intro">운영메뉴얼</a></div>
                 <div id="hobbyEnroll" class="hobbyEnroll"><a href="/html/intro">자주 묻는 질문</a></div>
                 <div id="hobbyEnroll" class="hobbyEnroll"><a href="/html/intro">후기</a></div>
                   
            </ul>        
        
           
</div>   
  
</nav>
</div>
</body>






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
      location.href='${ path }/merchant/hobbyEnroll';
   })
})
<!--취미리스트 페이지 이동-->
$(function(){
   $("#hobbylist").click(function(){
      location.href='${ path }/merchant/list?adNo=${loginMerMember.merNo}';
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
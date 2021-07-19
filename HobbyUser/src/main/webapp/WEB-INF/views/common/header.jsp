<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
h4{
    display : inline;
    color : navy;
    letter-spacing: 5px;
    font-size: 70px;
    font-family : 'Noto Sans KR', sans-serif;
    position: relative;
    top : -20px;
    left : -4px;
}
</style>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${path}/css/style.css">
        <link rel="shortcut icon" type="imae/x-icon" href="${path}/images/logo.png"/>

        <script src="${ path }/js/jquery-3.6.0.min.js"></script>

        <title> 취미상점  </title>
    </head>

    <body>
        <header>
            <div class="logo" onclick="location.href='${path}'">
                <img class="logoImg" src="${ path }/images/logo.png"> <h4> 취미상점</h4>
            </div>
            <form id ="searchForm" class="logo search" action="${ path }/hobby/list/search" method="GET">
                <input type="text" name="searchDate" placeholder=" 어떤 취미를 찾고 있나요?"/>
                <button class="search btn_search" id="search" type="button"/>
                <img src="${path}/images/search.png"/></button>
            </form>

            <span class="member" id="memberContainer">
                <!-- 로그인이 되어있지 않은 경우  -->
                    <table class="tbl" align="center">
                <c:if test="${ loginMember == null && loginMerMember == null }">
                        <tr class="main">
                            <td class="butn login"><button type="button" onclick="location.href='${path}/member/login'">로그인</button></td>
                            <td class="butn join"><button type="button" onclick="location.href='${path}/member/enroll'">회원가입</button></td>
                        </tr>
                        <tr class="find">
                            <td class="butn findId"><button type="button" onclick="location.href='${path}'">아이디찾기</button></td>
                            <td class="butn findPwd"><button type="button" onclick="location.href='${path}'">비밀번호찾기</button></td>
                        </tr>
                 </c:if>
                 
                <!-- 로그인 되어있는 경우 --> 
                <c:if test="${ loginMember != null }">
                        <tr class="main info">
                            <td colspan="2" class="infoId">${ loginMember.memName } 님, 환영합니다</td>
                        </tr>
                        <tr>
                            <td class="butn logout"><button type="button" onclick="location.replace('${path}/logout')">로그아웃</button></td>
                            <td class="butn myPage"><button type="button" onclick="location.href='${path}/member/myInfo'">마이 페이지</button></td>
                        </tr>
               </c:if>
				<c:if test="${ loginMerMember != null }">
                        <tr class="main info">
                            <td colspan="2" class="infoId">${ loginMerMember.merName } 님, 환영합니다</td>
                        </tr>
                        <tr>
                            <td class="butn logout"><button type="button" onclick="location.replace('${path}/merlogout')">로그아웃</button></td>
                            <td class="butn myPage"><button type="button" onclick="location.href='${path}/merchantMember/merMain'">마이 페이지</button></td>
                        </tr>
               </c:if>
                    </table>
            </span>
            <nav>
                <ul class="nav-links">
                    <li id="btnCate"><a href="${ path }/hobby/list">전체 카테고리</a>
                    </li>
                    <li><a href="${ path }/main/event">이벤트</a></li>
                    <li><a href="${ path }/main/grandOpening">오픈 예정</a></li>
                    <li><a href="${ path }/main/best">베스트</a></li>
                    <li><a href="${path}/member/support">지원센터</a></li>
                </ul>
                <div class="burger">
                    <div class="line1"></div>
                    <div class="line2"></div>
                    <div class="line3"></div>
                </div>
            </nav>
            <div id="cate" class="category">
            <ul>
            	<li> <a href="${path}/hobby/list/cate?cateNo=1">여행</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=2">액티비티</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=3">공예(DIY)</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=4">음악</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=5">미술</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=6">커리어</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=7">사진</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=8">요리</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=9">반려동물</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=10">건강</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=11">뷰티</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=12">모임</a></li>
                <li> <a href="${path}/hobby/list/cate?cateNo=13">KIDS</a></li>
            </ul>
            </div>
        </header>
        
   <script type="text/javascript" src="${ path }/js/header.js"></script>
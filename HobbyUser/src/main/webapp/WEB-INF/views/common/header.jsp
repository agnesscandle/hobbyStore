<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

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
            <div class="logo" onclick="location.href=''">
                <img class="logoImg" src="${ path }/images/logo.png"> <h4> 취미상점</h4>
            </div>
            <form id ="searchForm" class="logo search" action="${ path }/hobby/list/search" method="GET">
                <input type="text" name="searchDate" placeholder=" 어떤 취미를 찾고 있나요?"/>
                <button class="search btn_search" id="search" type="button"/>
                <img src="${path}/images/search.png"/></button>
            </form>

            <div class="member">
                <!-- 로그인이 되어있지 않은 경우  -->
                    <table class="container" align="center">
                <c:if test="${ loginMember == null }">
                        <tr class="main">
                            <td class="btn login"><button type="button" onclick="location.href='${path}/member/login'">로그인</button></td>
                            <td class="btn join"><button type="button" onclick="location.href='${path}/member/enroll'">회원가입</button></td>
                        </tr>
                        <tr class="find">
                            <td class="btn findId"><button type="button" onclick="location.href='${path}'">아이디찾기</button></td>
                            <td class="btn findPwd"><button type="button" onclick="location.href='${path}'">비밀번호찾기</button></td>
                        </tr>
                 </c:if>
                 
                <!-- 로그인 되어있는 경우 --> 
                <c:if test="${ loginMember != null }">
                        <tr class="main info">
                            <td colspan="2" class="infoId">${ loginMember.memName } 님, 환영합니다</td>
                        </tr>
                        <tr>
                            <td class="btn logout"><button type="button" onclick="location.replace('${path}/logout')">로그아웃</button></td>
                            <td class="btn myPage"><button type="button" onclick="location.href='${path}/member/myInfo'">마이 페이지</button></td>
                        </tr>
               </c:if>

                    </table>
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a href="${ path }/hobby/list">전체 카테고리</a>
                        <span> </span>
                    </li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#">오픈 예정</a></li>
                    <li><a href="#">베스트</a></li>
                </ul>
                <div class="burger">
                    <div class="line1"></div>
                    <div class="line2"></div>
                    <div class="line3"></div>
                </div>
            </nav>
        </header>
        
   <script type="text/javascript" src="${ path }/js/header.js"></script>
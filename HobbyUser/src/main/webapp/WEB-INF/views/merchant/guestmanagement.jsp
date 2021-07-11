<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widh=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/css/style.css">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<title>취미상점</title>
</head>


	<header>
		<div class="logo" onclick="location.href='${path}'">
			<img class="logoImg" src="${ path }/images/logo.png">
			<h4>취미상점</h4>
		</div>

		<div class="member">
			<table class="container" align="center">
				
				<!-- 로그인 되어있는 경우 -->
				<c:if test="${ loginMerMember != null }">
					<tr class="main info">
						<td colspan="2" class="infoId">${ loginMerMember.merName }님,
							환영합니다</td>
					</tr>
					<tr>
						<td class="btn logout"><button type="button"
								onclick="location.replace('${path}/merlogout')">로그아웃</button></td>
					</tr>
				</c:if>
			</table>
		</div>
	</header>
	
	
	<h1>손님관리페이지입니다.</h1>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="center">자주 묻는 질문 게시판 </h2>
	<div id="faq-list-container">

		자주 묻는 질문 추후 게시판 추가하기



		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/merchant/faqList?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/merchant/faqList?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button disabled><c:out value="${ status.current }"/></button>		
				</c:if>
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button onclick="location.href='${ path }/merchant/faqList?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>	
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/merchant/faqList?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/merchant/faqList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>

    <script>

    </script>
    <%@ include file="../../views/common/footer.jsp"%>
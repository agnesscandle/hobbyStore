<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />
<link rel="stylesheet"
	href="${path}/css/merchantMember_css/reviewList.css">



<div>
	<div class="divList">
		<div class="containerList">

			<c:if test="${ list != null}">
				<c:forEach var="hobby" items="${ list }">
					<div class="item">

						<!-- 썸네일 이미지 -->
						<img id="thumImg"
							src="${path}/resources/upload/hobby/${hobby.hbThumRename}" onclick="location.href='${path}/merchant/Review?hbNo=${hobby.hbNo}'">
							
						
						<div class="detail">
							<div class="title">

								<!-- 제목 -->
								<h2>
									${hobby.cateName}<em>${hobby.hbTitle}</em>
								</h2>
								<span id="reviewView"> 후기보기 </span>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>

<div id="pageBar">
	<!-- 맨 처음으로 -->
	<button onclick="location.href='${path}/hobby/list?page=1'">&lt;&lt;</button>

	<!-- 이전 페이지로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${ pageInfo.prvePage }'">&lt;</button>

	<!--  10개 페이지 목록 -->

	<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
		step="1" varStatus="status">
		<c:if test="${pageInfo.currentPage == status.current }">
			<button disabled>
				<c:out value="${status.current}" />
			</button>
		</c:if>
		<c:if test="${pageInfo.currentPage != status.current }">
			<button
				onclick="location.href='${path}/hobby/list?page=${status.current}'">
				<c:out value="${status.current}" />
			</button>
		</c:if>
	</c:forEach>
	<!-- 다음 페이지로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${pageInfo.nextPage}'">&gt;</button>

	<!-- 맨 끝으로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
</div>

<script>
	$('.size span, .color span').click(function() {
		$(this).addClass('active')
		$(this).siblings().removeClass('active')
	})
	$('.like').click(function() {
		$(this).toggleClass('active')
	})
	
	
</script>
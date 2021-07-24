<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/merchantMember_css/calculate.css">
<!--  -->
<h1 style="display:block  ; position:relative; left: 20px;">공지사항</h1><br>
<div style="position:relative; left: 30px;"class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th style="width:100px">글 번호</th>
            <th style="width:1000px">제 목</th>
            <th>작성자</th>
            <th style="width:100px">조회수</th>
        </tr>
        </thead>
        <tbody>
		<c:if test="${ list==null }">
				<tr>
					<td colspan="4">
						조회된 공지사항이 없습니다.
					</td>
				</tr>	
				
		</c:if>	
		<c:if test="${ list != null }">
				<c:forEach var="notice" items="${ list }">
					<tr>
						<td align="center"><c:out value="${ notice.noticeNum }"/></td>
						<td>
							<a href="${ path }/merchant/noticeview?no=${notice.noticeNum}">							
								<c:out value="${ notice.noticeTitle }"/>
							</a>
						</td>
						<td align="center"><c:out value="${ notice.adminId }"/></td>
						<td align="center"><c:out value="${ notice.noticeReadCount }"/></td>
					</tr>					
				</c:forEach>
			</c:if>
        <tbody>
     </table>
</div>
		
			<div class="pageBar" align="left">
			<!-- 맨 처음으로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/noticelist?page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/noticelist?page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<div class="pageBar">
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button  onclick="location.href='${ path }/merchant/noticelist?page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			</div>
			<!-- 다음 페이지로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/noticelist?page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/noticelist?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>
        <h2 align="center">게시판 </h2>
	<div id="reserveList-container">
	<c:if test="${ loginMerchant != null }">
		<button type="button" id="btn-add"
			onclick="location.href=''">글쓰기</button>
	</c:if><br><br>

        취미명 넣기 
		<table id="tbl-board">
			<tr>
                <th>예약일</th>
				<th>예약 아이디</th>
				<th>예약명</th>
				<th>예약 번호</th>
				<th>예약 인원 수</th>
				<th>예약 여부</th>
			</tr>
			
			
			<c:if test="${ list == null }">
				<tr>
					<td colspan="6">
						조회된 예약 이력이 없습니다.
					</td>
				</tr>
			</c:if>
			
			<c:if test="${ list != null }">
				<c:forEach var="reserve" items="${ list }">
					<tr>
						<td><fmt:formatDate type="both" value="${ reserve.takeDate }"/></td>
						<td><c:out value="${ reserve.memId }"/></td>
						<td><c:out value="${ reserve.resName }"/></td>
						<td><c:out value="${ reserve.resPhone }"/></td>
                        <td><c:out value="${ reserve.resCount }"/></td>
                        <td>
                            <c:if test="${ reserve.resStatus eq 'Y'}">
                                <button type="button"> 예약 완료 </button>
                            </c:if>
                            <c:if test="${ reserve.resStatus eq 'N'}">
                                <button type="button"> 예약 취소 </button>
                            </c:if>
                        </td>
					</tr>
				</c:forEach>
			</c:if>
            여기
            <c:out value="${ hbNo}"></c:out>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button disabled><c:out value="${ status.current }"/></button>		
				</c:if>
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>	
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
    </div>

</body>
</html>
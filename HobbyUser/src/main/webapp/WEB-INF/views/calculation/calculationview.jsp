<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<h1 style="display:block;">정산요청</h1><br>
		<table  class = "table" style="width: 1100px;">
			<tr>
				<th bgcolor="#E6E6E6">회원ID</th>
				<th bgcolor="#E6E6E6">예약이름</th>
				<th bgcolor="#E6E6E6">결제일</th>
				<th bgcolor="#E6E6E6">금액</th>
				<th bgcolor="#E6E6E6" height="50px;">정산 신청</th>
			</tr>
		<c:if test="${ list==null }">
				<tr>
					<td colspan="5">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
				
		</c:if>
		
		<c:if test="${ list != null }">
				<c:forEach var="reserve" items="${ list }">
					<tr>
						<td align="center"><c:out value="${ reserve.memId }"/></td>
						<td align="center"><c:out value="${ reserve.resName }"/></td>
						<td align="center"><c:out value="${ reserve.resDate }"/></td>
						<td align="center"><c:out value="${ reserve.payFee }"/></td>
						<td align="center">
						<form id="calform" name="calform" method="POST" action="calculateapply">
							<input type="hidden" name="resNo" value= "${reserve.resNo}"/>
							<input type="hidden" name="merNo" value="${reserve.merNo}"/>
							<input type="hidden" name="hbNo" value="${reserve.hbNo}"/>
						<input type="submit" value="정산 신청"/>
						</form></td>
					<!-- 	<button onclick="location.href='${path}/merchantMember/calculateapply?resNo=${reserve.resNo}&&merNo=${reserve.merNo}'">정산신청</button> -->
					</tr>				

				</c:forEach>
			</c:if>
		</table>
		


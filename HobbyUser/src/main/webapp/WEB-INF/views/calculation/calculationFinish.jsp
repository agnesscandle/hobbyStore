<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/merchantMember_css/calculate.css">
<!--  -->
<h1 style="display:block  ; position:relative; left: 20px;">정산완료목록</h1><br>
<div class="table-wrapper">
    <table class="fl-table">
        <thead>
        <tr>
            <th style="width:50px">회원ID</th>
            <th style="width:100px">예약이름</th>
            <th style="width:40px">결제일</th>
            <th style="width:100px">금액</th>
            <th style="width:100px">정산 상태</th>
        </tr>
        </thead>
        <tbody>
		<c:if test="${ list==null }">
				<tr>
					<td colspan="5">
						조회된 정산목록이 없습니다.
					</td>
				</tr>	
				
		</c:if>	
		<c:if test="${ list != null }">
				<c:forEach var="reserve" items="${ list }">
					<tr>
						<td align="center"><c:out value="${ reserve.memId }"/></td>
						<td><c:out value="${reserve.resName}"/></td>
						<td><c:out value="${reserve.resDate }"/></td>
						<td><c:out value="${reserve.payFee }"/></td>
						<td align="center">정산 완료</td>
					</tr>				
				</c:forEach>
			</c:if>
        <tbody>
     </table>
</div>
		
			<div class="pageBar" align="left">
			<!-- 맨 처음으로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}&&page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}&&page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<div class="pageBar">
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current}">
					<button disabled><c:out value="${ status.current }"/></button>
				</c:if>
				<c:if test="${ pageInfo.currentPage != status.current}">
					<button  onclick="location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}&&page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>
				</c:if>
			</c:forEach>
			</div>
			<!-- 다음 페이지로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}&&page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button  class="pageBar" onclick="location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}&&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
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
	
	<div id="board-write-container" class="listTable" style="position:relative; left: 30px;">
	<table id="tbl-board" class="listTable">
		<tr>
			<th>제 목</th>			<td>${notice.noticeTitle}</td>
		</tr>
		<tr>
			<th>&nbsp;&nbsp;작성자</th>
			<td>${notice.adminNo}</td>			<th class="right">조회수</th> <td class="right">${notice.noticeReadCount}</td>	
		</tr>
	</table>
	<hr>
		<br><br>${ notice.noticeCont }<br><br><hr>

	<button type="button" class="btnList" onclick="location.href='${ path }/merchant/notice'">목록으로</button>
	
</div>


</body>
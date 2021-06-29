<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="../../views/common/header.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />



	<div id='hobby-enroll-container' align="center">	
	<form action="${ path }/hobby/enroll" method="POST">
		<table border="1">
		<tr>
		<th>제목</th>
		<td><input type="text" name="hb_title" id="hb_title">
		</td>
		</tr>
		
		<tr>
		<th>상인</th>
		<input type="hidden" name="mer_no" value="1" />
		<!-- <td><input type="text" name="mer_id" id="mer_id"value="voshallr" readonly>
			<!-- value="${ loginMember.id}" 추가해야함 -->
		</td> -->
		</tr>
		
		<tr>
		<th>카테고리</th>
		<input type="hidden" name="cate_no" value="1" />
		<!-- 
		<td><input type="text" name="cate_name" id="cate_name" value="교육">
		</td> -->
		</tr>
		
		<tr>
		<th>요약한줄</th>
		<td><input type="text" name="hb_summary" id="hb_summary">
		</td>
		</tr>
	 	
		<tr>
		<th>취미 시작일</th>
		<td><input type="date" name="hb_startDate" id="hb_startDate" min="${today}">
		</td>
		
		<th>취미 종료일 </th>
		<td><input type="date" name="hb_endDate" id="hb_endDate" min="${today}">
		</td>
		</tr>
		 
		<tr>
		<th>취미 URL</th>
		<td><input type="text" name="hb_url" id="hb_url"></td>
		</tr>
		
		<tr>
		<th>썸네일 이미지 URL</th>
		<td><input type="text" name="hb_thum_url" id="hb_thum_url"></td>
		</tr>
		
		<tr>
		<th>썸네일 이미지 이름</th>
		<td><input type="text" name="hb_thum_name" id="hb_thum_name"></td>
		</tr>
		
		<tr>
		<th>설명</th>
		<td><textarea rows="20" cols="50"></textarea>
		</td>
		</tr>
		
		<tr>
		<th>주소</th>
		<td><input type="text" name="hb_location" id="hb_location"></td>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</th>
		</tr>
		</table>
	
		
		</form>
	
	</div>
<%@ include file="../../views/common/footer.jsp"%>
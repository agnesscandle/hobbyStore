<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">

<style>
#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}
</style>

<contents id="updateInfo">
<div>
<div>${ loginMember.memName } 님, 안녕하세요!</div><br>
<form id="memberFrm" action="${ path }/member/update" method="POST">
<table class="infoTable">

<tr><th>아이디</th></tr>
<tr>
	<td>
		<input type="text" name="memId" id="memId" 
			value="${ loginMember.memId }" readonly required />
	</td>
</tr>

<tr><th>이름</th></tr>
<tr><td><input type="text" name="memName" id="memName" 
			value="${ loginMember.memName }" required/></td></tr>

<tr><th>휴대폰 번호</th></tr>
<tr><td><input type="text" name="memPhone" id="memPhone" 
			value="${ loginMember.memPhone }" required/><td></tr>

<tr><th>이메일</th></tr>
<tr><td><input type="text" name="memEmail" id="memEmail" 
			value="${ loginMember.memEmail }" required/><td></tr>
</table>

<br>

<input type="submit" value="정보 수정" /><br>

</form>
</div>
</contents>

<script>

</script>

<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
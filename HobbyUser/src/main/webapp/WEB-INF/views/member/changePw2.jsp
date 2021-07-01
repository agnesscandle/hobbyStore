<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

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
<contents>
<form id="memberFrm" action="${ path }/member/changePw2" method="POST">
<h2>비밀번호 변경</h2>
<br>
<div>step 2/ 새로운 비밀번호를 입력하세요.</div>
<br>
<table>
	<tr class="hide">
		<td><input type="hidden" name="memId" value="${ loginMember.memId }" readonly/></td>
	</tr>
	<tr>
		<th>새 비밀번호</th>
		<td><input type="password" class="newPw" id="memPassword" name="memPassword" required /></td>
	</tr>
	<tr>
		<th>새 비밀번호 확인</th>
		<td><input type="password" class="newPw" id="memPassword2" required /></td>
	</tr>
	<tr>
		<td><input type="submit" value="비밀번호 변경" /></td>
	</tr>
</table>

	
</form>
</contents>


<script>



</script>


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
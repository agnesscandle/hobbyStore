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
<form id="memberFrm" action="${ path }/member/changePw" method="POST">
<h2>비밀번호 변경</h2>
<br>
<div>step 1/ 현재 사용하고 있는 비밀번호를 입력해주세요.</div>
<br>
<table>
	<tr class="hide">
		<td><input type="hidden" name="memId" value="${ loginMember.memId }" readonly/></td>
	</tr>
	<tr>
		<th>현재 비밀번호</th>
		<td><input type="password" class="curPw" id="memPassword" name="memPassword" required/></td>
	</tr>
	<tr>
		<td><input type="submit" value="다음 단계로 넘어가기" /></td>
	</tr>
</table>

<br><br>
<div>비밀번호를 잊으셨나요?</div>
	
</form>
</contents>


<script>



</script>


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
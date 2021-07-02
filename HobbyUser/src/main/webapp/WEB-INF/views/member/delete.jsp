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
<div class="cont_intro">
<h3>안전한 회원 탈퇴를 위해, 비밀번호를 확인해주세요.</h3>
<p>
	비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.
	<br>
	탈퇴 후에는 동일 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.
</p>
</div>
<form id="memberDelFrm" action="${ path }/member/delete" method="POST">
<br>
<br>
<table>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="memId" id="memId" value="${ loginMember.memId }" readonly/></td>
	</tr>
	<tr>
		<th>비밀번호 입력</th>
		<td><input type="password" class="curPw" id="memPassword" name="memPassword" required/></td>
	</tr>
</table>

		<div class="wrap_btn">
			<a href="${ path }/member/myInfo" class="btn_comm btn_cancle" data-tiara-action-name="탈퇴_취소">
				<span class="screen_out">취소</span>
			</a>
			<button type="submit" class="btn_comm btn_next" data-tiara-action-name="다음_단계">
				<span class="screen_out">탈퇴</span>
			</button>
		</div>

<br><br>
	
</form>
</contents>


<script>



</script>


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
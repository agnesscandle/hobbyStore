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

<contents>


<div class="memInfo">
<div>${ loginMember.memName } / ${ loginMember.memId }</div>
<span>${ loginMember.memEmail }</span>
</div>

<h2>내 정보 관리</h2>
<div id="updateInfo_btn">프로필 수정</div>
<div id="changePw_btn">비밀번호 변경</div>
<div>회원 탈퇴</div>
<div>예약 관리</div>
<div>좋아요 관리</div>

</contents>

<script>
$(function(){
	$("#updateInfo_btn").click(function(){
		location.href='${ path }/member/updateMyInfo';
	})
})

$(function(){
	$("#changePw_btn").click(function(){
		location.href='${ path }/member/changePw';
	})
})
</script>

<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
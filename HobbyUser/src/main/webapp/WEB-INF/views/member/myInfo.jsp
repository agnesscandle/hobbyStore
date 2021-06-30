<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">
<section>
<div class="memInfo">
<div>${ loginMember.memName } / ${ loginMember.memId }</div>
<span>${ loginMember.memEmail }</span>


<h2>내 정보 관리</h2>
<div id="updateInfo_btn">프로필 수정</div>
<div>비밀번호 변경</div>
<div>회원 탈퇴</div>
<div>예약 관리</div>
<div>좋아요 관리</div>
</div>
</section>

<script>
$(function(){
	$("#updateInfo_btn").click(function(){
		location.href='${ path }/member/updateMyInfo';
	})
})

</script>


<%@ include file="../../views/common/footer.jsp"%>
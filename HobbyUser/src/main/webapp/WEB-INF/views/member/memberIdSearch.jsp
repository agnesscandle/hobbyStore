<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">

<style>


</style>

<section>
<div class="findIdPage">
<form name="mIdSearchFrm" id="idSearchForm" 
	action="${ path }/member/memberIdSearch" method="POST">
	<div class="mId Search Title">아이디 찾기</div>
	<label class="mId Search Title">이름</label><br>
	<div>
		<input type="text" name="memName" id="memName"/>
	</div>
	
	
	<label class="mId Search Title">이메일 주소</label><br>
	<div>
		<input type="email" class="idSearchInput" name="memEmail" id="memEmail" />
	</div>
	
	<p>
		<button type="submit">아이디 찾기</button>
	</p>

	<div class="resultIdSearch"></div>


</form>
</div>
</section>
<%@ include file="../../views/common/footer.jsp"%>
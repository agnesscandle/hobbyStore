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
.updateMemInfo {
	padding: 7% 35% 5% 35%;
	
}

.infoTitle{
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	color: black;
	margin: 20px 0px 20px 0px;
}
.mInfoLabel{
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.mInfoInput{
	font-size: 16px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 15px;
    border: 1px solid rgb(239, 239, 239);
    background-color: white;
    height: 48px;
    flex: 1 1 auto;
    width: 100%;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 16px;
    border-radius: 3px;
}

.mInfoInput:active {
   background-color: rgb(230, 243, 250);
}

#mInfoSubmit{
	background-color: rgb(32, 51, 84);
	font-size: 24px;
	font-weight: bold;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px;
    border: 1px solid rgb(239, 239, 239);
    height: 48px;
    flex: 1 1 auto;
    width: 100%;
    color: white;
    box-sizing: border-box;
    margin-top: 10px;
    padding: 0px 16px;
    border-radius: 3px;
}
</style>

<div class="updateMemInfo">
<div class="infoTitle">${ loginMember.memName } 님, 안녕하세요!</div><br>
<form id="memberFrm" action="${ path }/member/update" method="POST">

<div class="m_infoG">
<label class="mInfoLabel">아이디</label><br>
		<input type="text" name="memId" id="memId" class="mInfoInput"
			value="${ loginMember.memId }" readonly required />
</div>

<div class="m_infoG">
<label class="mInfoLabel">이름</label><br>
<input type="text" name="memName" id="memName" class="mInfoInput"
			value="${ loginMember.memName }" required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">휴대폰 번호</label><br>
<input type="text" name="memPhone" id="memPhone" 
			value="${ loginMember.memPhone }" class="mInfoInput" required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">이메일</label><br>
<input type="text" name="memEmail" id="memEmail" 
			value="${ loginMember.memEmail }"  class="mInfoInput" required/>
</div>



<p>
<input type="submit" id="mInfoSubmit" value="정보 수정" />
</p>


</form>
</div>

<script>

</script>

<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
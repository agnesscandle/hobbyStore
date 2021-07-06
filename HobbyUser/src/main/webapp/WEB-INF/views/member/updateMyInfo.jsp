<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.profile-wrapper{
	height: 150px;
	width: 150px;
	position: relative;
	border: 2px solid rgb(32, 51, 84);
	border-radius: 50%;
	background: url('${ path }/profile/${ loginMember.memImgRename }');
	background-size: 100% 100% ;
	margin: 50px auto;
	overflow: hideen;
}

.my_file{
	position:absolute;
	bottom: 0;
	outline: none;
	color: transparent;
	width: 100%;
	box-sizing: border-box;
	padding: 15px 120px;
	cursor: pointer;
	transition: 0.5s;
	background: rgba(0,0,0,0.5);
}

#my-profile{
	position: absoulte;
	width: 1px;
	height: 1px;
	padding: 0;
	border: 0;
	margin: -1px;
	display: none;
}

.profile-wrapper label {
	display: inline-block;
	margin: 80% 0% 0% 75%;
	color: #999;
	cursor: pointer;
	background: url('${ path }/images/camera.png');
	background-repeat: no-repeat;
	background-size: 40px 35px;
	width:100%;
	height: 30%;
}

.updateMemInfo {
	padding: 0% 35% 5% 35%;
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
    cursor: pointer;
}

</style>

<div class="updateMemInfo">

<form id="memberFrm" action="${ path }/member/update" method="POST" enctype="multipart/form-data">
<div class="profile-wrapper">
	<input type="file" id="my-profile" class="my-file" name="upfile"/>
	<label class="my-file-button" for="my-profile"></label>
</div>

<div class="infoTitle">${ loginMember.memName } 님, 안녕하세요!</div><br>
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
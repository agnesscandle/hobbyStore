<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
#footer{
 margin-top : 10%;
}
.changePwPage {
	padding: 10% 33% 8% 33%;
}

.merPw_Change_Title {
	text-align: left;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 10px 0px;
}

.merPw_Change_step {
	margin-bottom: 5%;;
	font-size: 22px;
	font-weight: bold;
}

.changePw_btn, .pwChangeInput {
	font-size: 15px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 8px;
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

.changePw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.labelMPw {
	display: inline-block;
	text-align: right;
	font-size: 20px;
	font-weight: 600;
	padding-bottom: 8px;
}

.change_box{
	margin-bottom: 3%;
}

#find_mPw_btn{
	cursor: pointer;
	font-size: 16px;
	color: rgb(163, 162, 162);
}

#changePw_submit{
	cursor: pointer;
}
</style>

<div class="changePwPage">
<form id="merChangePwFrm" action="${ path }/merchant/changePw" method="POST">
<div class="merPw_Change_Title">비밀번호 변경하기</div>

<div class="merPw_Change_step">Step 1) 현재 사용하고 있는 비밀번호를 입력해주세요.</div>

	<div class="change_box">
	<input type="hidden" name="merId" value="${ loginMerchant.merId }" readonly/>
	<label class="labelMPw">현재 비밀번호</label><br>
	<input type="password" class="pwChangeInput curPw" id="merPassword" name="merPassword" required/>
	</div>

	<p>
		<input type="submit" id="changePw_submit" class="changePw_btn" value="다음 단계로 넘어가기" />
	</p>
	
	<br>
	<div id="find_mPw_btn">비밀번호를 잊으셨나요?</div>
	
</form>
</div>


<script>
$(function(){
	$("#find_mPw_btn").click(function(){
		location.href='${ path }/merchantMember/memberPwSearch';
	})
})


</script>

<div id="footer">
<%@ include file="../../views/common/footer.jsp"%>
</div>
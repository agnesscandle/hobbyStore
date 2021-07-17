<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.searchPwPage2 {
	padding: 7% 40% 8% 40%;
}

.mPw_Search_Title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 40px 0px;
}

.searchPw_btn, .pwSearchInput {
	font-size: 15px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 10px;
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

.inputMemPhone {
	margin-bottom: 0px;
}


.searchPw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.labelMName, .labelMPhone {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.search_box{
	margin-bottom: 5%;
}
</style>

<div class="searchPwPage2">
<form name="mPwSearchFrm2" id="PwSearchForm2" 
	action="${ path }/merchant/memberPwSearch2" method="POST">
	<div class="mPw_Search_Title">비밀번호 찾기</div>
	
	<div class="search_box">
	<label class="labelMName">이름</label><br>
	<input type="text" class="pwSearchInput" name="merName" id="merName" placeholder="홍길동" required><br>
	<label class="labelMPhone">휴대전화</label><br>
	<input type="text" class="pwSearchInput inputMemPhone" name="merPhone" id="merPhone" placeholder="(-)없이 숫자만 입력" required/> <input id="sendPhoneNumber" class="pwSearchInput" type="button" value="인증번호 받기">
	<input type="text"  class="pwSearchInput" id="inputCertifiedNumber" name="phNumCode" placeholder="인증번호 6자리 숫자 입력" required/>
	</div>
	<p>
		<button type="button" id="checkBtn" class="searchPw_btn">인증번호 확인</button>
	</p>
	
	
	
	
	

	

</form>
</div>

<script>
$(function(){
	$("#find_mId_btn").click(function(){
		location.href='${ path }/member/memberIdSearch';
	})
})


// 핸드폰 인증번호
   $('#sendPhoneNumber').click(function(){
    let phoneNumber = $('.inputMemPhone').val();
    alert('인증번호 발송 완료!');

    $.ajax({
        type: "post",
        url: "${path}/member/checkSMS",
        data: {
            "phoneNumber" : phoneNumber
        },
        success: function(res){
            $('#checkBtn').click(function(){
                if($.trim(res) != $('#inputCertifiedNumber').val()){
                	alert('인증번호가 올바르지 않습니다!');
                	return false;
                } else {
                	alert('고객님의 핸드폰으로 임시비밀번호가 발송되었습니다. 로그인 후 비밀번호를 재설정해주세요!');
                	
                	$.ajax({
                		type: "post",
                        url: "${path}/member/sendNewPw",
                        data: {
                            "phoneNumber" : phoneNumber
                        },
                        success: function(ss){
                        	console.log('임시비밀번호 재발급 완료');
                        	location.href='${ path }';
                        }
                	});
                }
            })
        }
    });
});

</script>

<%@ include file="../../views/common/footer.jsp"%>

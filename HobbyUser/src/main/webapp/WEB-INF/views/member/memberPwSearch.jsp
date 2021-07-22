<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">

<style>
.searchPwPage {
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

.labelMId {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.searchPw_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.search_box{
	margin-bottom: 8%;
}

#find_mId_btn{
	font-size: 14px;
	color: rgb(163, 162, 162);
}

#searchPw_submit {
	cursor: pointer;
}

/* 라디오 체크 */
#PwSearchForm .login_gubun{ width:187px; margin:0 auto; display:block; }
#PwSearchForm .container_radio { display: inline-block; position: relative; padding-left: 35px; white-space:nowrap; cursor: pointer; font-size: 18px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
#PwSearchForm .container_radio input { position: absolute; opacity: 0; cursor: pointer; }
#PwSearchForm .checkmark { position: absolute; top: 0; left: 0; height: 23px; width: 23px; border:1px solid #dae0e9; border-radius: 50%; }
#PwSearchForm .container input:checked ~ .checkmark { background-color: #fff; }
#PwSearchForm .checkmark:after { content: ""; position: absolute; display: none; }
#PwSearchForm .container_radio input:checked ~ .checkmark:after { display: block; }
#PwSearchForm .container_radio .checkmark:after { top: 6px; left: 6px; width: 11px; height: 11px; border-radius: 50%; background:rgb(32, 51, 84); }
#PwSearchForm .gubun_cont label:first-child{ margin-right:40px; margin-bottom: 15px;}

</style>

<div class="searchPwPage">
<form name="form" id="PwSearchForm" 
	 method="POST">
	<div class="mPw_Search_Title">비밀번호 찾기</div>
	
	<div class="login_gubun">
	<div class="gubun_cont">
      <label for="member_flag_mem" class="container_radio" >
         손님
      <input type="radio" id="member_flag_mem" name="member_flag"  value="m" checked>
      <span class="checkmark"></span>
      </label>
      
      <label for="member_flag_mer" class="container_radio" >
         상인
      <input type="radio" id="member_flag_mer" name="member_flag"  value="s">   
      <span class="checkmark"></span>
      </label>
   </div>
   </div>
   
	<div class="search_box">
	<label class="labelMId">아이디</label><br>
	<input type="text" class="pwSearchInput" name="memId" id="memId" placeholder="hobbymarket"/>
	<div id="find_mId_btn">아이디를 잊으셨나요?</div>
	</div>
	
	<p>
		<button type="submit" id="searchPw_submit" class="searchPw_btn" onclick="radio_chk();">다음</button>
	</p>

</form>
</div>

<script>

<!-- 아이디찾기 페이지로 이동 -->
$(function(){
	$("#find_mId_btn").click(function(){
		location.href='${ path }/member/memberIdSearch';
	})
})

$("#searchPw_submit").on("click",function(){
	var id = $("#memId").val();
	
	if(id == ""){
		alert("아이디를 입력해주세요!");
		return false;
	}
});


function radio_chk(){
	var member_flag = $('input[name=member_flag]:checked').val();
	
	if(member_flag == 'm'){
		form.action='${path}/member/memberPwSearch';
		
	}
	
	if(member_flag == 's'){
		form.action='${path}/merchant/findPw';
	}
}
</script>


<%@ include file="../../views/common/footer.jsp"%>

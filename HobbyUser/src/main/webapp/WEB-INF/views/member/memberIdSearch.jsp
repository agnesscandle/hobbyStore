<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/css/member_css/login.css">



<div id="findIdPage">
<form name="form" id="idSearchForm" method="POST" name="form">
	<div class="mId_Search_Title">아이디 찾기</div>
	
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
		<label class="labelMname">이름</label><br>
		<input type="text" class="idSearchInput"  name="memName" id="memName" placeholder="홍길동"/>
		<div class="name regex"></div>
	</div>
	
	<div class="search_box">
		<label class="labelMemail">이메일 주소</label><br>
		<input type="email" class="idSearchInput" name="memEmail" id="memEmail" placeholder="hobbyuser@market.com"/>
		<div class="email regex"></div>
	</div>
	
	
   
   
	<p>
		<button type="submit" id="searchId_submit" class="searchId_btn" onclick="radio_chk();">아이디 찾기</button>
	</p>



</form>
</div>

<style>
#findIdPage {
	padding: 5% 40% 10% 40%;
}

.mId_Search_Title {
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: black;
	margin: 0px 0px 40px 0px;
}

.searchId_btn, .idSearchInput {
	font-size: 14px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px;
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

.labelMname, .labelMemail {
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.regex {
	font-size: 14px;
	padding: 5px 0;
	color: red;
}

.search_box{
	margin-bottom: 8%;
}

.searchId_btn {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

#searchId_submit{
	cursor: pointer;
}

/* 라디오 체크 */
#findIdPage .login_gubun{ width:187px; margin:0 auto; display:block; }
#findIdPage .container_radio { display: inline-block; position: relative; padding-left: 35px; white-space:nowrap; cursor: pointer; font-size: 18px; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; }
#findIdPage .container_radio input { position: absolute; opacity: 0; cursor: pointer; }
#findIdPage .checkmark { position: absolute; top: 0; left: 0; height: 23px; width: 23px; border:1px solid #dae0e9; border-radius: 50%; }
#findIdPage .container input:checked ~ .checkmark { background-color: #fff; }
#findIdPage .checkmark:after { content: ""; position: absolute; display: none; }
#findIdPage .container_radio input:checked ~ .checkmark:after { display: block; }
#findIdPage .container_radio .checkmark:after { top: 6px; left: 6px; width: 11px; height: 11px; border-radius: 50%; background:rgb(32, 51, 84); }
#findIdPage .gubun_cont label:first-child{ margin-right:40px; margin-bottom: 15px;}

</style>

<script>
//이름 유효성 검사
$("#memName").on("input",function(){
    var regex = /[가-힣]{2,}/;
    var result = regex.exec($("#memName").val());
    
    if(result != null){
       $(".name.regex").html("");  
    }else{
        $(".name.regex").html("한글만 입력 가능합니다.");
    }
}); 

//email유효성 검사
$("#memEmail").on("input",function(){
     var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     var result = regex.exec($("#memEmail").val());
    
    if(result != null){
       $(".email.regex").html("");  
    }else{
        $(".email.regex").html("올바른 이메일이 아닙니다");
    }
});

function radio_chk(){
	var member_flag = $('input[name=member_flag]:checked').val();
	
	if(member_flag == 'm'){
		form.action='${path}/member/memberIdSearch';
		
	}
	
	if(member_flag == 's'){
		form.action='${path}/merchant/idSearch';
	}
}

</script>
	<%@ include file="../../views/common/footer.jsp"%>

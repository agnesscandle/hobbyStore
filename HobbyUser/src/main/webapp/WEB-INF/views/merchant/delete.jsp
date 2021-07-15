<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
a {
	text-decoration: none
}

.deletePage {
	padding: 10% 33% 10% 33%;
}


.cont_intro {
	font-size: 18px;
}

.txt_agree {
	line-height: 28px;
}

.emph_g {
	color: red;
}

.delMemInput {
	font-size: 16px;
	font-weight: normal;
	line-height: 20px;
	letter-spacing: -0.15px;
	margin-bottom: 30px;
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

.delMId, .delMPw {
	display: inline-block;
	text-align: right;
	font-size: 20px;
	font-weight: 600;
	padding-bottom: 8px;
}

.delete_btn {
	cursor: pointer;
}

.btn_comm {
	display: inline-block;
	font-size: 20px;
	font-weight: normal;
	line-height: 20px;
	letter-spacing: -0.15px;
	border: 1px solid rgb(214, 212, 212);
	background-color: white;
	width: 320px;
	height: 48px;
	flex: 1 1 auto;
	color: rgb(26, 26, 26);
	padding: 16px;
	border-radius: 3px;
}

.btn_cancle {
	background-color: rgb(32, 51, 84);
	color: white;
	font-weight: bold;
	font-size : 20px;
}

.btn_confirm {
	cursor: pointer;
	font-weight: bold;
	font-size: 20px;
	color: rgb(32, 51, 84);
}
.wrap_btn {
	text-align: center;
}
</style>
<div class="deletePage">
	<div class="cont_intro">
		<h2>안전한 회원 탈퇴를 위해, 비밀번호를 확인해주세요.</h2>
		<br> <span class="txt_agree"> 비밀번호 확인 후 아이디는 즉시 탈퇴됩니다.<br>
			탈퇴 후에는 <span class="emph_g"> 동일 아이디로 다시 가입할 수 없으며,</span> <br>
			아이디와 데이터는 복구할 수 없으니 신중하게 선택해 주세요.
		</span>
	</div>
	<form id="memberDelFrm" action="${ path }/merchant/delete" method="POST">
		<br> <br>

		<div class="delete_box">
			<label class="delMId">아이디</label><br> <input type="text"
				class="delMemInput" name="merId" id="merId"
				value="${ loginMember.merId }" readonly />
		</div>

		<div class="delete_box">
			<label class="delMPw">비밀번호 입력</label><br> 
			<input type="password"
				class="delMemInput" name="merPassword" id="merPassword" required />
		</div>


		<div class="wrap_btn">
			<button type="button" class="delete_btn"
				onclick="location.href='${path}/merchant/merMain'">
				<span class="btn_comm btn_cancle">취소</span>
			</button>

			<button type="submit" class="delete_btn">
				<span class="btn_comm btn_confirm">탈퇴</span>
			</button>
		</div>




	</form>
</div>


<script>
	
</script>


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
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

dl, ul, ol, menu, li {
	list-style: none;
}

strong {
	font-weight: bolder;
	font-size: 22px;
	line-height: 60px;
}

#mDeleteFrm {
	padding: 0% 21% 5% 21%;
}

.info_user {
	border: 1px solid black;
	margin-bottom: 30px;
	padding: 30px 30px;
}

.info_user .txt_agree {
	line-height: 30px;
}

.list_agree {
	padding: 10px 10px;
}

.tit_service {
	float: left;
	width: 88px;
	padding-bottom: 0;
	color: #666;
	font-size: 16px;
	font-weight: 700;
	text-decoration: underline;
	text-indent: 0;
	clear: both;
}

.txt_service {
	margin: 0 0 6px 88px;
	color: #818181;
}

.emph_g {
	color: red;
}

.dlogo {
	display: inline;
	text-transform: uppercase;
	letter-spacing: 5px;
	font-size: 23px;
	font-family: 'Noto Sans KR', sans-serif;
}

.dlogoImg {
	position: relative;
	top: 25px;
	left: 5px;
	width: 60px;
	height: 60px;
}

.dlogo h3 {
	display: inline-block;
	margin-left: 10px;
}

.deleteInfo_intro {
	text-align: center;
	width: 100%;
	overflow: hidden;
	height: 147px;
}

.wrap_btn {
	text-align: center;
}

.btn_comm {
	display: inline-block;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	letter-spacing: -0.15px;
	border: 1px solid rgb(214, 212, 212);
	background-color: white;
	width: 200px;
	height: 48px;
	flex: 1 1 auto;
	color: rgb(26, 26, 26);
	padding: 16px;
	border-radius: 3px;
}

.btn_next {
	cursor: pointer;
	font-weight: bold;
	font-size: 18px;
	color: rgb(32, 51, 84);
}

.btn_cancle {
	cursor: pointer;
	background-color: rgb(32, 51, 84);
	font-weight: bold;
	font-size: 18px;
	color: white;
}
</style>

<div id="deleteContent" role="main">
	<div id="mArticle">
		<div class="dimmed_layer" style="display: none"></div>
		<div class="deleteInfo_intro intro_out">
			<div class="dLogo">
				<img class="dlogoImg" src="${ path }/images/deleteIntro.png">
				<h3 class="tit_comm tit_outagree">회원 탈퇴에 앞서 유의사항 및 안내를 반드시 읽고
					진행해 주세요!</h3>
			</div>
		</div>

		<form id="mDeleteFrm" action="${ path }/member/delete" method="get">
			<div class="info_user">
				<strong class="tit_agree">내 정보 및 개인형 서비스 이용 기록 삭제 안내</strong><br>
				<span class="txt_agree"> 내 정보 및 개인형 서비스 이용 기록이 모두 삭제되며, <span
					class="emph_g">삭제된 데이터는 복구되지 않습니다.</span>
				</span>
				<dl class="list_agree">
					<dt class="tit_service">개인정보</dt>
					<dd class="txt_service">아이디, 메일, 전화번호 등 개인정보 삭제</dd>
					<dt class="tit_service">취미이용</dt>
					<dd class="txt_service">좋아요 한 취미, 결제 내역 삭제</dd>
				</dl>
				<span class="cehck_notice"> <input type="checkbox"
					id="serviceAgree" name="serviceAgree" class="tf_check"> <label
					for="serviceAgree" class="lab_check"> <span
						class="ico_comm ico_check"></span> 동의
				</label>
				</span>
			</div>
			<div class="info_user">
				<strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong><br>
				<span class="txt_agree"> 삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 삭제하시기
					바랍니다. <br> 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <span
					class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</span>
				</span>
				<dl class="list_agree">
					<dt class="tit_service">게시판</dt>
					<dd class="txt_service">나의 질문 및 답변, 내가 남긴 의견 등</dd>
					<dt class="tit_service">기타</dt>
					<dd class="txt_service">공적인 영역의 게시물과 댓글, 의견 등</dd>
				</dl>
				<span class="cehck_notice"> <input type="checkbox"
					id="boardAgree" name="boardAgree" class="tf_check"> <label
					for="boardAgree" class="lab_check"> <span
						class="ico_comm ico_check"></span> 동의
				</label>
				</span>
			</div>
			<div class="wrap_btn">
				<button type="button" 
					onclick="location.href='${path}/member/myInfo'">
					<span class="btn_comm btn_cancle">취소</span>
				</button>
				<button type="submit" id="delete_btn">
					<span class="btn_next btn_comm">다음 단계</span>
				</button>
			</div>
		</form>

	</div>
	<!-- mArticle -->
</div>
<!-- deleteContent -->


<script>
	//약관동의 체크 했는지 검사
	$("#delete_btn")
			.click(
					function() {
						if ($("input:checkbox[name='serviceAgree']").is(
								":checked") == false) {
							alert('안내에 동의해주세요.');
							return false;
						} else if ($("input:checkbox[name='boardAgree']").is(
								":checked") == false) {
							alert('안내에 동의해주세요.');
							return false;
						} else {
							$("#delete_btn").submit();
						}
					});
</script>


<%@ include file="../../views/common/footer.jsp"%>

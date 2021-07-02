<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<style>

div {
	display: block;
}

#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}

.dimmed_layer {
    position: fixed;
    z-index: 9999999;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #000;
    opacity: .5;
}



.dlogo{
    display : inline;
    padding-left : 20px; 
    text-transform: uppercase;
    letter-spacing: 5px;
    font-size: 20px;
    font-family : 'Noto Sans KR', sans-serif;
}

.dlogoImg{
   position : relative;
   top : 25px;
   left : 20px; 
   width: 70px;
   height: 70px;
}

.dlogo h3{
    display : inline-block;
    margin-left: 30px;
}

.deleteInfo_intro {
    width: 100%;
    overflow: hidden;
    height: 147px;
}

.deleteInfo_intro .tit_comm {
    height: 26px;
    margin-bottom: 14px;
}

.intro_out .tit_outagree {
    width: 850px;
    background-position: 0 -1565px;
}

</style>

<div id="deleteContent" role="main">
	<div id="mArticle">
		<div class="dimmed_layer" style="display:none"></div>
			<div class="deleteInfo_intro intro_out">
			<div class="dLogo">
				<img class="dlogoImg" src="${ path }/images/deleteIntro.png">
					<h3 class="tit_comm tit_outagree">회원 탈퇴에 앞서 유의사항 및 안내를 반드시 읽고 진행해 주세요!</h3>
			</div>
			</div>
	<form id="mDeleteFrm" action="${ path }/member/deleteAgree" method="get">
		<div class="info_agree">
			<div class="info_user">
				<strong class="tit_agree">내 정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
				<span class="txt_agree">
					"내 정보 및 개인형 서비스 이용 기록이 모두 삭제되며,"
					<em class="emph_g">삭제된 데이터는 복구되지 않습니다.</em>
				</span>
				<dl class="list_agree">
					<dt class="tit_service">개인정보</dt>
					<dd class="txt_service">아이디, 메일, 전화번호 등 개인정보 삭제</dd>
					<dt class="tit_service">취미이용</dt>
					<dd class="txt_service">좋아요 한 취미, 결제 내역 삭제</dd>
				</dl>
				<span class="cehck_notice">
					<input type="checkbox" id="serviceAgree" name="serviceAgree" class="tf_check">
					<label for="serviceAgree" class="lab_check">
						<span class="ico_comm ico_check"></span>
						" 동의 "
					</label>
				</span>
			</div>
			<div class="info_user">
				<strong class="tit_agree">게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
				<span class="txt_agree">
					"삭제를 원하는 게시글이 있다면 반드시 회원탈퇴 전 삭제하시기 바랍니다."
					<br>
					"탈퇴 후에는 회원정보가 삭제되어 본인 여부르루 확인할 수 있는 방법이 없어, "
					<em class="emph_g">게시글을 임의로 삭제해드릴 수 없습니다.</em>
				</span>
				<dl class="list_agree">
					<dt class="tit_service">게시판</dt>
					<dd class="txt_service">나의 질문 및 답변, 내가 남긴 의견 등</dd>
					<dt class="tit_service">기타</dt>
					<dd class="txt_service">공적인 영역의 게시물과 댓글, 의견 등</dd>
				</dl>
				<span class="cehck_notice">
					<input type="checkbox" id="boardAgree" name="boardAgree" class="tf_check">
					<label for="boardAgree" class="lab_check">
						<span class="ico_comm ico_check"></span>
						" 동의 "
					</label>
				</span>
			</div>
		</div>
		<div class="wrap_btn">
			<a href="${ path }/member/myInfo" class="btn_comm btn_cancle" data-tiara-action-name="탈퇴_취소">
				<span class="screen_out">탈퇴 취소</span>
			</a>
			<button type="button" class="btn_comm btn_next" onclick="location.href='${path}/member/delete'" data-tiara-action-name="다음_단계">
				<span class="screen_out">다음 단계</span>
			</button>
		</div>
	</form>
	
			
	</div> <!-- mArticle -->
</div> <!-- deleteContent -->


<script>

</script>


<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<style>

#footer {
	position: fixed;
	background-color: white; 
	left: 0;
	right: 0;
	bottom: 50;
	height: 6rem;
}

.memInfo_side{
	float: left; 
	padding: 5% 2% 40% 4%;
}

.memInfo{
	margin-bottom: 50%;
}

.infoMemName{
	display: inline-block;
	text-align: right;
	font-size: 23px;
	color: rgb(32, 51, 84);
	font-weight: 600;
}

.infoMemId, .infoMemEmail{
	display: inline-block;
	text-align: right;
	font-size: 18px;
	color: rgb(119, 134, 145);
	font-weight: 600;
}

.organizeInfo{
	color: rgb(32, 51, 84);
	display: inline-block;
	text-align: right;
	font-size: 24px;
	font-weight: 600;
}

.Info_update_Mem{
	font-size: 18px;
	color: rgb(32, 51, 84);
	font-weight: 600;
	padding: 10px 0px 0px 0px; ;
}


</style>


<aside class="memInfo_side">
<div class="memInfo">
<img src="${ path }/profile/${ loginMember.memImgRename }" width="150" height="150" /><br>
<span class="infoMemName">${ loginMember.memName }</span> 
<span class="infoMemId">/ ${ loginMember.memId }</span><br>
<span class="infoMemEmail">${ loginMember.memEmail }</span>
</div>

<div class="manageInfo">
<div class="organizeInfo">내 정보 관리</div>
<div id="updateInfo_btn" class="Info_update_Mem">프로필 수정</div>
<div id="changePw_btn" class="Info_update_Mem">비밀번호 변경</div>
<div id="deleteInfo_btn" class="Info_update_Mem">회원 탈퇴</div>
<div class="Info_update_Mem">예약 관리</div>
<div class="Info_update_Mem">좋아요 관리</div>
</div>
</aside>

<section>
<div class="page-wrapper" >
	<!--page slider -->
      <h1 class="silder-title">예약한 취미</h1>
      <div class="slider slider-nav">
      <div>
         <!-- 쿼리로 이미지 가져올 부분  -->
         <img  class="slider-image" src="${ path }/images/logo.png">
      </div>
      <div>
         <img class="slider-image" src="${ path }/images/logo.png">
      </div>
      <div>
         <img class="slider-image" src="${ path }/images/logo.png">
      </div>
      <div>
         <img class="slider-image" src="${ path }/images/logo.png">
      </div>
      <div>
         <img class="slider-image" src="${ path }/images/logo.png">
      </div>
   </div>
</div>
</section>


<script>
<!-- 회원정보 수정 페이지 이동 -->
$(function(){
	$("#updateInfo_btn").click(function(){
		location.href='${ path }/member/updateMyInfo';
	})
})

<!-- 비밀번호 변경 페이지 이동 -->
$(function(){
	$("#changePw_btn").click(function(){
		location.href='${ path }/member/changePw';
	})
})

<!-- 회원 탈퇴 페이지 이동 -->
$(function(){
	$("#deleteInfo_btn").click(function(){
		location.href='${ path }/member/deleteAgree';
	})
})

$('.slider-nav').slick({
      slidesToShow : 3,
      slidesToScroll : 1,
      dots : true,
      focusOnSelect : true
   });

   $('a[data-slide]').click(function(e) {
      e.preventDefault();
      var slideno = $(this).data('slide');
      $('.slider-nav').slick('slickGoTo', slideno - 1);
   });
</script>

<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
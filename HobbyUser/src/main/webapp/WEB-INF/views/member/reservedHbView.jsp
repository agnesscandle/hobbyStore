<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>



<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/myInfo.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<style>

</style>

<main>
<div class="memInfo_side">
<div class="memInfo">
<div class="profilePic-wrapper">

<!-- 등록된 이미지가 없는 경우 -->
<c:if test="${ loginMember.memImgRename == null }">
<img src="${ path }/images/memUser.png"  class="adjustImage"  /><br>
</c:if>

<!-- 등록된 이미지가 있는 경우 -->
<c:if test="${ loginMember.memImgRename != null }">
<img src="${ path }/profile/${ loginMember.memImgRename }" class="adjustImage"  /><br>
</c:if>

</div>
<span class="infoMemName">${ loginMember.memName }</span> 
<span class="infoMemId">/ ${ loginMember.memId }</span><br>
<span class="infoMemEmail">${ loginMember.memEmail }</span>
</div>

<div class="manageInfo">
<div class="organizeInfo">내 정보 관리</div>
<div id="updateInfo_btn" class="Info_update_Mem">프로필 수정</div>
<div id="changePw_btn" class="Info_update_Mem">비밀번호 변경</div>
<div id="deleteInfo_btn" class="Info_update_Mem">회원 탈퇴</div>
<div id="rsHb_btn" class="Info_update_Mem">예약 관리</div>
<div id="likedHb_btn" class="Info_update_Mem">좋아요 관리</div>

</div>
</div>

<div class="reserved-wrap">
<h2>예약 상세</h2>


</div>

</main>

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

<!-- 좋아요 관리 페이지 이동 -->
$(function(){
   $("#likedHb_btn").click(function(){
      location.href='${ path }/member/likedHobby';
   })
})

<!-- 예약 관리 페이지 이동 -->
$(function(){
   $("#rsHb_btn").click(function(){
      location.href='${ path }/member/reservedHobby';
   })
})

</script>

   <%@ include file="../../views/common/footer.jsp"%>
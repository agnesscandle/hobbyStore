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
body { min-height: 100vh; /* 최소 높이를 지정 */ display: flex; flex-direction: column; }

footer { margin-top: auto; /* 최소 높이 하단에서 자동으로 뻗어나가도록 설정 */ }


.profilePic-wrapper{
   height: 150px;
   width: 150px;
   position: relative;
   margin-bottom: 10px;
   overflow: hideen;
}

.adjustImage {
   height: 150px;
   width: 150px;
   border: 2px solid rgb(32, 51, 84);
   border-radius: 50%;
}

.memInfo_side{
   float: left;
   padding: 2% 2% 10% 4%;
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
   padding: 10px 0px 0px 0px; 
   cursor: pointer;
}

*{margin:0; padding:0;}

li {list-style: none;}

.slide-wrapper{
   position: relative;
   width: 1100px;
   margin: 0 auto;
   height: 250px;
   overflow: hidden;
}

.slides{
   position: absolute;
   left:0; top:0;
   transition: left 0.5s ease-out;
}

.slides li:not(:last-child){
   float: left;
   margin-right: 30px;
}

.controls{
   text-align: center;
   margin-top: 30px;
}

.controls span{
   background:#333;
   color: #fff;
   padding: 10px 20px;
   margin:0 10px;
}



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
<div class="Info_update_Mem">예약 관리</div>
<div class="Info_update_Mem">좋아요 관리</div>
</div>
</div>



<h2>예약한 취미</h2>
<br><br>
<div class="slide-wrapper">
   <ul class="slides">
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   </ul>
</div>

   <p class="controls">
      <span class="prev">prev</span>
      <span class="next">next</span>
   </p>
   
<h2>좋아요 취미</h2>
<br><br>
<div class="slide-wrapper">
   <ul class="slides">
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   <li><img src="${ path }/images/testImage.png" style="width:250px; height:250px;" alt=""></li>
   </ul>
</div>

   <p class="controls">
      <span class="prev">prev</span>
      <span class="next">next</span>
   </p>
   
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

<!--  slide -->
var slides = document.querySelector('.slides'),
   slide = document.querySelectorAll('.slides li'),
   currentIdx = 0,
   slideCount = slide.length,
   prevBtn = document.querySelector('.prev'),
   slideWidth = 250,
   slideMargin = 30,
   nextBtn = document.querySelector('.next');
   
   slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin + 'px';
   
   function moveSlide(num){
      slides.style.left =  -num * 280 + 'px';
      currentIdx = num;
  	  console.log(slideCount);
   }
   
   
   nextBtn.addEventListener('click', function(){
      if(currentIdx < slideCount - 3){
         moveSlide(currentIdx + 1);
         console.log(slideCount);
      }else{
         moveSlide(0);
      }
         
      });
   
   prevBtn.addEventListener('click', function(){
	      if(currentIdx > 0){
	         moveSlide(currentIdx - 1);
	      }else{
	         moveSlide(slideCount - 3);
	      }
	         
	      });
</script>

   <%@ include file="../../views/common/footer.jsp"%>
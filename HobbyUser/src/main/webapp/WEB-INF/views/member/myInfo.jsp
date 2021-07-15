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



<h2>예약한 취미</h2>
<br><br>
<div class="main">
  <div class="slider slider-for">
    <div>
    <c:if test="${ hobbyList != null }">
			<c:forEach var="hobby" items="${ hobbyList }">
					<div class="item_h">
						<!-- 썸네일 이미지 -->
						<img id="thumImg_h"
							src="${path}/resources/upload/hobby/${hobby.hbThumRename}">
						<div class="detail_h">
							<div class="title_h">

								<!-- 제목 -->
								<h2>
									${hobby.cateName}<em>${hobby.hbTitle}</em>
								</h2>

								<!-- 금액(할인 적용 시) -->
								<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
									<c:set var="disFee"
										value="${ hobby.hbFee - (hobby.hbFee * hobby.hbDiscountRate / 100)}" />
									<fmt:formatNumber value="${disFee}" type="number"
										var="discountFee" />
									<fmt:formatNumber value="${hobby.hbFee}" type="number"
										var="originalFee" />
									<span class="price_h">
										<div class="discount_h">
											${ hobby.hbDiscountRate }% &nbsp;
											<del>${originalFee}원</del>
										</div> <b>${discountFee}원 </b>
									</span>
								</c:if>

								<!-- 금액(할인 미적용 시) -->
								<c:if test="${ hobby.hbDiscountStatus eq 'N' }">
									<fmt:formatNumber value="${hobby.hbFee}" type="number"
										var="originalFee" />
									<span class="price"> <b>${ originalFee }원</b>
									</span>
								</c:if>

							</div>

							<!-- 상세 내용 -->
							<div class="info_h">
								<div class="size_h">
									<label><b>Details</b></label>
									<c:out value="${hobby.hbSummary}"></c:out>
								</div>
							</div>
							<button
								onclick="location.replace('${path}/hobby/view?hbNo=${hobby.hbNo}')"
								class="add-cart_h">자세히 보기</button>
						</div>
					</div>
			</c:forEach>
		</c:if>
    </div>
  </div>
  </div>

<!--  
<div class="divList_h">
	<div class="containerList_h">
		<c:if test="${ hobbyList != null }">
			<c:forEach var="hobby" items="${ hobbyList }">
					<div class="item_h">
						<img id="thumImg_h"
							src="${path}/resources/upload/hobby/${hobby.hbThumRename}">
						<div class="detail_h">
							<div class="title_h">

								<h2>
									${hobby.cateName}<em>${hobby.hbTitle}</em>
								</h2>

								<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
									<c:set var="disFee"
										value="${ hobby.hbFee - (hobby.hbFee * hobby.hbDiscountRate / 100)}" />
									<fmt:formatNumber value="${disFee}" type="number"
										var="discountFee" />
									<fmt:formatNumber value="${hobby.hbFee}" type="number"
										var="originalFee" />
									<span class="price_h">
										<div class="discount_h">
											${ hobby.hbDiscountRate }% &nbsp;
											<del>${originalFee}원</del>
										</div> <b>${discountFee}원 </b>
									</span>
								</c:if>

								<c:if test="${ hobby.hbDiscountStatus eq 'N' }">
									<fmt:formatNumber value="${hobby.hbFee}" type="number"
										var="originalFee" />
									<span class="price"> <b>${ originalFee }원</b>
									</span>
								</c:if>

							</div>

							<div class="info_h">
								<div class="size_h">
									<label><b>Details</b></label>
									<c:out value="${hobby.hbSummary}"></c:out>
								</div>
							</div>
							<button
								onclick="location.replace('${path}/hobby/view?hbNo=${hobby.hbNo}')"
								class="add-cart_h">자세히 보기</button>
						</div>
					</div>
			</c:forEach>
		</c:if>
	</div>
</div>
-->		

<!--  
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
 -->  
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

<!--  slide 
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
   -->

   $('.slider-for').slick({
	   slidesToShow: 3,
	   slidesToScroll: 1,
	   arrows: true,
	   dots: true,
	   fade: true,
	   focusOnSelect: true
	 });
	
</script>

   <%@ include file="../../views/common/footer.jsp"%>
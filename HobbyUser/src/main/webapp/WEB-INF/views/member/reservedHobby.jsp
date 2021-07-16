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
<link rel="stylesheet" href="${path}/css/member_css/likedHobby.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>



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


<span class="mainLabel"><h2>예약한 취미</h2></span>
<div class="divList_h">
	<div class="containerList_h">
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
								onclick="location.replace('${path}/member/reservedHbView?hbNo=${hobby.hbNo}')"
								class="add-cart_h">자세히 보기</button>
						</div>
					</div>
			</c:forEach>
		</c:if>
	</div>
</div>		

<div id="pageBar">
   <!-- 맨 처음으로 -->
   <button onclick="location.href='${path}/member/reservedHobby?page=1'">&lt;&lt;</button>

   <!-- 이전 페이지로 -->
   <button
      onclick="location.href='${path}/member/reservedHobby?page=${ pageInfo.prvePage }'">&lt;</button>

   <!--  10개 페이지 목록 -->

   <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
      step="1" varStatus="status">
      <c:if test="${pageInfo.currentPage == status.current }">
         <button disabled>
            <c:out value="${status.current}" />
         </button>
      </c:if>
      <c:if test="${pageInfo.currentPage != status.current }">
         <button
            onclick="location.href='${path}/member/reservedHobby?page=${status.current}'">
            <c:out value="${status.current}" />
         </button>
      </c:if>
   </c:forEach>
   <!-- 다음 페이지로 -->
   <button
      onclick="location.href='${path}/member/reservedHobby?page=${pageInfo.nextPage}'">&gt;</button>

   <!-- 맨 끝으로 -->
   <button
      onclick="location.href='${path}/member/reservedHobby?page=${pageInfo.maxPage}'">&gt;&gt;</button>
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
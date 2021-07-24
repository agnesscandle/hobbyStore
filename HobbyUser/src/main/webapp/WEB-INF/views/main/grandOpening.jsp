<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${path}/css/main/open.css">



<div class="openTitle"><h2>오픈 예정 취미💙</h2></div>
<div class="divList">
	<div class="containerList">
		<c:if test="${ list != null}">
			<c:forEach var="hobby" items="${ list }">
				<div class="item">

					<!-- 썸네일 이미지 -->
					<img id="thumImg"
						src="${path}/resources/upload/hobby/${hobby.hbThumRename}">
					<div class="detail">
						<div class="title">

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
								<span class="price">
									<div class="discount">
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
						<div class="info">
							<div class="size">
								<label><b>Details</b></label>
								<c:out value="${hobby.hbSummary}"></c:out>
							</div>
						</div>
						<button
							onclick="location.replace('${path}/hobby/view?hbNo=${hobby.hbNo}')"
							class="add-cart">자세히 보기</button>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<div id="pageBar">
   <!-- 맨 처음으로 -->
   <button onclick="location.href='${path}/main/grandOpening?page=1'">&lt;&lt;</button>

   <!-- 이전 페이지로 -->
   <button
      onclick="location.href='${path}/main/grandOpening?page=${ pageInfo.prvePage }'">&lt;</button>

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
            onclick="location.href='${path}/main/grandOpening?page=${status.current}'">
            <c:out value="${status.current}" />
         </button>
      </c:if>
   </c:forEach>
   <!-- 다음 페이지로 -->
   <button
      onclick="location.href='${path}/main/grandOpening?page=${pageInfo.nextPage}'">&gt;</button>

   <!-- 맨 끝으로 -->
   <button
      onclick="location.href='${path}/main/grandOpening?page=${pageInfo.maxPage}'">&gt;&gt;</button>
</div>

<script>
	$('.size span, .color span').click(function() {
		$(this).addClass('active')
		$(this).siblings().removeClass('active')
	})
	
</script>

<%@ include file="../../views/common/footer.jsp"%>
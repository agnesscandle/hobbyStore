<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${path}/css/main/main.css">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

	<div class="slick-slider js-slick">
		<div class="photo is-animating"
			style="background-image: url('${path}/images/메인배너4.png'); width: 1280px "
			onclick="location.href='${ path }/hobby/list/search?searchDate=맥주';">
		</div>
		<div class="photo"
			style="background-image: url('${path}/images/메인배너5.png');"
			onclick="location.href='${ path }/hobby/list/search?searchDate=주식';">
		</div>
		<div class="photo"
			style="background-image: url('${path}/images/타로배너.png');"
			onclick="location.href='${ path }/hobby/list/search?searchDate=타로';"></div>
	</div>

<div class="mainentire-box">
<span class="mainLabel_s"><h2>스킬 up!</h2></span><button class="seeAll1 btn_all" onclick="location.href='${ path }/main/skillUp'">전체보기</button>
<div class="divList_h">
	<div class="containerList_h">
		<c:if test="${ listS != null }">
			<c:forEach var="hobby" items="${ listS }">
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
<span class="mainLabel_s"><h2>지금 할인중인 취미!</h2></span><button class="seeAll2 btn_all" onclick="location.href='${ path }/main/discount'">전체보기</button>
<div class="divList_h">
	<div class="containerList_h">
		<c:if test="${ listD != null}">
			<c:forEach var="hobby" items="${ listD }">
				<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
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
				</c:if>
			</c:forEach>
		</c:if>
	</div>
</div>
<span class="mainLabel_s"><h2>인기 UP!</h2></span><button class="seeAll3 btn_all" onclick="location.href='${ path }/main/popular'">전체보기</button>
<div class="divList_h">
	<div class="containerList_h">
		<c:if test="${ listP != null}">
			<c:forEach var="hobby" items="${ listP }">
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

<script>
	$(document).ready(
			function() {
				$('.js-slick').slick({
					autoplay : true,
					autoplaySpeed : 4000,
					dots : true,
					draggable : false,
					fade : true,
					speed : 1000
				});

				$('.js-slick').on('beforeChange',
						function(event, slick, currentSlide, nextSlide) {
							$(slick.$slides).removeClass('is-animating');
						});

				$('.js-slick').on(
						'afterChange',
						function(event, slick, currentSlide, nextSlide) {
							$(slick.$slides.get(currentSlide)).addClass(
									'is-animating');
						});
			});
	
	
</script>
<%@ include file="../views/common/footer.jsp"%>
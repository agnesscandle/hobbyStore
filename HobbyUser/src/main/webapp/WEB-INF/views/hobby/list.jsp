<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/header.jsp"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />


<style>
.divList {
	width: 1400px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: auto;
	padding-top: 100px;
	padding-bottom: 40px;
}

.containerList {
	display: grid;
	grid-column-gap: 30px;
	grid-row-gap: 30px;
	grid-template-rows: 280px 280px;
	grid-template-columns: 310px 310px 310px 310px;
}

@media ( max-width : 1023px) {
	.containerList {
		display: grid;
		grid-column-gap: 30px;
		grid-row-gap: 30px;
		grid-template-rows: 280px 280px 280px 280px;
		grid-template-columns: 310px 310px;
	}
}

@media ( max-width : 767px ) {
	.containerList {
		display: grid;
		grid-column-gap: 30px;
		grid-row-gap: 30px;
		grid-template-rows: 280px 280px 280px 280px 280px;
		grid-template-columns: 310px;
	}
}

/* item */
.item {
	border-radius: 5px;
	overflow: hidden;
	position: relative;
	margin: 5px;
	/*box-shadow: 0 0 20px rgba(0, 0, 0, 0.164);*/
}

.item img {
	transition: 0.5s;
}

.detail {
	background-color: #f8f8f8;
	position: absolute;
	width: 100%;
	bottom: -177px;
	left: 0;
	height: 250px;
	transition: 0.5s;
	padding: 5px 15px 5px 20px;
	box-sizing: border-box;
}

.item:hover .detail {
	bottom: 0;
}

.item:hover img {
	filter: blur(2px)
}
/* title */
.title {
	padding-top: 15px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
	overflow: hidden;
	margin-bottom: 15px;
	height: 70px;
}

.title h2 {
	width: 175px;
	font-size: 12px;
	color: #888;
	line-height: 1.2em;
	float: left;
}

.title h2 em {
	font-style: normal;
	display: block;
	margin-bottom: 5px;
	padding-top: 5px;
	color: #000;
	font-size: 14px;
}

.title .price {
	float: right;
	font-size: 12px;
	color: #000;
}

.info {
	position: relative;
}

#thumImg {
	width: 100%;
	height: 100%;
}
/* Size */
.size {
	font-size: 12px;
	width: 230px;
	height: 70px;
	padding-top: 10px;
	margin-bottom: 10px;
	box-sizing: border-box;
}

.size label {
	display: block;
	margin-bottom: 5px;
	font-size: 14px;
}

.price {
	text-align: right;
	width: 90px;
}

.price span {
	width: 17px;
	height: 17px;
	display: inline-block;
	margin-right: 6px;
	cursor: pointer;
}

.price .discount {
	color: red;
}

.price del {
	color: #d3d3d3;
}

.add-cart {
	border: 1px solid #ddd;
	border-radius: 10px;
	width: 100%;
	padding: 7px;
	background-color: #fff;
	color: #0E0C32;
	cursor: pointer;
	margin-top: 10px;
	outline: none;
}

.add-cart:hover {
	background-color: #0E0C32;
	color: #fff;
}

#pageBar {
	text-align: center;
	margin-top: 30px;
}
</style>

<div class="divList">
	<div class="containerList">
		<c:if test="${ list != null}">
			<c:forEach var="hobby" items="${ list }">
				<div class="item">
					<img id="thumImg"
						src="${path}/resources/upload/hobby/${hobby.hbThumRename}">
					<div class="detail">
						<div class="title">

							<h2>
								${hobby.cateName}<em>${hobby.hbTitle}</em>
							</h2>

							<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
								<c:set var="disFee"
									value="${ hobby.hbFee - (hobby.hbFee * hobby.hbDiscountRate / 100)}" />
								<fmt:formatNumber value="${disFee}" type="number" var="discountFee" />
								<fmt:formatNumber value="${hobby.hbFee}" type="number" var="originalFee" />
								<span class="price">
									<div class="discount">
											${ hobby.hbDiscountRate }% &nbsp;
											<del>${originalFee}원 </del>
									</div> 
									<b>${discountFee}원 </b>
							</c:if>

							<c:if test="${ hobby.hbDiscountStatus eq 'N' }">
								<fmt:formatNumber value="${hobby.hbFee}" type="number"
									var="originalFee" />
								<span class="price">
									<b>${ originalFee }원</b>
							</c:if>

							</span>


						</div>
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
	<button onclick="location.href='${path}/hobby/list?page=1'">&lt;&lt;</button>

	<!-- 이전 페이지로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${ pageInfo.prvePage }'">&lt;</button>

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
				onclick="location.href='${path}/hobby/list?page=${status.current}'">
				<c:out value="${status.current}" />
			</button>
		</c:if>
	</c:forEach>
	<!-- 다음 페이지로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${pageInfo.nextPage}'">&gt;</button>

	<!-- 맨 끝으로 -->
	<button
		onclick="location.href='${path}/hobby/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
</div>

<script>
	$('.size span, .color span').click(function() {
		$(this).addClass('active')
		$(this).siblings().removeClass('active')
	})
	$('.like').click(function() {
		$(this).toggleClass('active')
	})
</script>

<%@ include file="../../views/common/footer.jsp"%>
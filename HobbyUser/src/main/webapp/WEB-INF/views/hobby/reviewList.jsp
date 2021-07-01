<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/view.css">
<link rel="stylesheet" href="${path}/css/hobby/review.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<div class="detail" id="reviewAreaD">
	<div class="reviewDiv">
		<div id="reviewListTitle">
			<span> <c:out value="후기${ count }개" />
			</span> 
			<select name="sortReview" id="sortReview">
				<option value="high" selected="selected">평점 높은순</option>
				<option value="low">평점 낮은순</option>
				<option value="recent">최신순</option>
				<option value="help">도움순</option>

				</optgroup>
			</select>
			<c:if test="${loginMember != null}">
			<button type="button" id="btn-add"
				onclick="location.href='${path}/hobby/view/writeReview'">글쓰기</button>
		</c:if>
		</div>
		<div id="reviewList">
			<c:if test="${reviewList == null} ">
				<tr>
					<td colspan="6">조회된 후기가 없습니다.</td>
				</tr>

			</c:if>
			<c:if test="${ reviewList != null }">
				<c:forEach var="review" items="${ reviewList }">
					<div id="review">
						<div id="memInfo">
							<img id="memImg"
								src="${path}/resources/upload/user/${review.memImgRename}" />
							<div>
								<span> ${ review.memName } </span> <span> <fmt:formatDate
										var="dateTempParse" pattern="yyyy-MM-dd HH:mm"
										value="${ review.rvCreateDate }" /> <c:set var="addInfo"
										value=" 작성됨" /> <c:out value="${dateTempParse}${addInfo}" />

								</span> <span> <c:forEach var="i" begin="1"
										end="${review.goodReview}">
										<i class="fas fa-star"></i>
									</c:forEach>
								</span>
							</div>
						</div>

						<span id="rvContent"> <c:out value="${ review.rvContent }" />
						</span>

						<c:if test="${review.rvRenameFilename != null}">

							<div id="reviewImgs">


								<c:set var="imgs"
									value="${fn:split(review.rvRenameFilename,',')}" />
								<c:forEach var="fileName" items="${imgs}" varStatus="g">

									<img id="eachImg"
										src="${path}/resources/upload/review/${fileName}" />

								</c:forEach>

								<%-- <img alt="" src="${path}/resources/upload/review/list1.JPG"> --%>


							</div>
						</c:if>


					</div>
				</c:forEach>
			</c:if>
		</div>

		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<c:if test="${ listCount > 4}">
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=1'">&lt;&lt;</button>

				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${ pageInfo.prvePage }'">&lt;</button>

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
							onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${status.current}'">
							<c:out value="${status.current}" />
						</button>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${pageInfo.nextPage}'">&gt;</button>

				<!-- 맨 끝으로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${pageInfo.maxPage}'">&gt;&gt;</button>
			</c:if>

		</div>
	</div>
</div>


<%@ include file="../../views/common/footer.jsp"%>
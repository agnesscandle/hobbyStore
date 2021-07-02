<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<style>
.qnaItem {
	text-align: center;
	width: max;
	background-color: #eee;
	line-height: 30px;
}

.qnaContent {
	display: none;
	height: 100px;
	background-color: #bbdefb;
	text-align: center;
	width: max;
	height: 200px;
	line-height: 30px
}
</style>
<body>
	<h1>문의 하기</h1>
	<form action="${ path }/hobby/qnaList" method="POST">
		<div class="container">
			<c:if test="${ qnaList != null }">
				<c:forEach var="qna" items="${ qnaList }">
					<div class="qnaItem">
						<c:out value=" ${ qna.qnaNo } "></c:out>
						<c:out value=" ${ qna.qnaTitle } "></c:out>
						<!-- <c:out value=" ${ member.memId } "></c:out> -->
						<c:out value=" ${ qna.qnaDate } "></c:out>
					</div>

					<div class="slideToggle">
						<p>
							<c:out value=" ${ qna.qnaContent } "></c:out>
						</p>
						<div class="replyView">
							<span> 
							<c:forEach var="replyList" items="${ qna.reply }" >
							
									 <c:forEach var="j" items="${ replyList }">
										
										
										<%-- <c:out value="${ status.replyNo }"></c:out>
										<c:out value="${ status.replyContent }"></c:out>
										<c:out value="${ status.replayDate }"></c:out>
 --%>
									</c:forEach> 
								</c:forEach>

							</span>
						</div>
						<input type="hidden" id="qnaNo" name="qnaNo"
							value="${ qna.qnaNo }" />
						<textarea rows="5" cols="50" id="replyContent" name="replyContent"></textarea>
						<input type="submit" value="등록하기">
					</div>

				</c:forEach>
			</c:if>
		</div>
	</form>

	<div id="pageBar">
		<!-- 맨 처음으로 -->
		<button onclick="location.href='${path}/hobby/qnaList?page=1'">&lt;&lt;</button>

		<!-- 이전 페이지로 -->
		<button
			onclick="location.href='${path}/hobby/qnaList?page=${ pageInfo.prvePage }'">&lt;</button>

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
					onclick="location.href='${path}/hobby/qnaList?page=${status.current}'">
					<c:out value="${status.current}" />
				</button>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지로 -->
		<button
			onclick="location.href='${path}/hobby/qnaList?page=${pageInfo.nextPage}'">&gt;</button>

		<!-- 맨 끝으로 -->
		<button
			onclick="location.href='${path}/hobby/qnaList?page=${pageInfo.maxPage}'">&gt;&gt;</button>




	</div>
	<script>
    $( document ).ready( function() {
           $( '.qnaItem' ).on("click",function(e){
                $( '.slideToggle' ).slideToggle();
           } );
         } );
   //스크립트번호주기

</script>






</body>



<%@ include file="../../views/common/footer.jsp"%>
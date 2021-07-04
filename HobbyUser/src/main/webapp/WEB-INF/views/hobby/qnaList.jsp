<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<style>
.qnaItem {
border: 3px solid black;
border-bottom : none;
	text-align: center;
	font-size : 24px;
	width: max;
	height : 3em;
	background-color: #eee;
	font-weight: bold;
   display: block;
   margin-top : auto;
}

.slideToggle {
	display: none;
	height: 100px;
	background-color: #bbdefb;
	text-align: center;
	width: max;
	height: 200px;
	line-height: 30px;
}
.qnaContent{
	height: auto;
	font-weight: bold;
   display: block;
   margin-top: 2em;
   margin-bottom : 2em;
	background-color: white;
}
.inputContent{
   margin-top: 2em;
   margin-bottom : 2em;
   display: block;
   margin-top: 20px;
}
#replyContent{
	background-color: rgba(255, 0, 0, 0);
	border: none;
	text-align: center;
}
.buttonReply{
    font-size : 18px;
    font-weight : bold;
    color : white;
    background-color: #0277bd;
    border : none;
    width : 150px;
    height : 33px;
    border-radius : 5px;
}
</style>
<body>
	<h1>문의 하기</h1>
	<form action="${ path }/hobby/qnaList" method="POST">
		<div class="container">
			<c:if test="${ qnaList != null }">
				<c:forEach var="qna" items="${ qnaList }">
					<div class="qnaItem${status.cou }">
						<span class="no"><c:out value=" ${ qna.qnaNo } "></c:out></span>
						<span class="title"><c:out value=" ${ qna.qnaTitle } "></c:out></span>
						 <c:out value=" ${ member.memId } "></c:out>
						<span class="date"><c:out value=" ${ qna.qnaDate } "></c:out></span>
					</div>

					<div class="slideToggle">
						<div class="qnaContent">
							<c:out value=" ${ qna.qnaContent } "></c:out>
						</div>
						<div class="replyView">
							
							<c:forEach var="replyList" items="${ qna.reply }" >
							<span class="replyList"> 
							<c:out value="${ replyList.replyNo }"></c:out>
							<c:out value="${ replyList.replyContent }"></c:out>
							<c:out value="${ replyList.replayDate }"></c:out>
							</span>

								</c:forEach>

							
						</div>
						<div class="inputContent">
						<input type="hidden" id="qnaNo" name="qnaNo"
							value="${ qna.qnaNo }" />
						<textarea rows="5" cols="50" id="replyContent" name="replyContent"
							placeholder="답변을 입력하세요."style="resize: none;"></textarea><br>
						<input type="submit" value="등록하기" class="buttonReply">
						</div>
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
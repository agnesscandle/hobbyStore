<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<style>
.container{
	height : max-content;
}

#qnaItem  {
border: 3px solid black;
border-bottom : none;
	font-size : 24px;
	width: max;
	height : 3em;
	background-color: #eee;
	font-weight: bold;
   display: block;
   margin-top : auto;
}

.title{
text-align:center;
	
	}



#slideToggle {
	display: none;
	height : max-content;
	background-color: #bbdefb;
	text-align: center;
	width: max;
	line-height: 30px;
}
.qnaContent{
	height :max-content;
	font-weight: bold;
   display: block;
   margin-top: 2em;
   margin-bottom : 2em;
	background-color: white;
}
.inputContent{
	height : max-content;
   margin-top: 2em;
   margin-bottom : 2em;
   display: block;
   margin-top: 20px;
  
}
#replyContent{
height : max-content;
	background-color: rgba(255, 0, 0, 0);
	border: none;
	text-align: center;
	width: 70%;
	margin-left: 20px;
	margin-top: 20px;
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
        margin-bottom : 2em;
}
.replyList{
height : max-content;
}
#statusAnswer{
display: inline-block;
float: right;
font-weight: normal;
padding-right: 20px;
}
#userInfo{
display: inline-block;
float: left;
font-weight: normal;
font-size : 20px;
padding-left: 20px;
margin-top: 20px;
}
#qnaUpdate{
float: right;
margin-right: 30px;
margin-bottom : 2em;
cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
#replyContent{
display: inline-block;
float: left;
}
#replyDate{
display: inline-block;
float: right;
}
#replyMer{
display: inline-block;
float: right;
}
</style>
<body>
<h1>문의 하기 _<c:out value=" ${qna.hbTitle }"></c:out></h1>
	
		<div class="container">
			<c:if test="${ qnaList != null }">
		
				<c:forEach var="qna" items="${ qnaList }" varStatus="status">
				 <c:if test="${ qna.status eq 'Y' }">

					
	<script>
		$(function(){
				 $( '.qnaItem${status.index}' ).on("click",function(e){
					$('.slideToggle${ status.index }').slideToggle();
				
           });
           
         });

	</script>
					<div class="qnaItem${ status.index }"  id="qnaItem" >
					<div id="userInfo">
						<span class="id"><c:out value=" ${ qna.memId } "></c:out></span>
						<span class="date"><c:out value=" ${ qna.qnaDate } "></c:out></span>
<!-- 						<span class="no"><c:out value=" ${ qna.qnaNo } "></c:out></span> -->
						</div>
						<div class="title"><c:out value=" ${ qna.qnaTitle } "></c:out></div>
						

						<div id="statusAnswer">
						<c:if test="${not empty qna.reply  }">
						<span id="success">답변완료</span></c:if>
						<c:if test="${ empty qna.reply }">
						<span id="waiting">미완료</span></c:if>
						
						</div>
					</div>

					<div class="slideToggle${ status.index }" id="slideToggle" index="${ status.index }">
						<div class="qnaContent">
							
							<c:out value=" ${ qna.qnaContent } "/> 
							<c:if test="${ !empty loginMember && (loginMember.memId == qna.memId) }"> 
							<button type="button" id="qnaUpdate" onclick="location.replace('${path}/hobby/qnaUpdate?qnaNo=${ qna.qnaNo }')">
							수정</button></c:if>
							<br>
						</div>
						<div class="replyView">
							
							<c:forEach var="replyList" items="${ qna.reply }" >
							<span class="replyList"> 
							<span id="replyContent"><c:out value="${ replyList.replyContent }"></c:out></span>
							<span id="replyDate"><c:out value="${ replyList.replayDate }"></c:out></span>
							<span id="replyMer"> 작성자아이디입력칸</span>	<!-- 작성자 아이디추가해야댐 -->
						
							</span>
							<hr>
							</c:forEach>
						</div>
						<form action="${ path }/hobby/qnaList" method="POST">
						<div class="inputContent">
						<input type="hidden" id="qnaNo" name="qnaNo"
							value="${ qna.qnaNo }" />
						<textarea rows="5" cols="50" id="replyContent" name="replyContent"
							placeholder="답변을 입력하세요."style="resize: none;"></textarea><br>
						<input type="submit" value="등록하기" class="buttonReply">
						</div>
						</form>
					</div>
					</div>
					</c:if>
				</c:forEach>
			</c:if>
		</div>
	

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


$(document).ready(() => {


		
		$(".buttonReply").on("click", (e) => {
			if(confirm("정말로 답글 등록 하시겠습니까?")) {
				location.replace("${path}/hobby/qnaList?hbNo=${hobby.hbNo}");
			}
		});
	});
</script>

</body>



<%@ include file="../../views/common/footer.jsp"%>
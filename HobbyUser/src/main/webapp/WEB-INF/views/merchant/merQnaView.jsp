<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>

<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<style>
body{
	align-content: center;
	color :  #34486b;
}
.qnaL_container {
	height: max-content;
	width : 1400px;
	margin: auto;
	padding : 30px;
	text-align: center;
}

.qnaL_title{
	text-align: left;
	padding-bottom: 20px;
}

.hidden_Qbox{
	margin-bottom: 60px;
}
#qnaItem {
	border: 3px solid black;
	border-bottom: none;
	font-size: 15px;
	width: max;
	height: 3em;
	background-color: #eee;
	font-weight: bold;
	display: block;	
}
#userInfo {
	
	float: left;
	margin-left: 30px;
	margin-right: 30px;
}
.date{
	font-size: 11px;
	color: gray;
	
}

.id{
	font-weight: bolder;
	font-size: 15px;

}
.title {
	text-align: center;
}

#statusAnswer {
	display: inline-block;
	float: right;
	font-weight: normal;
	padding-right: 20px;
}

#replyMerDate{
	width: auto;
	float: right;
	margin: auto;

}
#replyDate{
	font-size: 11px;
	color: gray;
	
}

#replyMer{
	font-weight: bolder;
	font-size: 15px;
}
#replyView {
width: inherit;
}
.qnaContentUpdate {
	
	width: max;	
	background-color: #f1e4ee;
	color : 2c3c89;
		overflow:hidden;
		height:auto;
	font-weight: bold;
	display: block;
	padding : 20px;
	text-align: left;
}
.qnaContent {
	width: 90%;
	float: left;
	height : max;
	padding: 10px;
	padding-bottom: 20px;
}
.qnaUpdateDiv{
	width: 10%;
	float: right;
	
}
#replyContent {
	text-align : center;
	background-color: rgba(255, 0, 0, 0);
	border: none;
	text-align: center;
	height :inherit;
	font-weight: bold;

}

#slideToggle {
	display: none;
	

	width: max;
	margin-bottom: 5%;
	
	
}

.buttons {
	float: right;
	margin-right: 30px;
	margin-bottom: 2em;
	cursor: pointer;
	height: 24px;
	width: 90px;
	border: 1px solid #333;

	text-align: center;
	font-weight: bold;
	font-size: 10px;
}
#replyUpdate{
	float: right;
	margin: 110px 30px 0px 0px;
	cursor: pointer;
	height: 24px;
	width: 90px;
	border: 1px solid #333;
	text-align: center;
	font-weight: bold;
	font-size: 10px;
	position: relative;
}

#qnaUpdate{
 position: relative;
 top : -5px;
 left: 20px;
}

#replyContent{
width:500px; 
	height:100px; 
    resize:none;
}

.inputContent {
	height: max-content;
	margin-top: 2em;
	margin-bottom: 2em;
	display: block;
	margin-top: 20px;
}
</style>
<body>


	<div class="qnaL_container">
	<div class="qnaL_title"><h1>문의 하기 _</h1></div>
		<c:if test="${ qnaList != null }">
			
			<c:forEach var="qna" items="${ qnaList }" varStatus="status">



					<script>
		$(function(){
				 $( '.qnaItem${status.index}' ).on("click",function(e){
					$('.slideToggle${ status.index }').slideToggle();
				
           });
           
         });

	</script>
				

					<div class="qnaItem${ status.index }" id="qnaItem">
						<div id="userInfo">
							<span class="id"><c:out value=" ${ qna.memId } "></c:out></span><br>
							<span class="date"><c:out value=" ${ qna.qnaDate } "></c:out></span>
							<!-- <span class="no"><c:out value=" ${ qna.qnaNo } "></c:out></span> -->
						</div>
						<div class="title">
							<c:out value=" ${ qna.qnaTitle } "></c:out>
						</div>


						<div id="statusAnswer">
							<c:if test="${not empty qna.reply  }">
								<span id="success">답변완료</span>
							</c:if>
							<c:if test="${ empty qna.reply }">
								<span id="waiting">미완료</span>
							</c:if>

						</div>
					</div>
<br>
					<div class="slideToggle${ status.index }" id="slideToggle"
						index="${ status.index }">
						<div class="qnaContentList">
								<div class="qnaContentUpdate">
								<div class="qnaContent">
								<c:out value=" ${ qna.qnaContent } " />
								</div>
								<div class="qnaUpdatediv">

								</div>
								</div>
								<br>
						<div class="replyView">

							<c:forEach var="replyList" items="${ qna.reply }" >
						
							<div id="updateHide${replyList.replyNo }">
						
								<fmt:formatDate var="formatRegDate" value="${ replyList.replayDate }" pattern="yyyy.MM.dd"/>
								<div id="replyMerDate">
									<div id="replyMer"> ${ replyList.merId } </div>
									<div id="replyDate">${formatRegDate}</div>
									<br>
									
									<button type="button" id="replyUpdateText${replyList.replyNo }" class="buttons">
									수정</button>
									<button type="button" id="replyDelete" class="buttons"
										onclick="location.replace('${path}/merchant/replyDelete?hbNo=${ qna.hbNo }&replyNo=${ replyList.replyNo }')">
										삭제</button>
									
								</div><br>
										<span id="replyContent${replyList.replyNo }">
										<c:out value="${ replyList.replyContent }"></c:out></span> 
									
								
							<input type="hidden" id="replyNo" name="replyNo" value="${replyList.replyNo }">			
								<br>

						</div>
						<form id="updateTextarea${replyList.replyNo }" name="updateTextarea" class="updateTextarea">
						<input type="hidden" id="replyNo" name="replyNo" value="${replyList.replyNo }">
						<input type="hidden" id="hbNo" name="hbNo" value="${qna.hbNo }">
						</form>
						<div class="hidden_Qbox"></div>	
								
								
								<hr>
								<script>
								$(function(){
									$("#replyUpdateText${replyList.replyNo }").click(function(){

											var textarea = document.createElement('textarea');
											var replyContent = $("#replyContent${replyList.replyNo }").text();
											var text = document.createTextNode(replyContent);
											textarea.id = 'replyContent';
											textarea.name = 'replyContent';
											textarea.appendChild(text);
											
											var updateButton = '<input type="submit" id="replyUpdate" class="replyUpdate" name="replyUpdate" value="수정하기">';
											
											$('#updateTextarea${replyList.replyNo }').append(textarea).show();
											$('#updateTextarea${replyList.replyNo }').append(updateButton).show();
											
											
											
											$('#replyUpdate').on("click", function(){
												 var replyData = $("#updateTextarea${replyList.replyNo }").serialize();
												   $.ajax({
												      type : "POST",
												      url : "${ path }/merchant/replyUpdate",
												      data: replyData,
												      datatype: 'json',
												      success : function(data){
												    	  alert("답변수정완료");
												      }
													
												});
											});
											
											$('#updateHide${replyList.replyNo }').hide();
										});
								 });
								</script>
							</c:forEach>
						</div>
					<c:if test='${ qna.reply eq "[]" }'>
						<form action="${ path }/merchant/merQnaView" method="POST">
						
							<div class="inputContent">
								<input type="hidden" id="hbNo" name="hbNo" value="${qna.hbNo }">
								<input type="hidden" id="qnaNo" name="qnaNo" value="${ qna.qnaNo }" />
								<input type="hidden" id="merNo" name="merNo" value="${ loginMerchant.merNo }" />
								<textarea rows="5" cols="50" id="replyContent"
									name="replyContent" placeholder="답변을 입력하세요."
									style="resize: none;"></textarea>
								<br> <input type="submit" value="등록하기" class="buttons" id="buttonReply">
							</div>
						
						</form>
						</c:if>
						</div>
						</div>
						</c:forEach>
				</c:if>
				</div>



	<div id="pageBar">
		<!-- 맨 처음으로 -->
		<button onclick="location.href='${path}/merchant/merQnaView?page=1'">&lt;&lt;</button>

		<!-- 이전 페이지로 -->
		<button
			onclick="location.href='${path}/merchant/merQnaView?page=${ pageInfo.prvePage }'">&lt;</button>

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
					onclick="location.href='${path}/merchant/merQnaView?page=${status.current}'">
					<c:out value="${status.current}" />
				</button>
			</c:if>
		</c:forEach>
		<!-- 다음 페이지로 -->
		<button
			onclick="location.href='${path}/merchant/merQnaView?page=${pageInfo.nextPage}'">&gt;</button>

		<!-- 맨 끝으로 -->
		<button
			onclick="location.href='${path}/merchant/merQnaView?page=${pageInfo.maxPage}'">&gt;&gt;</button>




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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />
<link rel="stylesheet"
	href="${path}/css/merchantMember_css/reviewList.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<div id="reviewDiv">
	<span id="title">후기</span>
	<div>
		<div id="avgScore">
			<div class="myScore">
				<span>평균 평점</span>
				<p class="star_rating">
					<a href="#" class="on">★</a> 
					<a href="#" class="on">★</a> 
					<a href="#" class="on">★</a> 
					<a href="#">★</a> 
					<a href="#">★</a>
				</p>
				<span><fmt:formatNumber value="${sumScore}" pattern=".0"/></span>
			
			</div>
			<script>
			 for(var i=0;i<${sumScore};i++){                                 
                 $(".star_rating a:eq("+i+")").addClass("on");
              }	
			</script>
		</div>
		
		<div id="reviewArea">
			<div id="reviewList">
      
      	<!-- 1. 후기가 없을 경우 -->
        <c:if test="${empty reviewList}">
           <span id="noReview">아직 후기가 없습니다. 가장 먼저 후기를 남겨주세요 :)</span>
        </c:if>
        
         <!-- 1. 후기가 있는 경우 -->
         <c:if test="${!empty reviewList}">
            <c:forEach var="review" items="${ reviewList }">
               <div id="review">
                  
                  <!-- 후기를 작성한 회원의 정보, 작성일자, 별점 -->
                  <div id="memInfo">
                  
                  <c:if test="${review.memImgRename == null}">
								<img id="memImg" src="${path}/images/memUser.png" />
					</c:if>
					<c:if test="${review.memImgRename != null}">
						<img id="memImg"
							src="${path}/profile/${review.memImgRename}" />
					</c:if>
                     
                     <div>
                        <span> ${ review.memName } </span> <span> <fmt:formatDate
                              var="dateTempParse" pattern="yyyy-MM-dd HH:mm"
                              value="${ review.rvModifyDate }" /> <c:set var="addInfo"
                              value=" 작성됨" /> <c:out value="${dateTempParse}${addInfo}" />

                        </span> <span> <c:forEach var="i" begin="1"
                              end="${review.rvScore}">
                              <i class="fas fa-star"></i>
                           </c:forEach>
                        </span>
                     </div>
                    
                  </div>
                  
                 

                  <!-- 후기 내용, 이미지 -->      
                  <span id="rvContent"> <c:out value="${ review.rvContent }" /> </span>

				  <!-- 등록한 이미지가 있는 경우 -->
                  <c:if test="${review.rvRenameFilename != null}">

                     <div id="reviewImgs">
                        <c:set var="imgs" value="${fn:split(review.rvRenameFilename,',')}" />
                        <c:forEach var="fileName" items="${imgs}" varStatus="g">
                           <img id="eachImg" src="${path}/resources/upload/review/${fileName}" />
                        </c:forEach>

                     </div>
                  </c:if>

               </div>
            </c:forEach>
         </c:if>
      </div>
		</div>
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
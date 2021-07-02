<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/view.css">


<section>
	<div class="container">
		<!-- 상단 : 취미 intro -->
		<div class="top">
			<div class="left" id="leftTop">
				<div class="imgContainer">
					<img class="hobbyImg" src="${ path }/images/신규 클래스2.jpg">
				</div>
			</div>
			<div class="right" id="rightTop">
				<div class="forBorder">
					<div class="infoContainer">
						<h4 id="cate">${hobby.cateNo}</h4>
						<h2 id="title">${hobby.hbTitle}</h2>
						<!-- 가격 오른쪽 정렬 + 단위 콤마 표시 -->
						<h3 id="price">${hobby.hbFee}(원)</h3>
					</div>
					<br>
					<hr>
					<br>
					<div class="btnContainer">
						<p>
							<button class="btn" id="btnPay">결제하기</button>
						</p>
						<p>
							<button class="btn" id="btnMerchantInfo">상인 정보보기</button>
						</p>
						<p class="btnSml1">
							<button class="btn" id="btnLiked">좋아요</button>
						</p>
						<p class="btnSml1">
							<button class="btn" id="btnShare">공유하기</button>
						</p>
						<p class="btnSml2">
							<button class="btn" id="btnQuestion">문의하기</button>
						</p>
						<p class="btnSml2">
							<button class="btn" id="btnReport" onclick="reportPopup();">신고하기</button>
						</p>
					</div>
				</div>

			</div>
		</div>
		<br> <br> <br> <br>

		<!-- 중간 : 메뉴 -->
		<div class="middle menuBar">
			<div class="menu" id="review">후기</div>
			<div class="menu" id="info">취미소개</div>
			<div class="menu" id="location">위치</div>
			<div class="menu" id="question">문의하기</div>
			<div class="menu" id="policy">환불정책</div>
		</div>
		<div class="bottom">
			<div class="detail" id="reviewArea">
				<!-- 
				<div id="reviewList">
					<c:forEach var="review" items="${ reviewList }">
						<div id="review"></div>
					</c:forEach>
				</div>
			-->
				<button
					onclick="location.replace('${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}')"
					class="add-cart">더보기</button>
			</div>
		</div>
		<div class="detail" id="infoD">취미 소개 상세</div>
		<div class="detail" id="locationD">위치 상세</div>
		<div class="detail" id="questionD">문의하기 상세</div>
		<div class="detail" id="policyD">환불 정책 상세</div>
	</div>
	</div>

</section>

<script>

//좋아요 버튼
$(document).ready(()=>{
   $("#btnLiked").on("click", (e)=>{
      location.href="${path}/hobby/liked?no=${hobby.hbNo}";
   });
});

//신고하기 버튼
function reportPopup(){
   var hbNo =$("#hbNo").val();
   console.log("취미번호 : " + hbNo);

// 취미번호까지 제대로 찍힘 + 자식 창에서 부모 창의 값 가져오기
   var url = "${path}/hobby/report?hbNo=${hobby.hbNo}&hbTitle=${hobby.hbTitle}";
   var name = "report";
   var option = "width=650, height=630, left=400, top=150, location=no, resizable=no, scrollbars=no";
   window.open(url, name, option);
}

/* 
 // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the button that opens the modal
        var btn = document.getElementById("review");
 
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];                                          
 
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
        


		
		var review = document.getElementsByClassName("close")[0];                                          
		
		 
		btn.onclick = function() {
		    modal.style.display = "block";
		}
*/
</script>


<%@ include file="../../views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/hobby/view.css">


<section>
	<div class="container">
		<!-- 상단 : 취미 intro -->
		<div class="top">
			<div class="left" id="leftTop">
				<div class="imgContainer">
					<img class="hobbyImg"
						src="${ path }/upload/hobby/${hobby.hbThumRename}">
				</div>
			</div>
			<div class="right" id="rightTop">
				<div class="forBorder">
					<div class="infoContainer">
					<input type="hidden" id="hbNo" name="hbNo" value="${hobby.hbNo}"/>
						<h4 id="cate"><c:out value="${hobby.cateName}" />
						</h4>
						<h2 id="title">
							<c:out value="${hobby.hbTitle}" />
						</h2>
						<br>
						<div id="price">
							<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
								<c:set var="disFee"
									value="${ hobby.hbFee - (hobby.hbFee * hobby.hbDiscountRate / 100)}" />
								<fmt:formatNumber value="${disFee}" type="number"
									var="discountFee" />
								<fmt:formatNumber value="${hobby.hbFee}" type="number"
									pattern="#,###" var="originalFee" />
								<span class="price">
									<div class="discount">
										${ hobby.hbDiscountRate }% &nbsp;
										<del>${originalFee}원 </del>
									</div> <b class="finalPrice">${discountFee}원 </b>
							</c:if>

							<c:if test="${ hobby.hbDiscountStatus eq 'N' }">
								<fmt:formatNumber value="${hobby.hbFee}" type="number"
									pattern="#,###" var="originalFee" />
								<span class="price"> <b class="finalPrice">${ originalFee }원</b>
							</c:if>
							</span>


						</div>
					</div>
					<br>
					<hr>
					<br>
					<div class="btnContainer">
						<p>
							<button class="btn" id="btnPay">결제하기</button>
						</p>
						<p>
							<button class="btn" id="btnMerchantInfo"
								onclick="merInfoPopup();">상인 정보보기</button>
						</p>
						<p class="btnSml1">
							<c:choose>
								<c:when test="${ empty loginMember && empty loginMerchant}">
									<button class="btn" id="btnLikedA">좋아요A</button>
								</c:when>
								<c:when test="${ !empty loginMember && empty loginMerchant }">
									<button class="btn" id="btnLiked">좋아요</button>
								</c:when>
								<c:otherwise>
									<button class="btn" id="btnLikedB">좋아요B</button>
								</c:otherwise>
							</c:choose>
						</p>
						<p class="btnSml1">
							<button class="btn" id="btnShare">공유하기</button>
						</p>

						<div class="modal">
							<div class="modal_share" title="클릭하면 창이 닫힙니다.">
								<div class="modal_share_content">
									<h1>링크 복사</h1>
									<div id="shareBar">
										<input id="shareUrl" type="text" dir="ltr" readonly="readonly"
											size="45">
										<button type="button" id="shareLink">링크복사</button>
									</div>
								</div>
							</div>
						</div>
						<p class="btnSml2">
							<button class="btn" id="btnQuestion"
								onclick="window.open('${path}/hobby/question?hbNo=${hobby.hbNo }','문의하기',
                        'width=500, height=450, left=100, top=50')">
								문의하기</button>
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
		<div class="detail" id="locationD"> 위치 상세
			<div>
				<span id="address"><c:out value="${hobby.hbLocation}"/></span>
				<div id="map" style="width:500px;height:350px;">
			</div>
			
			
			
			</div>
		</div>
		<div class="detail" id="questionD">
			
			<div id="qnaList">
				<c:forEach var="qna" items="${ qnaList }">
					<div id="qna"></div>
				</c:forEach>
			</div>
			<button
				onclick="location.replace('${path}/hobby/qnaList?hbNo=${hobby.hbNo}')"
				class="add-cart">더보기</button>

		</div>
	</div>
	<div class="detail" id="policyD">환불 정책 상세</div>
	</div>
	</div>

</section>

<script>


//공유하기 모달창
$(function(){
   $("#btnShare").click(function(){
      $(".modal").fadeIn();
   });

   $(".modal").click(function(){
      $(".modal").fadeOut();
   });

});
$(function(){

   document.getElementById("shareUrl").value = document.location.href;
});

$(document).on("click", "#shareLink", function(e) { 
   // 링크복사 시 화면 크기 고정 
   $('html').find('meta[name=viewport]').attr(
         'content', 
         'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
   var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
   $(this).append(html); 
   var input_clip = document.getElementById("clip_target"); //현재 url 가져오기 
   var _url = $(location).attr('href'); 
   $("#clip_target").val(_url);
   
   if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) { 
      var editable = input_clip.contentEditable; 
      var readOnly = input_clip.readOnly; 
      input_clip.contentEditable = true; 
      input_clip.readOnly = false; 
      var range = document.createRange(); 
      range.selectNodeContents(input_clip); 
      var selection = window.getSelection();
      selection.removeAllRanges(); 
      selection.addRange(range); 
      input_clip.setSelectionRange(0, 999999); 
      input_clip.contentEditable = editable; 
      input_clip.readOnly = readOnly; 

      } else { 
         input_clip.select(); 
         
         } try { 
            var successful = document.execCommand('copy'); 
            input_clip.blur(); 

            if (successful) { 
               alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요."); // 링크복사 시 화면 크기 고정 
               $('html').find('meta[name=viewport]').attr('content', 
                     'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes');
               } else { 
                  alert('이 브라우저는 지원하지 않습니다.'); 
                  } } catch (err) { 
                     alert('이 브라우저는 지원하지 않습니다.'); 
                     } 
                     
                  }); //클립보드 복사
      

// 비회원용 좋아요 버튼
$(function(){
	$("#btnLikedA").click(function(){
		alert("좋아요 기능은 로그인 후 사용할 수 있습니다.");
		location.href="${path}/member/login";
	});
});
                  
                  

$(document).ready(()=>{

// 결제하기 버튼
$("#btnPay").on("click", (e)=>{
	location.href="${path}/hobby/reserve?hbNo=${hobby.hbNo}";
});

// 좋아요 버튼
   $("#btnLiked").on("click", ()=>{
	   var hbNo=$("#hbNo").val();
	   
   		$.ajax({
   			type:"get",
   			url:"${path}/hobby/liked",
   			dataType:"json",
   			data:{
   				hbNo
   			},
   			success:function(data){
   				console.log(data);
   				
   				if(data.status === 'Y'){
   					alert("좋아요 취미에 등록되었습니다.");
   					window.close()
   				} else {
   					alert("좋아요 취미에서 삭제되었습니다.");
   					window.close()
   				}
   			},
   			error : function(e){
   				console.log(e);
   			}
   		});
   });
});

// 상인 정보보기 버튼 : 상인정보 팝업
	function merInfoPopup(){
			var url = "${path}/hobby/merInfo?hbNo=${hobby.hbNo}&merNo=${hobby.merNo}";
			var name="merchantInfo";
			var option = "width=610, height=540, left=400, top=150, location=no, resizable=no, scrollbars=no";
		window.open(url, name, option);
	}

//신고하기 버튼 : 신고창 팝업
	function reportPopup(){
	   var hbNo =$("#hbNo").val();
	   console.log("취미번호 : " + hbNo);
	
	   var url = "${path}/hobby/report?hbNo=${hobby.hbNo}&hbTitle=${hobby.hbTitle}";
	   var name = "report";
	   var option = "width=660, height=680, left=400, top=150, location=no, resizable=no, scrollbars=no";
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c42e9fa59c3e426319f693b117473bea&libraries=services"></script>
<script>
// 상인이 등록한 취미 주소를 가져오기
function findLocation(){
	var hbL =$("#address")[0].innerText;
	var sLocation = hbL.split(",");
	var location = sLocation[1];
	
	console.log(location);
	return location;
}

// 카카오 지도 불러오기
var mapContainer = document.getElementById('map'),
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };  

// 지도를 생성
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 취미 주소 가져오기(테스트용)
findLocation();

// 주소로 좌표를 검색(상인 취미 주소)
geocoder.addressSearch(findLocation(), function(result, status) {

     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 취미 장소(위치)에 대한 설명
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">취미 클래스 위치</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킴
        map.setCenter(coords);
    } 
});    
</script>


<%@ include file="../../views/common/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${path}/css/hobby/view.css">



	<div class="container">
		<!-- 상단 영역 : 이미지, 취미설명-->
		<div class="top">
			<!-- 상단 영역(왼) : 이미지-->
			<div id="leftTop" class="imgContainer">
				<div id="thumImgContainer">
						<img class="hobbyImg" id="thumImg" src="${ path }/upload/hobby/${hobby.hbThumRename}">	
				</div>
				<div id="addedImgContainer">
						<c:if test="${!empty hobby.hbImgsRename}">
						<div class="addedImgDiv">
								<img class="addImg" id="image" src="${ path }/upload/hobby/${hobby.hbThumRename}" onclick="change('${hobby.hbThumRename}')"></div>
								<c:forTokens items="${hobby.hbImgsRename}" delims="," var="item" varStatus="status">
									<c:if test="${status.last}">
										<c:set var="cnt" value="${status.index+1}"></c:set>
									</c:if>
									<div class="addedImgDiv">
										<img class="addImg img-${status.index}" id="image" 
																						src="${ path }/upload/hobby/${item}" onclick="change('${item}')">
									</div>
								</c:forTokens>
						</c:if>
				</div>
			</div>
			
		<!-- 상단 영역(오) : 취미설명 -->
		<div id="rightTop">
			<div class="forBorder" id="infoContainer">
				<input type="hidden" id="hbNo" name="hbNo" value="${hobby.hbNo}"/>
					<h4 id="cate"><c:out value="${hobby.cateName}" /></h4>
					<h2 id="title"><c:out value="${hobby.hbTitle}" /></h2><br>
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
								</div> <b class="finalPrice">${discountFee}원 </b></span>
					</c:if>
					<c:if test="${ hobby.hbDiscountStatus eq 'N' }">
							<fmt:formatNumber value="${hobby.hbFee}" type="number"
								pattern="#,###" var="originalFee" />
							<span class="price"> <b class="finalPrice">${ originalFee }원</b></span>
					</c:if>
			</div>
			<br><hr><br>
					
			<div class="btnContainer">
			<p>
				<button class="btn" id="btnPay">결제하기</button>
			</p>
			<p>
				<button class="btn" id="btnMerchantInfo" onclick="merInfoPopup();">상인 정보보기</button>
			</p>
			<p class="btnSml1">
					<button class="btn" id="btnLiked">좋아요</button>
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
									onclick="window.open('${path}/hobby/question?hbNo=${hobby.hbNo }','문의하기','width=500, height=450, left=100, top=50')">
								문의하기</button>
							<button class="btn" id="btnReport" onclick="reportPopup();">신고하기</button>
						</p>
					</div>
				</div>

			</div>
		</div>
		<br> <br> <br> <br>

		<!-- 중간 영역 : 메뉴바 -->
		<div class="middle menuBar">
			<div class="menu" id="info"><span>취미소개</span></div>
			<div class="menu" id="location"><span>위치</span></div>
			<div class="menu" id="review"><span>후기</span></div>
			<div class="menu" id="question"><span>문의하기</span></div>
			<div class="menu" id="ask"><span>FAQ</span></div>
			<div class="menu" id="policy"><span>환불정책</span></div>
		</div>
		<!-- 하단 영역 : 상세 내용(후기, 취미소개, 위치, 문의하기, 환불정책) -->
		<div class="bottom">
			<span class="bottomMenu" id="infoM"> 취미소개 </span>
			<span class="detail" id="infoD"></span>
			<br><hr><br>
			<span class="bottomMenu" id="locationM"> 위치 </span>
			<span class="detail address" id="locationD">
				<span>
					<span id="address"><c:out value="${hobby.hbLocation}"/></span>
					<div id="map"></div>
				</span>
			</span>
			<hr><br>
			<span class="bottomMenu" id="reviewM"> 후기 </span>
				<span class="detail toggle" id="reviewArea">
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
				</span>
			<br><hr><br>
			<span class="bottomMenu" id="questionM"> 문의하기 </span>
				<span class="detail" id="questionD">
					<span id="qnaList">
						<c:forEach var="qna" items="${ qnaList }">
							<div id="qna"></div>
						</c:forEach>
					</span>
					<button
						onclick="location.replace('${path}/hobby/qnaList?hbNo=${hobby.hbNo}')"
						class="add-cart">더보기</button>
				</span>
			<br><hr><br>
			<span class="bottomMenu" id="faq-toggle" onclick="openAnswer()"> - FAQ [자주 묻는 질문]</span>
				<span class="answer" id="askD">
					<p>
						<b> Q. 예약한 취미 내역은 어디서 확인하나요?</b><br>
						<b>A.</b> [마이페이지]의 [예약한 취미 목록] 탭에서 신청하신 취미 클래스를 확인하실 수 있습니다. <br>
					</p><br>
					<p>
						<b> Q. 예약 취소 및 환불 처리는 어떻게 되나요?</b><br>
						<b>A.</b> 구매 후 14일 이내에는 예약 취소 및 환불이 가능합니다. 다만, 14일이 지나지 않았더라도 이미 상인님과
						일정 확정 후 출석체크가 완료되었다면 환불이 불가합니다. <br>
					</p><br>
					<p>
						<b> Q. 예약을 하고 싶은데, 상인님의 연락처는 어떻게 알 수 있나요?</b><br>
						<b>A.</b> 상단 우측에 위치한 [ 상인 정보보기 ] 버튼을 통해 상인님과 소통이 가능한 이메일 주소를 제공하고 있습니다.<br>
						개인 정보 보호로 인하여 개인 연락처는 제공하지 않습니다.
					</p><br>
					
				</span>
			<br><hr><br>
			<span class="bottomMenu" id="pol-toggle" onclick="openPolicy()"> - 환불정책 </span>
				<span class="answer" id="policyD">
					<p>
						취미 결제 후 2주 이내 : 100% 환불 <br>
						취미 결제 후 2주 후 : 환불 불가
					</p> <br>
					<p>
						<b>[환불 신청 방법]</b><br>
						1. 해당 취미를 결제한 계정으로 로그인 <br>
						2. 마이 페이지 - 예약한 취미 내역 <br>
						3. 취소를 원하는 취미 상세 정보 버튼 - 취소 <br>
						4. 또는, '문의하기'를 통해 상인에게 문의 후 취소 가능 <br>
						* 결제 수단에 따라 예금주, 은행명, 계좌번호 입력 필
					</p>
				</span>
		</div>
	</div>	
</div>
<script>
// 이미지 변경
function change(item){
	document.getElementById("thumImg").src="${ path }/upload/hobby/"+item;
}
</script>


<script>
// 중간 메뉴바 이동
$("#info").click(function(){
	$('html, body').animate({
		scrollTop:$("#infoM").offset().top
	}, 1000);
});

$("#location").click(function(){
	$('html, body').animate({
		scrollTop:$("#locationM").offset().top
	}, 1000);
});

$("#review").click(function(){
	$('html, body').animate({
		scrollTop:$("#reviewM").offset().top
	}, 1000);
});

$("#question").click(function(){
	$('html, body').animate({
		scrollTop:$("#questionM").offset().top
	}, 1000);
});

$("#ask").click(function(){
	$('html, body').animate({
		scrollTop:$("#faq-toggle").offset().top
	}, 1000);
});

$("#policy").click(function(){
	$('html, body').animate({
		scrollTop:$("#pol-toggle").offset().top
	}, 1000);
});

</script>
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
        level: 1
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
<script>
	function openAnswer(){
		if(document.getElementById('askD').style.display === 'block'){
			document.getElementById('askD').style.display = 'none';
			document.getElementById('faq-toggle').textContent = '+ FAQ [자주 묻는 질문]';
		} else {
			document.getElementById('askD').style.display = 'block';
			document.getElementById('faq-toggle').textContent = '- FAQ [자주 묻는 질문]';
		}
	}

	function openPolicy(){
		if(document.getElementById('policyD').style.display === 'block'){
			document.getElementById('policyD').style.display = 'none';
			document.getElementById('pol-toggle').textContent = '+ 환불정책';
		} else {
			document.getElementById('policyD').style.display = 'block';
			document.getElementById('pol-toggle').textContent = '- 환불정책';
		}
	}
</script>

<%@ include file="../../views/common/footer.jsp"%>
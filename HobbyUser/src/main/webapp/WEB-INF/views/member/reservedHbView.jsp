<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/header.jsp"%>



<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/myInfo.css">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />



<main>
	<div class="memInfo_side">
		<div class="memInfo">
			<div class="profilePic-wrapper">

				<!-- 등록된 이미지가 없는 경우 -->
				<c:if test="${ loginMember.memImgRename == null }">
					<img src="${ path }/images/memUser.png" class="adjustImage" />
					<br>
				</c:if>

				<!-- 등록된 이미지가 있는 경우 -->
				<c:if test="${ loginMember.memImgRename != null }">
					<img src="${ path }/profile/${ loginMember.memImgRename }"
						class="adjustImage" />
					<br>
				</c:if>

			</div>
			<span class="infoMemName">${ loginMember.memName }</span> <span
				class="infoMemId">/ ${ loginMember.memId }</span><br> <span
				class="infoMemEmail">${ loginMember.memEmail }</span>
		</div>

		<div class="manageInfo">
			<div class="organizeInfo">내 정보 관리</div>
			<div id="updateInfo_btn" class="Info_update_Mem">프로필 수정</div>
			<div id="changePw_btn" class="Info_update_Mem">비밀번호 변경</div>
			<div id="deleteInfo_btn" class="Info_update_Mem">회원 탈퇴</div>
			<div id="rsHb_btn" class="Info_update_Mem">예약 관리</div>
			<div id="likedHb_btn" class="Info_update_Mem">좋아요 관리</div>

		</div>
	</div>
	<div class="reserved-wrap">
		<span class="rsTitle"><h1>예약 상세</h1></span> <br> <input
			type="hidden" id="hbNo" name="hbNo" value="${hobby.hbNo}" /> <span
			class="title_date"><c:out value="${reserve.resDate}" />&nbsp예약&nbsp&nbsp</span>
		<span class="title_number">No <c:out value="${reserve.resNo}" /></span>

		<div class="table-wrap">
			<table class="tb_reserve">
				<colgroup>
					<col width="600">
					<col width="250">
				</colgroup>
				<tr>
					<td class="td_reserve">
						<div class="tb_box">
							<c:if test="${ reserve.resStatus eq 'Y' }">
								<div class="tb_label">결제완료</div>
							</c:if>
							<div class="wrap_pt">
								<a href="${path}/hobby/view?hbNo=${hobby.hbNo}"> <img
									class="hobbyImg_rs" style="width: 120px; height: 120px;"
									src="${ path }/upload/hobby/${hobby.hbThumRename}"></a> <a
									href="${path}/hobby/view?hbNo=${hobby.hbNo}"> <span
									class="tb_box2"><c:out value="${hobby.hbTitle}" /></span>
								</a> <span class="tb_box3">결제금액 &nbsp <c:out
										value="${reserve.payFee}" /></span>
							</div>
						</div>
					</td>
					<td class="td_reserve">
						<div class="btnTb_G">
							<button class="tb_btn dqbXKL" id="btnMerchantInfo"
								onclick="merInfoPopup();">상인 정보보기</button>

							<button class="tb_btn kVrNwn" id="btnQuestion"
								onclick="window.open('${path}/hobby/question?hbNo=${hobby.hbNo }','문의하기',
                        'width=500, height=450, left=100, top=50')">
								상인에게 문의하기</button>
						</div>
					</td>
				</tr>
			</table>
		</div>

		<br>
		<br>
		<div class="mRsInfo">
		<br>
			<div class="mRsInfo_t">예약자 정보</div>
			<hr class="line_rsm">
			<br>
			<table class="mRsInfo_tb">
				<colgroup>
					<col width="105">
					<col>
					<col width="100">
				</colgroup>
				<tr>
					<td class="mRsInfo_tb">이름</td>
					<td><c:out value="${reserve.resName}" /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><c:out value="${reserve.resPhone}" /></td>
				</tr>
				<tr>
					<td>예약인원</td>
					<td><c:out value="${reserve.resCount}" /></td>
				</tr>
				<tr>
					<td>수강날짜</td>
					<td><c:out value="${reserve.takeDate}"/></td>
				</tr>
			</table>
			</div>
			<br>
			<hr>
			
			
			<br><br>
			<div class="location_rs">
			<span>위치</span>
			<div>
				<span id="address"><c:out value="${hobby.hbLocation}" /></span>
				<div id="map" style="width: 950px; height: 200px;"></div>
			</div>
		</div>
	</div>
</main>
<br><br><br><br><br><br><br><br><br>
<style>
a {
	text-decoration: none;
}

a:link {
	color: black;
}

.reserved-wrap {
	width: 50%;
	margin: 3% 0% 0% 30%;
}

.rsTitle {
	color: rgb(32, 51, 84);
}

.table-wrap {
	border-radius: 8px;
	border: 1px solid rgb(25, 40, 125);
	background-color: rgb(255, 255, 255);
	margin-top: 30px;
	width:
}

.tb_reserve {
	margin-top: 30px;
}

.td_reserve {
	border: inherit;
}

.title_date {
	font-weight: bolder;
	color: rgb(32, 51, 84);
}

.title_number {
	color: rgb(32, 51, 84);
	font-size: 14px;
}

.tb_box {
	margin: 10px 0px 40px 40px;
}


.tb_box2 {
	position: relative;
	bottom: 80px;
	left: 30px;
	color: rgb(32, 51, 84);
	font-size: 20px;
	font-weight: bolder;
	height: 300px;
	width:100%;
}

.tb_box3 {
	bottom: 20px;
	font-weight: bolder;
	font-size: 18px;
	color: rgb(32, 51, 84);
	
}

.tb_label {
	font-weight: bolder;
	font-size: 25px;
	padding: 0px 0px 15px 10px;
	color: rgb(32, 51, 84);
}

.btnTb_G {
	display: flex;
	flex-flow: column wrap;
	height: 100%;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 22px;
	margin-bottom: -40px;
	margin-left: -40px;
}

.tb_btn {
	min-height: 2.25rem;
	font-size: 0.875rem;
	width: 160px;
	margin: 5px 70px;
}

.dqbXKL {
	display: inline-flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	padding-left: 12px;
	padding-right: 12px;
	margin-bottom: 8px;
	user-select: none;
	cursor: pointer;
	text-decoration: none;
	outline: none;
	appearance: none;
	height: 2.25rem;
	width: 100%;
	border-radius: 4px;
	color: rgb(25, 40, 125);
	background-color: rgb(255, 255, 255);
	border: 1.5px solid rgb(25, 40, 125);
	-webkit-tap-highlight-color: rgba(52, 106, 255, 0.1);
	font-size: 18px;
}

.kVrNwn {
	display: inline-flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	padding-left: 12px;
	padding-right: 12px;
	user-select: none;
	cursor: pointer;
	text-decoration: none;
	outline: none;
	appearance: none;
	height: 2.25rem;
	width: 100%;
	border-radius: 4px;
	color: rgb(235, 221, 70);
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(235, 221, 70);
	-webkit-tap-highlight-color: rgba(52, 106, 255, 0.1);
	font-size: 18px;
}

.mRsInfo {
	color: rgb(32, 51, 84);
	font-size: 20px;
	font-weight: bolder;
}

.mRsInfo_t {
	font-size: 28px;
}

.line_rsm {
	margin-top: 25px;
	font-weight: bolder;
	background: rgb(32, 51, 84);
}

.location_rs{
	color: rgb(32, 51, 84);
	font-size: 18px;
}
.mRsInfo_tb{
	color: rgb(32, 51, 84);
	font-size: 20px;
}
</style>


<script>
<!-- 회원정보 수정 페이지 이동 -->
$(function(){
   $("#updateInfo_btn").click(function(){
      location.href='${ path }/member/updateMyInfo';
   })
})

<!-- 비밀번호 변경 페이지 이동 -->
$(function(){
   $("#changePw_btn").click(function(){
      location.href='${ path }/member/changePw';
   })
})

<!-- 회원 탈퇴 페이지 이동 -->
$(function(){
   $("#deleteInfo_btn").click(function(){
      location.href='${ path }/member/deleteAgree';
   })
})

<!-- 좋아요 관리 페이지 이동 -->
$(function(){
   $("#likedHb_btn").click(function(){
      location.href='${ path }/member/likedHobby';
   })
})

<!-- 예약 관리 페이지 이동 -->
$(function(){
   $("#rsHb_btn").click(function(){
      location.href='${ path }/member/reservedHobby';
   })
})

<!-- 상인 정보보기 버튼 : 상인정보 팝업 -->
function merInfoPopup(){
	var url = "${path}/hobby/merInfo?hbNo=${hobby.hbNo}&merNo=${hobby.merNo}";
	var name="merchantInfo";
	var option = "width=610, height=540, left=400, top=150, location=no, resizable=no, scrollbars=no";
window.open(url, name, option);
}
</script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c42e9fa59c3e426319f693b117473bea&libraries=services"></script>
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
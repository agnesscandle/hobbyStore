<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/view.css">


<section>
   <div class="container">
                <!-- 상단 : 취미 intro -->
                <div class="top">
                    <div class="left" id="leftTop">
                        <div class="imgContainer"><img class="hobbyImg" src="${ path }/images/신규 클래스2.jpg"></div>
                    </div>
                    <div class="right" id="rightTop">
                        <div class="forBorder">
                            <div class="infoContainer">
                                <h4 id="cate"> [ 취미 카테고리 ] </h4>
                                <h2 id="title"> 취미 제목 ( 요약 ? ) </h2>
                                <!-- 가격 오른쪽 정렬 + 단위 콤마 표시 -->
                                <h3 id="price"> 취미 가격 (원) </h3>
                            </div>
                            <br><hr><br>
                            <div class="btnContainer">
                                <p><button class="btn" id="btnPay"> 결제하기 </button></p>
                                <p><button class="btn" id="btnMerchantInfo"> 상인 정보보기 </button></p>
                                <p class="btnSml1"><button class="btn" id="btnLiked"> 좋아요 </button></p>
                                <p class="btnSml1"><button class="btn" id="btnShare"> 공유하기 </button></p>
                                <p class="btnSml2"><button class="btn" id="btnQuestion"> 문의하기 </button></p>
                                <p class="btnSml2"><button class="btn" id="btnReport"> 신고하기 </button></p>
                            </div>
                        </div>

                    </div>
                </div>
                <br><br><br><br>
                <!-- 중간 : 메뉴 -->
                <div class="middle menuBar">
                    <div class="menu" id="review">후기</div>
                    <div class="menu" id="info">취미소개</div>
                    <div class="menu" id="location">위치</div>
                    <div class="menu" id="question">문의하기</div>
                    <div class="menu" id="policy">환불정책</div>
                </div>
                <div class="bottom">
                    <div class="detail" id="reviewD"> 후기 상세 </div>
                    <div class="detail" id="infoD"> 취미 소개 상세</div>
                    <div class="detail" id="locationD"> 위치 상세 </div>
                    <div class="detail" id="questionD"> 문의하기 상세 </div>
                    <div class="detail" id="policyD"> 환불 정책 상세 </div>
                </div>
            </div>
</section>
<%@ include file="../../views/common/footer.jsp"%>
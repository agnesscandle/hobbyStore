<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<style>
.supportCenter{
   width: 1200px;
   justify-content: center;
   align-items: center;
   height: 100vh;
   margin: auto;
   padding-top: 30px;
}

.supMenu {
   list-style: none;
   /* position: absolute; */
   padding: 50px 30px;
   display: flex;
   width: 100%;
}

.supMenu li {
   flex: 1;
   width: 200px;
   height: 50px;
   text-align: center;
}

.supMenu li span {
   font-size: 20px;
   position: relative;
}

.supMenu>li.active {
   border-bottom: solid 3px;
   border-bottom-color: #eacc16;
}
.supMenu>li.active>span {
   padding: 20px 0;
   font-size: 20px;
   color: #eacc16;
}

/* 운영 메뉴얼 */
    .manualContainer{
        width : 1000px;
        height : auto;
        /* border : 1px solid #34486b; */
        padding : 20px;
        margin-left : 110px;
    }

    h1, h3{
        color : #34486b;
    }

    .manualTitle{
        padding : 20px;
    }

    .manualBox{
        display : flex;
        flex-direction: row;
        align-items : center;
        justify-content: space-around;
        flex-wrap: wrap;
    }

    .manual{
        border : 1px solid #eacc16;
        border-radius: 10px;
        width : 200px;
        height : 200px;
    }

    .btnManual{
        position : relative;
        left : 82px;
        top : 12px;
        border : none;
        border-radius: 5px;
        background-color: #eacc16;
        color: #fff;
        font-size : 20px;
        font-weight: bold;
        width : 38px;
        height : 38px;
        padding : 4px;
    }

    .btnManual:hover{
        color: #34486b;;
        cursor: pointer;
    }

    .manuQue{
        position : relative;
        width : 180px;
        height : 130px;
        top : 22px;
        left : 10px;
        text-align: center;
        font-size : 17px;
        font-weight: bolder;
        color : #34486b;
        /* border :solid 1px  red; */
    }

    .manuQue>span{
        font-size : 13px;
    }

    .icon{
        width : 60px;
        height : 60px;
        position : relative;
        top : -46px;
        left : 75px;
    }

    /* 모달창 속성 */
    .modal{ 
        position:absolute; 
        width:1900px; 
        height:1400px; 
        background: rgba(0,0,0,0.8); 
        top:0; 
        left:0; 
        display:none; 
    }
    #mc2{
        height : 430px;
    }
    
   	#mc4{
   		height : 380px;
   	}

    .modal_content{
    width:800px; height:550px;
    background:#fff; border-radius:10px;
    border : 6px solid  #eacc16;
    position:relative; top:400px; left:700px;
    margin-top:-100px; margin-left:-200px;
    text-align:center;
    box-sizing:border-box; padding:74px 0;
    line-height:23px; cursor:pointer;
}


</style>

<div class="supportCenter">
	<!-- 지원센터 메뉴 -->
	<div class="ul">
      <ul class="supMenu">
         <li class="sup sup-1 active"><span>운영 메뉴얼</span></li>
         <li class="sup sup-2" id="btnFaq"><span>자주 묻는 질문</span></li>
      </ul>
   </div>
   
   <!-- 운영 메뉴얼 -->
   <div class="manualContainer">
        <div class="manualTitle">
            <h1> 운영 메뉴얼 </h1><br>
            <h3> 안녕하세요. <br> 저희 취미상점은 다음과 같이 운영되고 있습니다. </h3>
        </div>
        <br>
        <div class="manualBox">
            <div class="manual" id="ma1">
                <button class="btnManual" id="btnM1" type="button"> 1</button><br>
                <div class="manuQue">
                    취미상점은 <br>
                    무얼하는 곳인가요?
                </div>
                <img class="icon" src="${path}/images/girl.png">
            </div>
            
            <div class="manual" id="ma2">
                <button class="btnManual" id="btnM2"> 2</button><br>
                <div class="manuQue">
                    취미상점은<br>
                    어떻게 가입할 수 있나요?
                </div>
                <img class="icon" src="${path}/images/boy.png">  
            </div>
            <div class="manual" id="ma3">
                <button class="btnManual" id="btnM3"> 3</button><br>
                <div class="manuQue">
                    취미는 누가,<br>
                    어떻게 진행하나요?
                </div>
                <img class="icon" src="${path}/images/girl.png">  
            </div>
            <div class="manual" id="ma4">
                <button class="btnManual" id="btnM4"> 4</button><br>
                <div class="manuQue">
                     취미는 어떻게 <br>
                    참여할 수 있나요?
                </div>
                <img class="icon" src="${path}/images/boy.png">  
            </div>
        </div>    
    </div>

    <div class="modal" id="m1">
        <div class="modal_content" id="mc1" title="클릭하면 창이 닫힙니다.">
            <h2> 취미상점은 무얼하는 곳인가요? </h2><br>
            <p>
                취미상점은 취미 여가 액티비티를 다양하게 즐기고 배울 수 있는 <b>원데이 클래스</b> 플랫폼입니다. <br><br>
                여러분, <b>"업글인간"</b>이라고 들어보셨나요? <br>
                업글인간은 끊임없이 스스로를 업그레이드(Upgrade)하기 위해 열중하는 사람을 지칭하는 신조어입니다.<br><br>
            </p>
            <p>
            	취미상점은 이렇듯 업글인간이 되고자 하는 사람들을 모아 <br> 요리, 운동, 베이킹, 여행 등의 액티비티를 함께 즐기고 소통하며 <br>
                더 행복한 삶을 살 수 있게 도와주는 서비스 플랫폼입니다. <br><br>
                    
                코로나19로 인해 어려운 시국 속에서 생활을 해야 하는 우리지만, <br>
                취미상점을 통해 지친 일상 속에서 활력을 찾고 "어제보다 나은 나"가 될 수 있도록 언제나 응원하겠습니다.<br><br>
            </p> 
            <br>
            <p>
               <sub><b>[ 참고 사항 ]</b></sub><br>
                * 취미상점에 올라와 있는 원데이 클래스들을 <b>"취미"</b>로 칭하고 있습니다.<br>
                * 취미 수업을 진행하시는 분을 <b>"재능상인"</b>, 참여하시는 분을 <b>"손님"</b>이라고 칭하고 있습니다.
            </p>
            <br><br> 
        </div>
    </div>
    
    <div class="modal" id="m2">
        <div  class="modal_content" id="mc2" title="클릭하면 창이 닫힙니다.">
                <h2> 취미상점에 회원가입 하는 방법 </h2><br>
                <h3> 손님으로 가입하기 </h3>
                <p>
                	PC를 통해 취미상점 홈페이지에서 손쉽게 가입할 수 있습니다. <br>
                	취미상점 우측 상단에 있는 [ 회원가입 ] 탭을 클릭하면 손님으로 가입하실 수 있습니다. <br>
                	또한, [ 로그인 ] 탭의 <b>[ 손님회원 가입하기 ]</b> 버튼을 통해 가입하실 수 있습니다.
                </p>
                <br><br>
                <h3> 상인으로 가입하기 </h3>
                <p>
                	취미상점 우측 상단에 있는 [ 로그인 ] 탭의 <b>[ 상인으로 가입하기 ]</b> 버튼을 통해 가입하실 수 있습니다. <br>
                	상인으로 가입이 완료된 경우 원하는 재능과 관련된 <b>취미를 등록</b>함으로써,<br> 재능상인으로서 활동할 수 있게 됩니다. 
                </p>
        </div>
    </div>

    <div class="modal" id="m3">
        <div class="modal_content" id="mc3" title="클릭하면 창이 닫힙니다.">
            <h2> 취미는 누가, 어떻게 진행하나요? </h2><br>
            <h3> 누가? </h3><br>
            <p>
                취미는 <b>"재능상인"</b>이 진행합니다. <br>
                재능상인은 취미 수업을 통해 다양한 액티비티 프로그램을 진행하는 진행자입니다. <br>
                재능상인은 본인만이 가지고 있는 컨텐츠가 있다면 누구나 신청이 가능합니다.
            </p>
            <br><br>
            <h3> 어떻게? </h3><br>
            <p>
            	 현재 오픈되어 있는 취미 수업은 메인 화면에서 <b>누구나</b> 쉽게 볼 수 있습니다. <br>
            	 또한, [ 카테고리 ]를 통해 원하는 카테고리별 취미를 검색하여 볼 수 있으며, <br>
            	 [ 이벤트 ], [ 오픈 예정 ], [ 베스트 ]탭을 통해 특별한 취미를 확인할 수 있습니다. <br><br>
            	 
            	 <b> * 단, 수업 예약과 참가를 원하시는 경우 로그인 후에 사용하실 수 있습니다. </b>
            </p>
        </div>
    </div>

    <div class="modal" id="m4">
        <div class="modal_content" id="mc4" title="클릭하면 창이 닫힙니다.">
            <h2> 취미는 어떻게 참여할 수 있나요? </h2><br>
            <p>
                취미를 이용하고자 하는 손님은 [ 취미 상세 페이지 ]의 <b>[ 결제하기 ]</b> 탭을 이용하여 <br>
                해당 취미를 조회하고 참여할 수 있게 됩니다. <br><br>
                손님은 재능상인이 사전에 오픈한 취미 날짜 내에서 원하는 날짜를 택하여 예약할 수 있으며, <br>
                간단한 본인 확인용 정보를 기입한 후에 예약하실 수 있습니다. <br><br>
                
                <b> * 단, 취미를 예약하기 위해서 반드시 결제까지 진행되어야 합니다. </b><br>
                * 예약 후 자세한 사항 및 변경 사항은 재능상인을 통해 안내 받을 수 있습니다. 
            </p>
        </div>
    </div>
   
   <!--  자주 묻는 질문 -->

   
</div>
<script>
$(function(){ 
    $("#btnM1").click(function(){
    $("#m1").fadeIn();
    });

    $("#mc1").click(function(){
    $("#m1").fadeOut();
    });
});

$(function(){ 
    $("#btnM2").click(function(){
    $("#m2").fadeIn();
    });

    $("#mc2").click(function(){
    $("#m2").fadeOut();
    });
});

$(function(){ 
    $("#btnM3").click(function(){
    $("#m3").fadeIn();
    });

    $("#mc3").click(function(){
    $("#m3").fadeOut();
    });
});

$(function(){ 
    $("#btnM4").click(function(){
    $("#m4").fadeIn();
    });

    $("#mc4").click(function(){
    $("#m4").fadeOut();
    });
});

</script>

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
   padding: 40px 80px;
   display: flex;
   width: 100%;
}

.supMenu li {
   flex: 1;
   width: 150px;
   height: 50px;
   text-align: center;
}

.supMenu li span {
   font-size: 25px;
   font-color : #34486b;
   font-weight : bolder;
   position: relative;
}

#btnManual:hover, #btnFaq:hover{
	cursor:pointer;
	color : #eacc16;
	text-decoration : underline;
	text-underline-position : under;
}



/* 이용 메뉴얼, 자주 묻는 질문 배치 */
    .manualContainer, .faqContainer{
        width : 1000px;
        height : auto;
        /* border : 1px solid #34486b; */
        padding : 20px;
        margin-left : 110px;
    }

    h1, h3, h4{
        color : #34486b;
    }

    .manualTitle, .faqTitle{
        padding : 20px;
    }

    .manualBox, .faqBox, .faqBox2{
        display : flex;
        flex-direction: row;
        align-items : center;
        justify-content: space-around;
        flex-wrap: wrap;
    }

    .manual, .faq{
        border : 1px solid #eacc16;
        border-radius: 10px;
        width : 200px;
        height : 200px;
    }

    .btnManual, .btnFaq{
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

    .btnManual:hover, .btnFaq:hover{
        color: #34486b;;
        cursor: pointer;
    }

    .manuQue, .manuFaq{
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

    .manuQue>span, .manuFaq>span{
        font-size : 13px;
    }

    .icon{
        width : 60px;
        height : 60px;
        position : relative;
        top : -46px;
        left : 75px;
    }
    
    .faqBox2{
    	position : relative;
    	top : 25px;
		left : 0px;
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
    #mc2, #fc4{
        height : 430px;
    }
    
   	#mc4{
   		height : 380px;
   	}

	#fc1, #fc8{
		height : 280px;
	}
	
	#fc2, #fc7{
		height : 350px;
	}
	
	#fc3, #fc6{
		height : 340px;
	}
	
	#fc5{
		height : 290px;
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
         <li class="sup sup-1" id="btnManual"><span>이용 메뉴얼</span></li>
         <li class="sup sup-2" id="btnFaq"><span>자주 묻는 질문</span></li>
      </ul>
   </div>
   
   <!-- 이용 메뉴얼 -->
   <div class="manualContainer">
        <div class="manualTitle">
            <h1> 이용 메뉴얼 </h1><br>
            <h3> 안녕하세요. <br> 저희 취미상점은 다음과 같이 운영되고 있습니다. <br>
            아래 가이드라인을 통해 취미상점을 어떻게 사용하는지 알아 볼까요? </h3>
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
	<div class="faqContainer">
        <div class="faqTitle">
            <h1> 자주 묻는 질문 </h1><br>
            <h3> 취미상점의 이용자들이 가장 많이 물어봤던 질문들과 답변을 모아 봤어요 :) <br>
            아래 "번호 버튼"을 클릭하시면 질문과 답변을 확인할 수 있어요 </h3><br>
            <h4> 이 밖에 궁금한 사항이 있는 분들은 취미상점 대표 메일[ hobbyStore@gmail.com ]로 문의글을 남겨주세요 :-) </h4>
            
        </div>
        <br>
        <div class="faqBox">
            <div class="faq" id="faq1">
                <button class="btnfaq" id="btnF1" type="button"> 1</button><br>
                <div class="manuFaq">
                    회원 정보 변경은 <br>
                    어떻게 하나요?
                </div>
                <img class="icon" src="${path}/images/boy.png">
            </div>
			<div class="faq" id="faq2">
                <button class="btnfaq" id="btnF2" type="button"> 2</button><br>
                <div class="manuFaq">
                    아이디와 비밀번호를 <br>
                    잊어버렸어요.
                </div>
                <img class="icon" src="${path}/images/girl.png">
            </div>
			<div class="faq" id="faq3">
                <button class="btnfaq" id="btnF3" type="button"> 3 </button><br>
                <div class="manuFaq">
                    회원 탈퇴는 <br>
                    어떻게 하나요?
                </div>
                <img class="icon" src="${path}/images/boy.png">
            </div>
            <div class="faq" id="faq4">
                <button class="btnfaq" id="btnF4" type="button"> 4</button><br>
                <div class="manuFaq">
                    취미 결제는 <br>
                    어떻게 하나요?
                </div>
                <img class="icon" src="${path}/images/girl.png">
            </div>
    </div>
    
    <div class="faqBox2">
    	<div class="faq" id="faq5">
            <button class="btnfaq" id="btnF5" type="button"> 5</button><br>
              <div class="manuFaq">
                  현장에서 <br>
                  결제할 수 있나요?
              </div>
            <img class="icon" src="${path}/images/girl.png">
         </div>
         <div class="faq" id="faq6">
            <button class="btnfaq" id="btnF6" type="button"> 6</button><br>
              <div class="manuFaq">
                  환불규정이 <br>
                  어떻게 되나요?
              </div>
            <img class="icon" src="${path}/images/boy.png">
         </div>
         <div class="faq" id="faq7">
            <button class="btnfaq" id="btnF7" type="button"> 7</button><br>
              <div class="manuFaq">
                  예약 취소(환불)은 <br>
                  어디서 어떻게 하나요?
              </div>
            <img class="icon" src="${path}/images/girl.png">
         </div>
         <div class="faq" id="faq8">
            <button class="btnfaq" id="btnF8" type="button"> 8</button><br>
              <div class="manuFaq">
                  이런 취미가 <br>
                  있었으면 좋겠어요!
              </div>
            <img class="icon" src="${path}/images/boy.png">
         </div>
    </div>


    <div class="modal" id="f1">
        <div class="modal_content" id="fc1" title="클릭하면 창이 닫힙니다.">
            <h2>  회원 정보 변경은 어떻게 하나요? </h2><br>
            <p>
				 회원 정보는 로그인 후 홈 페이지 우측 상단의 <b>[ 마이 페이지 ]</b>에서 변경할 수 있습니다. <br>
				 [ 내 정보 관리 ] 탭의 <b>[ 프로필 수정 ]</b> 을 통해 변경하고자 하는 정보를 기입한 후 <br>
				 <b>[ 정보 수정 ]</b> 버튼을 클릭하시면, 원하는 정보로 회원 정보를 변경하실 수 있게 됩니다. 
            </p>
            <br><br> 
        </div>
    </div>
    <div class="modal" id="f2">
        <div class="modal_content" id="fc2" title="클릭하면 창이 닫힙니다.">
            <h2>  아이디와 비밀 번호를 잊어버렸어요 </h2><br>
            <p>
				 이미 가입하신 손님 및 상인 고객은 홈페이지 우측 상단에 있는 [ 아이디 찾기 ], [ 비밀번호 찾기 ] 탭을 이용하여<br>
				 아이디와 비밀 번호를 찾으실 수 있습니다. <br><br>
				 
				 <b> * 단, 아이디 찾기와 비밀 번호 찾기시 본인임을 확인하는 개인 정보를 입력해 주셔야 합니다.</b> <br><br>
				 
				 * 기타 개인 사정으로 인해 본인 인증이 어려우신 분은 <b>"취미상점 대표 이메일"로 문의 바랍니다.</b><br>
				 <sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
        </div>
    </div>
        <div class="modal" id="f3">
        <div class="modal_content" id="fc3" title="클릭하면 창이 닫힙니다.">
            <h2>  회원 탈퇴는 어떻게 하나요? </h2><br>
            <p>
				 회원 탈퇴는 [ 마이 페이지 ] 탭의 <b>[ 회원 탈퇴하기 ]</b> 버튼을 통해 가능합니다. <br>
				 <br><br>
				 <b> [ 탈퇴 시 유의사항 ] </b><br>
				 * 탈퇴 시 발생할 수 있는 문제 상황을 예방하여 일정 기간 동안 개인 정보가 보관된 후, 삭제됩니다. <br>
				 * 탈퇴 및 삭제 후 재가입을 하여도 이전에 취미상점에서 활동했던 정보는 복구될 수 없습니다. <br>
            </p>
            <br><br> 
        </div>
    </div>
    <div class="modal" id="f4">
        <div class="modal_content" id="fc4" title="클릭하면 창이 닫힙니다.">
            <h2>  취미 결제는 어떻게 하나요? </h2><br>
            <p>
					취미 결제는 [ 취미 상세 페이지 ]의 <b>[ 결제하기 ]</b> 버튼을 통해 가능합니다. <br>
					또한, 결제는 카카오 페이를 이용한 결제가 가능합니다. <br>
					<br>
					결제 후, <b>[ 마이 페이지 ]</b>에서 결제 및 예약 상태를 확인할 수 있습니다. <br><br><br>
					
					기타 결제와 관련된 문의 사항이 있는 경우, <br>
					* 해당 결제건과 관련된 취미 상세 페이지의 <b>[ 문의하기 ]</b> 탭을 이용해 주세요. <br>
					* 또는, 취미상점 대표 메일로 문의 메일을 보내주시면, 24시간 내에 도와드리도록 하겠습니다. <br>
					<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
        </div>
    </div>
        <div class="modal" id="f5">
        <div class="modal_content" id="fc5" title="클릭하면 창이 닫힙니다.">
            <h2>  현장에서 결제할 수 있나요? </h2><br>
            <p>
					취미상점은 홈페이지에서만 결제(예약)가 가능하면 현장에서는 결제가 불가합니다. <br><br>
					
					재능상인과 손님간 취미로 원활히 소통할 수 있도록, <br>
					결제와 관련된 모든 과정은 취미상점이 중개하며 <b>"중간 정산방식"</b>으로 재능상인에게 정산됩니다. <br>
            </p>
        </div>
    </div>
    <div class="modal" id="f6">
        <div class="modal_content" id="fc6" title="클릭하면 창이 닫힙니다.">
            <h2>  환불규정이 어떻게 되나요? </h2><br>
            <p>
					취미별 환불 규정이 상이하니 반드시 취미 하단에 명시되어 있는 환불 규정을 확인해 주시기 바랍니다. <br>
					환불 관련 문의 사항이 있으면 ( 1 ) 해당 취미를 오픈한 <b>재능상인</b>, 또는 (2) <b>취미상점 대표 메일</b>로 문의 바랍니다. <br>
					<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
             <p>
					환불이 된 경우, 환불 금액은 환불 규정에 따라 공제 후 잔액을 지급해드립니다. <br><br>
					카카오 페이로 결제가 진행된 경우 결제 수단으로 자동환불됩니다.
            </p>
        </div>
    </div>
    <div class="modal" id="f7">
        <div class="modal_content" id="fc7" title="클릭하면 창이 닫힙니다.">
            <h2>  예약 취소(환불) 방법 </h2><br>
            <p>
					1. 해당 취미를 예약(결제)한 계정으로 로그인 <br>
					2. 홈페이지 우측 상단에 위치한 [ 마이 페이지 ] 클릭 <br>
					3. [ 예약한 취미 ] 목록 클릭 <br>
					4. 예약 취소(환불) 버튼을 클릭 <br><br>
					
					* 환불 관련으로 문의사항이 있으시면 취미상점 대표 메일로 문의하여 주시기 바랍니다. <br>
					<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
        </div>
    </div>
        <div class="modal" id="f8">
        <div class="modal_content" id="fc8" title="클릭하면 창이 닫힙니다.">
            <h2>  이런 프립이 있었으면 좋겠어요! </h2><br>
            <p>
					오픈되었으면 하는 취미에 대한 의견을 취미상담에 알려주세요! <br>
					손님의 의견을 발 빠르게 반영하여 더욱더 알차고 재미있는 취미를 준비하겠습니다. <br>
            </p>
        </div>
    </div>
    
    
</div>


   
</div>

<script>
$(function(){
	$(".manualContainer").show();
	$(".faqContainer").hide();
	$("#btnFaq").click(function(){
		$(".manualContainer").hide();
		$(".faqContainer").show();
	});
});

$(function(){
	$("#btnManual").click(function(){
		$(".faqContainer").hide();
		$(".manualContainer").show();
	});
});



</script>

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
<script>
$(function(){ 
    $("#btnF1").click(function(){
    $("#f1").fadeIn();
    });

    $("#fc1").click(function(){
    $("#f1").fadeOut();
    });
});

$(function(){ 
    $("#btnF2").click(function(){
    $("#f2").fadeIn();
    });

    $("#fc2").click(function(){
    $("#f2").fadeOut();
    });
});

$(function(){ 
    $("#btnF3").click(function(){
    $("#f3").fadeIn();
    });

    $("#fc3").click(function(){
    $("#f3").fadeOut();
    });
});

$(function(){ 
    $("#btnF4").click(function(){
    $("#f4").fadeIn();
    });

    $("#fc4").click(function(){
    $("#f4").fadeOut();
    });
});

$(function(){ 
    $("#btnF5").click(function(){
    $("#f5").fadeIn();
    });

    $("#fc5").click(function(){
    $("#f5").fadeOut();
    });
});

$(function(){ 
    $("#btnF6").click(function(){
    $("#f6").fadeIn();
    });

    $("#fc6").click(function(){
    $("#f6").fadeOut();
    });
});

$(function(){ 
    $("#btnF7").click(function(){
    $("#f7").fadeIn();
    });

    $("#fc7").click(function(){
    $("#f7").fadeOut();
    });
});

$(function(){ 
    $("#btnF8").click(function(){
    $("#f8").fadeIn();
    });

    $("#fc8").click(function(){
    $("#f8").fadeOut();
    });
});


</script>

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



/* 자주 묻는 질문 배치 */
    .faqContainer{
        width : 1000px;
        height : auto;
        /* border : 1px solid #34486b; */
        padding : 20px;
        margin-left : 110px;
    }

    h1, h3, h4{
        color : #34486b;
    }

    .faqTitle{
        padding : 20px;
    }

    .faqBox, .faqBox2{
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

    .btnFaq{
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

    .btnFaq:hover{
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

	#fc1{
		height : 280px;
	}
	
	#fc2 {
		height : 350px;
	}
	
	#fc3, #fc7 {
		height : 340px;
	}
	
	#fc4, #fc6{
		height : 380px;
	}
	
	#fc5{
		height : 400px;
	}
	
	#fc8{
		height : 250px;
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
                    손님과 소통은 <br>
                    어떻게 하나요?
                </div>
                <img class="icon" src="${path}/images/girl.png">
            </div>
    </div>
    
    <div class="faqBox2">
    	<div class="faq" id="faq5">
            <button class="btnfaq" id="btnF5" type="button"> 5</button><br>
              <div class="manuFaq">
                  취미 관리는 <br>
                  어떻게 해야 하나요?
              </div>
            <img class="icon" src="${path}/images/girl.png">
         </div>
         <div class="faq" id="faq6">
            <button class="btnfaq" id="btnF6" type="button"> 6</button><br>
              <div class="manuFaq">
                  손님이 예약취소를<br>
           		  요청하면 어떡하나요?
              </div>
            <img class="icon" src="${path}/images/boy.png">
         </div>
         <div class="faq" id="faq7">
            <button class="btnfaq" id="btnF7" type="button"> 7</button><br>
              <div class="manuFaq">
                  손님의 악의적인 <br>
                  비방글에 대한 대처?
              </div>
            <img class="icon" src="${path}/images/girl.png">
         </div>
         <div class="faq" id="faq8">
            <button class="btnfaq" id="btnF8" type="button"> 8</button><br>
              <div class="manuFaq">
                  이런 기능이 <br>
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
            <h2> 손님과 소통은 어떻게 하나요?</h2><br>
            <p>
					취미 손님은 재능상인님이 개설하신 취미의 [ 상세 페이지 ] - <b>[ 문의하기 ]</b>를 통해 질문을 남길 수 있습니다. <br>
					또는, 재능상인으로 가입할 당시 기재하신 <b>이메일 주소</b>로 문의 메일을 남길 수 있습니다. <br>
            </p><br>
            <p>
					상인님은 <b>[ 문의하기 ]</b>를 통해 취미에 대한 손님의 질문 사항에 답변을 남길 수 있으며, <br>
					이 때 답변은 비밀글과 공개글로 구분하여 작성하실 수 있습니다.
            </p><br>
            <p>
            		그 밖에 시스템과 관련한 질문 사항은 저희 취미상점이 안내해드리도록 하겠습니다. <br>
            		질문 사항이 있는 경우 취미상점의 대표 메일로 문의글을 남겨주세요 :-) <br>
            		<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
        </div>
    </div>
        <div class="modal" id="f5">
        <div class="modal_content" id="fc5" title="클릭하면 창이 닫힙니다.">
            <h2>  취미관리는 어떻게 해야 하나요? </h2><br>
            <p>
					재능상인님이 개설하신 취미는 [ 메인 홈페이지 ]의 좌측에 위치한 메뉴바에서 관리할 수 있습니다. <br><br>
					
					<b>1. 취미관리</b><br>
					- 재능상인님이 개설을 원하는 취미의 상세 내용에 대해 등록하고 관리할 수 있습니다. <br><br>
					
					<b>2. 손님관리</b><br>
					- 재능상인님의 취미를 예약하신 손님을 관리할 수 있습니다. <br>
					- 취미를 예약하신 손님의 예약, 출석 현황을 보실 수 있으며 <br>
					상인님이 직접 출석 상태와 예약 상태를 변경하실 수 있습니다. <br>
					- 재능상인님의 취미에 대해 손님이 남겨주신 문의글과 후기글을 보실 수 있습니다. <br>					
            </p>
        </div>
    </div>
    <div class="modal" id="f6">
        <div class="modal_content" id="fc6" title="클릭하면 창이 닫힙니다.">
            <h2> 손님이 예약 취소를 요청한 경우 어떻게 해야 되나요? </h2><br>
            <p>
					환불 규정에 따라 손님이 예약한 취미에 대해 취소를 요청한 경우, <br>
					재능상인은 [ 손님관리 ] - [ 예약 ] 탭의 <b>[ 예약 상태 ]</b>버튼을 눌러 직접 변경할 수 있습니다. <br><br>
					
					* 단, 예약을 취소한 뒤 재예약하는 경우 <b>손님이 직접 예약</b>을 진행하셔야 합니다. <br>
					* 이 밖에 궁금한 점이 있는 경우 <b>취미상점 대표 메일</b>로 문의 바랍니다. <br>
					<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p>
             <p>
					예약 취소가 확인된 경우, 환불 금액은 환불 규정에 따라 공제 후 잔액을 저희 취미상점에서 지급해드립니다. <br><br>
					카카오 페이로 결제가 진행된 경우 결제 수단으로 자동환불됩니다.
            </p>
        </div>
    </div>
    <div class="modal" id="f7">
        <div class="modal_content" id="fc7" title="클릭하면 창이 닫힙니다.">
            <h2>  손님이 악의적으로 비방글을 남기면 어떡하나요? </h2><br>
            <p>
					손님이 취미 수업과 무관하게 악의적으로 비방글을 남길 경우, <br>
					취미상점 대표 메일로 문의하여 주시기 바랍니다. <br>
					<sub> ( 대표 이메일 : hobbyStore@gmail.com )</sub>
            </p><br><br>
            <p>
            		요청하신 글과 상황을 종합적으로 판단하여 악의적인 비방글 및 기타 유해 작성글로 판단될 경우, <br>
            		저희 취미상점 관리자가 해당 글을 <b>"삭제"</b>하고 회원에게 <b>"경고"</b>를 주는 등 <b>후속 조치</b>를 취하겠습니다. 
            </p>
        </div>
    </div>
        <div class="modal" id="f8">
        <div class="modal_content" id="fc8" title="클릭하면 창이 닫힙니다.">
            <h2> 이런 기능이 있었으면 좋겠어요! </h2><br>
            <p>
					취미 수업을 진행하는 과정에서 필요하다고 생각하는 기능이 있으면 언제든지 말해주세요! <br>
					재능상인님의 의견을 발 빠르게 반영하여 더욱더 알차고 재미있는 취미를 준비할 수 있도록 돕겠습니다 :-)<br>
            </p>
        </div>
    </div>
    
    
</div>


   
</div>


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

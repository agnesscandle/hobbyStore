<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<style>
    .manualContainer{
        width : 900px;
        height : auto;
        border : 1px solid #34486b;
        padding : 20px;
        margin : 20px;
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
        padding : 8px;
    }

    .btnManual:hover{
        color: #34486b;;
        cursor: pointer;
    }

    .manual>div{
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

    .manual>div>span{
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

</style>



<body>
    <div class="manualContainer">
        <div class="manualTitle">
            <h1> 운영 메뉴얼 </h1>
            <h3> [ 닉네임 ] 상인님, 안녕하세요. <br> 저희 취미상점은 다음과 같이 운영되고 있습니다. </h3>
        </div>
        <div class="manualBox">
            <div class="manual" id="ma1">
                <button class="btnManual" id="btnM1" type="button" onclick=""> 1</button><br>
                <div>
                    재능상인이<br>
                    무엇인가요? 
                </div>
                <img class="icon" src="../../../resources/images/girl.png">
            </div>
            <div class="manual" id="ma2">
                <button class="btnManual" id="btnM2"> 2</button><br>
                <div>
                    재능상인은<br>
                    어떻게 될 수 있나요?
                </div>
                <img class="icon" src="../../../resources/images/boy.png">  
            </div>
            <div class="manual" id="ma3">
                <button class="btnManual" id="btnM3"> 3</button><br>
                <div>
                    사업자 등록증이<br>
                    반드시 있어야 하나요?
                </div>
                <img class="icon" src="../../../resources/images/girl.png">  
            </div>
            <div class="manual" id="ma4">
                <button class="btnManual" id="btnM4"> 4</button><br>
                <div>
                    정산은 <br>
                    어떻게 진행되나요?
                </div>
                <img class="icon" src="../../../resources/images/boy.png">  
            </div>
        </div>
    
        <div id="no1" class="modal">
            <h2> 재능상인이 무엇인가요? </h2>
            다양한 분야에서 본인의 경험과 노하우가 있으며 이를 바탕으로 취미상점에서 모임을 리드하는 사람들을 "재능 상인"이라고 합니다.
            <br><br> 
            <button class="btnCloseModal"> 닫기 </button>
        </div>
        
        <div>
            <h2> 재능상인은 어떻게 될 수 있나요? </h2>
            취미상점 홈페이지 상단에 [ 회원가입 ] - [ 상인으로 가입하기 ] 을 클릭하면 가입하실 수 있습니다. <br><br>
            상인으로 가입이 완료된 경우, 원하는 재능과 관련된 취미를 등록함으로써 재능상인으로서 활동할 수 있게 됩니다. 
        </div>
    
        <div>
            <h2> 사업자 등록증이 반드시 있어야 하나요? </h2>
            그렇지 않습니다! <br>
            취미 상점의 "재능 상인"은 본인만이 가지고 있는 콘텐츠가 있고, 하고자 하는 프로그램이 있다면 누구나 상인으로 등록하여 취미 수업을 진행할 수 있습니다. <br>
            <br>
            여러분 모두 누구나 재능 상인이 될 수 있으며, 손님 회원 또한 상인 등록만 한다면 재능 상인으로서 활동할 수 있게 됩니다 :-)
        </div>
    
        <div>
            <h2> 정산은 어떻게 진행되나요? </h2>
            취미상점은 재능상인과 손님과의 원활한 취미 소통을 위하여 "정산 방식"으로 진행됩니다. <br>
            따라서 손님이 상인에게 직접 지불하는 방식이 아니라 취미상점의 관리자를 통해 정산됩니다. <br><br>
    
            정산 신청은 [ 상인 페이지 ] 의 [ 정산 신청 ] 을 통해 언제든지 관리자에게 요청할 수 있으며, <br>
            신청을 하지 않아도 매주 수요일마다 기간 단위로 환산하여 입금처리 됩니다. <br>
        </div>
    
    </div>
</body>
<script>
$("#btnM1").click(function(event){
    event.preventDefault();

    $(this).modal({
        fadeDuration : 250
    });
});
</script>
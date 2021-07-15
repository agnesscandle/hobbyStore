<style>
    .manualContainer{
        width : 900px;
        border : 1px solid #34486b;
        padding : 20px;
        margin : 20px;
    }

    h2, h3{
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
        top : 10px;
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
        top : 20px;
        left : 10px;
        text-align: center;
        font-size : 16px;
        font-weight: bolder;
        color : #34486b;
        border :solid 1px  red;
    }

    .manual>div>span{
        font-size : 13px;
    }

    .icon{
        width : 60px;
        height : 60px;
        position : relative;
        top : -55px;
        left : 75px;
    }
</style>

<div class="manualContainer">
    <div class="manualTitle">
        <h2> 운영 메뉴얼 </h2>
        <h3> [ 닉네임 ] 상인님, 안녕하세요. <br> 저희 취미상점은 다음과 같이 운영되고 있습니다. </h3>
    </div>
    <div class="manualBox">
        <div class="manual" id="ma1">
            <button class="btnManual" id="btnM1"> 1</button><br>
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
</div>
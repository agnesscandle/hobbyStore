<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/hobby/reserve.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />


<div class="divReserve">
    <div class="ul">
       <ul class="gnb">
          <li class="step step-1 active"><span>예약 취미 정보</span></li>
          <li class="step step-2"><span></span>예약 날짜 선택</li>
          <li class="step step-3"><span>예약자 정보</span></li>
          <li class="step step-4"><span>결제 정보</span></li>
          <li class="step step-5"><span>약관 동의</span></li>
       </ul>
    </div>
 
 	<form id="reserveForm" name="reserveForm" action="${path}/hobby/reserve" method="post">
 		<input type="hidden" name="merNo" value="1" /> 
 
       <div class="reserve reserve-1 active">
          <section>
             <div class="title">
                <span>취미명</span> 
                <input type="text" id="hbTitle" name="hbTitle" class="req" value="${hobby.hbTitle}" readonly/>
                <input type="hidden" id="hbNo" name="hbNo" class="req" value="${hobby.hbNo}"/>
                <span>취미 가격</span>
                <input type="text" id="hbFee" name="hbFee" class="req" value="${hobby.hbFee}"  readonly/>
                <sub> 할인 취미의 경우 "결제 시" 자동으로할인이 적용됩니다. </sub>      
                <span>인원 수</span>
                <input type="number" id="resCount" name="resCount" class="req" value="1" required/>
                <div class="btn">
 
                   <!-- <button>이전으로</button> -->
                   <input type="button" class="next" value="다음으로" />
 
                </div>
             </div>
             <div class="warn">
                <p>
                   취미 예약은 1(인)을 기준으로 가격이 설정되며, 인원 추가를 원하는 경우 자동으로 증액되어 예약됩니다. <br>
                   - 예약 가격 = 취미 가격 * 인원 수 <br>
                   - 손님이 원하는 경우 증원 가능 <br><br>
                   
                   예약에 대한 계획이 변경될 수 있기에 예약 후 제공되는 메시지를 확인해 주세요.<br>
                   예약 후 궁금한 점은 상인에게 문의해 주세요. <br>
                   취미 클래스를 약속대로 이행하고 손님과 성실히 소통할 책임은 상인에게 있습니다. <br>
                   
                </p>
             </div>
          </section>
       </div>
       <div class="reserve reserve-2">
        <section>
           <div class="title">
              <span>취미 예약일 선택</span> 
              <input type="date" id="takeDate" name="takeDate" min="${today}" max="" class="req"/> 
              

              <div class="btn">
                 <input type="button" class="before" value="이전으로" /> 
                 <input type="button" class="next" value="다음으로" />
              </div>
           </div>
           <div class="warn">
              <p>
                 - 취미를 예약하고자 하는 날짜를 반드시 선택해 주세요. <br>
                 - 손님의 과실 및 예약 날짜 오지정으로 인한 변경이 불가능 하오니, 확인 후 진행해 주시기 바랍니다. <br>
                 - 예약 후 상인의 재량에 따라 날짜를 변경할 수 있습니다. <br>
              </p>
           </div>
        </section>
     </div>
       <div class="reserve reserve-3">
          <section>
             <div class="title">
                <span>예약자 아이디</span> 
                <input type="hidden" id="memNo" name="memNo" class="req" value="${loginMember.memNo}"/>
                <input type="text" id="memId" name="memId" class="req" value="${loginMember.memId}" readonly/>
                
                <span>예약자 성함</span>
                <input type="text" id="resName" name="resName" class="req" placeholder="홍길동" required/>
                
                <span>휴대폰 번호</span>
                <input type="text" id="resPhone" name="resPhone" class="req" placeholder="010-1111-2222" required/>
 				<sub> * (-) 언더바 없이 입력해 주세요. </sub>
 				
                <div class="btn">
                   <input type="button" class="before" value="이전으로" /> <input
                      type="button" class="next" value="다음으로" />
                </div>
             </div>
             <div class="warn">
                <p>
                   - 예약 누락 및 중복 예약을 방지하기 위해 예약한 취미에 따라 상인이 본인 확인을 요구할 수 있습니다. <br>
                   - 배송 및 예약자 정보 확인을 위해 실명을 입력할 것을 권장합니다. <br>
                </p>
             </div>
          </section>
       </div>
       <div class="reserve reserve-4">
          <section>
             <div class="title">
                <span>예약 취미 금액</span>
                <input type="text" id="hbFee" name="hbFee" value="${hobby.hbFee}" class="req" readonly/>
                
				<c:if test="${ hobby.hbDiscountStatus eq 'Y' }">
				<!-- disFee(할인가:할인해주는 가격), payFee(최종 결제금액:취미금액-할인가) -->
					<fmt:parseNumber var="disFee" value="${(hobby.hbFee * hobby.hbDiscountRate) / 100}" integerOnly="true"/>
	                <fmt:parseNumber var="payFee" value="${hobby.hbFee-disFee}" integerOnly="true"/>
	                
	                <span>할인 금액</span>
	                <input type="text" name="disFee" value="${disFee}" class="req" readonly/>
	                <span>총 결제 금액</span>
	                <b><input type="text" id="payFee" name="payFee" value="${payFee}" class="req" readonly/></b>
	            </c:if>
                <c:if test="${ hobby.hbDiscountStatus eq 'N' }">
					<span>할인 금액</span> 
	                    <input type="text" name="disFee" value="0" class="req" readonly/>
	                <span>총 결제 금액</span>
	                <b><input type="text" id="payFee" name="payFee" value="${hobby.hbFee}" class="req" readonly/></b>
                </c:if>
                <sub> * 금액 확인 후, 이상이 없으면 "다음" 버튼을 클릭해 주세요 </sub>
                
 
                <div class="btn">
                   <input type="button" class="before" value="이전으로" /> 
                   <input type="button" class="next" value="다음으로" />
                </div>
             </div>
             <div class="warn">
                <p>
                   - 할인 취미에 해당하는 경우을 상인이 설정한 할인율이 적용되어 감액됩니다. <br><br>
                   - 예약 취미 금액 = 취미 가격 * 총 인원 수 <br>
                   - 총 결제 금액 = 총 예약 금액 - 할인 금액 <br>
                </p>
             </div>
          </section>
       </div>
       <div class="reserve reserve-5">
          <section>
             <div class="title">

                <span>약관 동의</span> 
                	<b>화면에 보이는 약관을 읽어보신 후, 아래 체크 박스를 선택해 주세요.</b><br><br>
                	
                	<p>
                	<b>* 개인정보 제3자 제공 동의 약관 *</b> <br>
                    - 취미상점 내 "손님"(이하 사용자)의 개인정보는 당사의 개인정보 취급방침에 따라 안전하게 보호됩니다.<br> 
                    - '취미상점'은 사용자들의 개인정보를 개인정보 취급방침의 '제 2조 수집하는 개인정보의 항목, 수집방법 <br>및 이용목적'에서 고지한 범위 내에서 사용하며,
					이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. <br>
                	</p>
                    <br><br>
                    <input type="checkbox" name="clause" value="clause"/> 
                    <b>개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다. (필수) </b>
 					<br><br><br>
                <div class="btn">
                   <input type="button" class="before" value="이전으로" /> 
                   <input type="button" class="pay" id="btnPay" value="결제하기" />
                </div>
             </div>
             <div class="warn">
                <p>
                    <b>* 결제 대행 서비스 이용 약관 *</b> <br>
                    - 결제 대행 서비스 이용 약관에 따라 취미상점(이하 회사)이 제공하는 전자지급 결제대행 서비스 및 결제대금 예치 서비스를
                    사용자가 이용함에 있어 회사와 사용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 함을 약속한다.<br><br>
                    - 회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 
                    이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니한다. <br>
                    다만 「금융실명거래 및 비밀보장에 관한 법률」 제4조 제1항 단서의 규정에 따른 경우 및
                    그 밖에 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니한다.

                </p>
             </div>
          </section>
       </div>
 	</form>
 </div>


<script>

/* 다음으로 버튼 클릭 시 각 section 항목들이 다 작성되어있는지 검사 */
var seq = 1;
$('.next').click(function(){
   
   var is_empty = false;
   $('.reserve-'+seq).find('.req').each(function(){
          if(!$(this).val()) {
              is_empty = true;
          }
   });
   if(is_empty) {
       alert('값을 전부 입력해주십시오.');
       return;
   }
   if($("input:checkbox[id='term']").is(":checked") == true ){
      $('#disStat').find('.reqDisRate').each(function(){
          if(!$(this).val()) {
              is_empty = true;
          }
      });
      if(is_empty) {
          alert('값을 전부 입력해주십시오.');
          return;
      }
   }

   seq = seq +1;
    $('.step').siblings('.step').removeClass('active')
    $('.step-'+seq).addClass('active')
    $('.reserve').siblings('.reserve').removeClass('active')
    $('.reserve-'+seq).addClass('active')
    
  });
 $('.before').click(function(){
   seq = seq -1;
    $('.step').siblings('.step').removeClass('active')
    $('.step-'+seq).addClass('active')
    $('.reserve').siblings('.reserve').removeClass('active')
    $('.reserve-'+seq).addClass('active')
  });
 
 
 /* 결제하기 버튼 클릭 시 약관 동의에 체크했는지 검사 */
 $('.pay').click(function(){
      if($("input:checkbox[name='clause']").is(":checked")==false) {
          alert('약관에 동의해주세요.');
          return;
      } else{
          $("#reserveForm").submit();
      }
 });
 

</script>




<%@ include file="../../views/common/footer.jsp"%>
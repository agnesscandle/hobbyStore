<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/css/hobby/enroll.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="divEnroll">
   <div class="ul">
      <ul class="gnb">
         <li class="step step-1 active"><span>클래스 기본정보</span></li>
         <li class="step step-2"><span>클래스 소개</span></li>
         <li class="step step-3"><span>클래스 일정 및 가격</span></li>
         <li class="step step-4"><span>클래스 부가정보</span></li>
         <li class="step step-5"><span>클래스 상세설명</span></li>
         <li class="step step-6"><span>클래스 등록 및 약관동의</span></li>
      </ul>
   </div>


   <form id="enrollForm" action="${ path }/merchant/hobbyEnroll" method="POST"
      enctype="multipart/form-data">

      <input type="hidden" name="merNo" value="1" /> 

      <div class="enroll enroll-1 active">
         <section>
            <div class="title">
               <span>타이틀</span> 
               <input type="text" id="hbTitle" name="hbTitle" class="req" placeholder="취미 키워드를 적어주세요.(13자 이내)"> 
               <span>간략소개</span>
               <input type="text" id="hbSummary" name="hbSummary" class="req" placeholder="취미를 간략하게 소개해주세요.">
               <span>카테고리</span>
               <select id="cateNo" name="cateNo" class="req">
                         <option value="" selected> 카테고리 </option>       
                          <c:forEach var="category" items="${ list }">
                         <option value="${ category.cateNo }">
                         <c:out value="${ category.cateName }"/>
                         </option>
                         </c:forEach>
                    </select>
                     
                <script>
                   $(document).ready(function(){
                  $("#cateNo").change(function(){
                     var a = $(this).val();
                  });
                      
                    });
                
                </script>

               <div class="btn">

                  <!-- <button>이전으로</button> -->
                  <input type="button" class="next" value="다음으로" />

               </div>
            </div>
            <div class="warn">
               <p>
                  다음과 같은 경우 오픈이 어렵습니다.<br> - 소개팅 / 남녀 만남 주선 프립<br> -
                  드라이브, 안전이 보장되지 않은 장소에서 진행하는 프립<br> - 개인 판매 또는 타 플랫폼과 금액 차이가
                  나는 프립<br> - 상품설명이 300자 이내인 프립(띄어쓰기 포함)<br> - 프립이후, 추가
                  영업이 의심되는 상품 (보험,재무설계 등)<br> - 상품에 대한 아래사항 3가지 설명이 부족한 상품<br>
                  ① 프립 진행 방식<br> ② 이 프립을 추천하고 싶은 사람들<br> ③ 이 프립을 통해 대원이
                  얻어갈 수 있는 것<br>
               </p>
            </div>
         </section>
      </div>
      <div class="enroll enroll-2">
         <section>
            <div class="title">
               <!-- 
               <span>취미 URL</span> <input type="text" id="hbUrl" name="hbUrl"
                  class="req" placeholder="URL"> <span>취미 썸네일 URL</span> <input
                  type="text" id="hbThumUrl" name="hbThumUrl" class="req"
                  placeholder="URL"> <input type="hidden" name="hbThumName"
                  value="null" /> 
                  
                   -->
                  <span>대표 이미지</span>
                  <div class="file-upload preview-image">
                        <input type="text" class="upload-name" value="파일선택" disabled="disabled"> 
                        <label for="input-file">업로드</label> 
                        <input type="file" id="input-file" name="input-file" class="upload-hidden">
                     </div>

               <span>추가 이미지</span>
               <input multiple="multiple" type="file" name="file" id="btnAtt"/>
               <div id="att_zone"></div>


               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> <input
                     type="button" class="next" value="다음으로" />
               </div>
            </div>
            <div class="warn">
               <p>
                  - 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px
                  (고해상도 지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권,
                  저작권에 문제가 없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~
                  최대 5장까지 가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
               </p>
            </div>
         </section>
      </div>
      <div class="enroll enroll-3">
         <section>
            <div class="title">
               <span>취미 시작일</span> 
               <input type="date" id="hbStartDate" name="hbStartDate" min="${today}" class="req"> 
               <span>취미 종료일</span> 
               <input type="date" id="hbEndDate" name="hbEndDate" min="${today}" class="req">

               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> 
                  <input type="button" class="next" value="다음으로" />
               </div>
            </div>
            <div class="warn">
               <p>
                  - 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px
                  (고해상도 지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권,
                  저작권에 문제가 없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~
                  최대 5장까지 가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
               </p>
            </div>
         </section>
      </div>
      
      <div class="enroll enroll-4">
         <section>
            <div class="title">
               <span>취미 구매 옵션(1회권)</span> 
               <input type="text" id="hbFee" name="hbFee" placeholder="1회권의 가격을 책정해주세요.(숫자만 입력해주세요.)" class="req"> 
               <span>취미 할인여부</span>
               <div id="disStat">
                  <label>할인 적용</label> 
                  <input type="checkbox" id="hbDiscountStatus"
                     name="hbDiscountStatus" value="Y"/>
                  <c:out value="(추후에 변경이 가능합니다.)"></c:out>
                  <div id="disRate">
                     <span>취미 할인률</span> 
                     <input type="text" id="hbDiscountRate" name="hbDiscountRate" class="reqDisRate" placeholder="1회권의 가격을 책정해주세요.(%없이 숫자만 입력해주세요.)">
                  </div>
               </div>
               

               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> 
                  <input type="button" class="next" value="다음으로" />
               </div>
            </div>
            <div class="warn">
               <p>
                  - 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px
                  (고해상도 지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권,
                  저작권에 문제가 없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~
                  최대 5장까지 가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
               </p>
            </div>
         </section>
      </div>
      
      <div class="enroll enroll-5">
         <section>
            <div class="title">
      
               <span>설명 이미지</span> 
               <div class="file-upload-detail preview-image-detail">
                   <input type="text" class="upload-name-detail" value="파일선택" disabled="disabled"> 
                   <label for="input-file-detail">업로드</label> 
                   <input type="file" id="input-file-detail" name="input-file-detail" class="upload-hidden-detail">
               </div>
               
               <span>설명</span> 
               <textarea id="detail" name="hbDetailInfo" class="req" cols="67" rows="15" placeholder="설명을 입력해주세요"style="resize: none;"></textarea>
               
               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> 
                  <input type="button" class="next" value="다음으로" />
               </div>
            </div>
            <div class="warn">
               <p>
                  - 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px
                  (고해상도 지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권,
                  저작권에 문제가 없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~
                  최대 5장까지 가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
               </p>
            </div>
         </section>
      </div>
      
      <div class="enroll enroll-6">
         <section>
            <div class="title">

               <span>설명</span> 
               <input type="text" id="hbThumUrl" name="hbInfo" class="req" placeholder="설명"> 
               <span>주소 입력하기</span> 
               <input type="text" class="req" name="postcode" id="postcode" placeholder="우편번호"/> 
               <input type="button" value="주소 찾기" id="hbLocationButton" onclick="sample4_execDaumPostcode();"/> 
               <input type="text" class="req" name="hbLocation" id="roadAddress"  placeholder="주소"/>
               <input type="text" class="req" name="exactAddress" id="exactAddress"  placeholder="상세주소"/>

               <div class="btn">
                  <input type="button" class="before" value="이전으로" /> 
                  <input type="button" class="register" value="등록하기" />
               </div>
            </div>
            <div class="warn">
               <p>
                  - 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px
                  (고해상도 지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권,
                  저작권에 문제가 없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~
                  최대 5장까지 가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
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
   $('.enroll-'+seq).find('.req').each(function(){
          if(!$(this).val()) {
              is_empty = true;
          }
   });
   if(is_empty) {
       alert('값을 전부 입력해주십시오.');
       return;
   }
   if($("input:checkbox[id='hbDiscountStatus']").is(":checked") == true ){
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
    $('.enroll').siblings('.enroll').removeClass('active')
    $('.enroll-'+seq).addClass('active')
    
  });
  
 $('.before').click(function(){
   seq = seq -1;
    $('.step').siblings('.step').removeClass('active')
    $('.step-'+seq).addClass('active')
    $('.enroll').siblings('.enroll').removeClass('active')
    $('.enroll-'+seq).addClass('active')
  });
 
 
 /* 등록하기 버튼 클릭 시 마지막 section 항목들이 다 작성되어있는지 검사 */
 $('.register').click(function(){
    var is_empty = false;
      $('.enroll-6').find('.req').each(function(){
             if(!$(this).val()) {
                 is_empty = true;
             }
      });
      if(is_empty) {
          alert('값을 전부 입력해주십시오.');
          return;
      }else{
         $('#enrollForm').submit();
      }
 });
 
  
  /* 다중 이미지 파일 미리보기 */
 ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:100px;height:100px;margin:5px;border:1px solid #ddd;border-radius:3px;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#000';
  
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')

  
  
  
 /* 썸네일 이미지 파일 미리보기 */
$(document).ready(function(){

    var fileTarget = $('.file-upload .upload-hidden');

    fileTarget.on('change', function(){  // 값이 변경되면
         if(window.FileReader){  // modern browser
              var filename = $(this)[0].files[0].name;
         } 
         else {  // old IE
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
         }

         // 추출한 파일명 삽입
         $(this).siblings('.upload-name').val(filename);
    });
}); 

var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();

    if(window.FileReader){
         //image 파일만
         if (!$(this)[0].files[0].type.match(/image\//)) return;

         var reader = new FileReader();
         reader.onload = function(e){
              var src = e.target.result;
              parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
         }
         reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

         var img = $(this).siblings('.upload-display').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});



/* 상세 이미지 파일 미리보기 */
$(document).ready(function(){

    var fileTarget = $('.file-upload-detail .upload-hidden-detail');

    fileTarget.on('change', function(){  // 값이 변경되면
         if(window.FileReader){  // modern browser
              var filename = $(this)[0].files[0].name;
         } 
         else {  // old IE
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
         }

         // 추출한 파일명 삽입
         $(this).siblings('.upload-name-detail').val(filename);
    });
}); 

var imgTarget = $('.preview-image-detail .upload-hidden-detail');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display-detail').remove();

    if(window.FileReader){
         //image 파일만
         if (!$(this)[0].files[0].type.match(/image\//)) return;

         var reader = new FileReader();
         reader.onload = function(e){
              var src = e.target.result;
              parent.prepend('<div class="upload-display-detail"><div class="upload-thumb-wrap-detail"><img src="'+src+'" class="upload-thumb-detail"></div></div>');
         }
         reader.readAsDataURL($(this)[0].files[0]);
    }

    else {
         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display-detail"><div class="upload-thumb-wrap-detail"><img class="upload-thumb-detail"></div></div>');

         var img = $(this).siblings('.upload-display-detail').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
});





/* Daum 주소 API */
   function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
            child.close();
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("exactAddress").value = extraRoadAddr;
            } else {
                document.getElementById("exactAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
 			
        }
    }).open();
    
   
}
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<link rel="stylesheet" href="${path}/css/view.css">
<link rel="stylesheet" href="${path}/css/hobby/review.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />



<div class="detail" id="reviewAreaD">
	<div class="reviewDiv">
	
		<!-- 상단: 후기 개수, 글쓰기 버튼, 분류별 검색 --> 
		<div id="reviewListTitle">
			<span> <c:out value="후기${ count }개" /></span> 
			<select name="sortReview" id="sortReview">
				
					<option value="high" selected="selected">평점 높은순</option>
					<option value="low">평점 낮은순</option>
					<option value="recent">최신순</option>
					<option value="help">도움순</option>
				</optgroup>
			</select>
			
			<c:if test="${loginMember != null && reserveCount > 0}">

				<button id="review"><c:out value="글쓰기"/></button>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span>후기 작성</span>
						 <span class="close">&times;</span>
						 
						 <div class="myScore">
						
							<span>내 평점 </span>
							<p class="star_rating">
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							    <a href="#" class="on">★</a>
							    <a href="#">★</a>
							    <a href="#">★</a>
							</p>
						</div>
						<script>
							$( ".star_rating a" ).click(function() {
							     $(this).parent().children("a").removeClass("on");
							     $(this).addClass("on").prevAll("a").addClass("on");
							     var score = $('.on').length;
								 $('#rvScore').val(score);
							     return false;
							});				
						</script>
						<form action="${path}/hobby/view/writeReview" method="POST"
							id="reviewWrite" enctype="multipart/form-data">
							<input type="hidden" id="rvScore" name="rvScore" value="3"/>
							<input type="hidden" name="hbNo" value="${hobby.hbNo}">
							<textarea id="reviewContent" name="rvContent" class="req"
								placeholder="후기를 작성해주세요. 문의는 '문의하기'에서 가능합니다."></textarea>
								
							<input multiple="multiple" type="file" name="file" id="btnAtt"/>
               				<div id="att_zone"></div>
							<input type="submit" value="제출하기" />
						</form>
					</div>
				</div>

				<script>
				/* 후기 글 작성 관련 modal */ 
		        var modal = document.getElementById('myModal');

		        var btn = document.getElementById("review");
		 
		        var span = document.getElementsByClassName("close")[0];                                          

		        btn.onclick = function() {
		            modal.style.display = "block";
		        }

		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		 
		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        }
		        
				
				var review = document.getElementsByClassName("close")[0];                                          

				btn.onclick = function() {
				    modal.style.display = "block";
				}

				</script>

			</c:if>
		</div>

		<!-- 후기 목록 -->
      <div id="reviewList">
      
      	<!-- 1. 후기가 없을 경우 -->
        <c:if test="${empty reviewList}">
           <span id="noReview">아직 후기가 없습니다. 가장 먼저 후기를 남겨주세요 :)</span>
        </c:if>
        
         <!-- 1. 후기가 있는 경우 -->
         <c:if test="${!empty reviewList}">
            <c:forEach var="review" items="${ reviewList }">
               <div id="review">
                  
                  <!-- 후기를 작성한 회원의 정보, 작성일자, 별점 -->
                  <div id="memInfo">
                     <img id="memImg"
                        src="${path}/resources/upload/user/${review.memImgRename}" />
                     <div>
                        <span> ${ review.memName } </span> <span> <fmt:formatDate
                              var="dateTempParse" pattern="yyyy-MM-dd HH:mm"
                              value="${ review.rvModifyDate }" /> <c:set var="addInfo"
                              value=" 작성됨" /> <c:out value="${dateTempParse}${addInfo}" />

                        </span> <span> <c:forEach var="i" begin="1"
                              end="${review.rvScore}">
                              <i class="fas fa-star"></i>
                           </c:forEach>
                        </span>
                     </div>
                     <div class="likeReview">
                     	<span class="clickGood">
                     		<c:out value="도움돼요"></c:out>
                     		<i class="far fa-thumbs-up fa-2x"></i>
                     	</span>
                     	
                     	<script>
                     	$('.clickGood').click(function() {
                     		location.href='${path}/hobby/view/deleteReview?rvNo=${reviewByNo.rvNo}';
                     	});
                     	</script>
                     </div>
                  </div>
                  
                  <!-- 후기를 작성한 이력이 있으면 작성한 글을 수정하는 버튼이 나타남(이력이 없으면 화면에 보이지 않음) -->
                  <c:if test="${ reviewByNo!= null && reviewByNo.memNo eq review.memNo }">
                     <button id="update">수정</button>
                     <button id="delete">삭제</button>
                     
                     <script>
                     	$('#delete').click(function() {
                     		var returnValue = confirm('게시글을 삭제하시겠습니까?');
                     		if(returnValue){
                     			location.href='${path}/hobby/view/deleteReview?rvNo=${reviewByNo.rvNo}';
                     		}
                     		return;
                     	});
                     	
                     </script>
                     
                     
                     <div id="myModalupd" class="modalupd">
                        <div class="modal-contentupd">
                           <span>후기 수정</span> 
                           <span class="close">&times;</span>
                           <div class="myScore">
                              <span>내 평점 </span>
                              <p class="star_rating_update">
                                  <a href="#">★</a>
                                  <a href="#">★</a>
                                  <a href="#">★</a>
                                  <a href="#">★</a>
                                  <a href="#">★</a>
                              </p>
                           </div>
                           
                           <script>
                           
                              for(var i=0;i<${reviewByNo.rvScore};i++){                                 
                                 $(".star_rating_update a:eq("+i+")").addClass("on");
                              }
                              
                              $( ".star_rating_update a" ).click(function() {
                                   $(this).parent().children("a").removeClass("on");
                                   $(this).addClass("on").prevAll("a").addClass("on");
                                   var score = $('.on').length;
                                  $('#rvScoreupd').val(score);
                                   return false;
                              });
                              
                           </script>
                           
                           	<form action="${path}/hobby/view/updateReview" method="POST" id="updatewWrite" enctype="multipart/form-data">
                              	<textarea id="reviewContent" name="rvContent" class="req">${reviewByNo.rvContent}</textarea>
                              	<input type="hidden" id="rvScoreupd" name="rvScore" value="${reviewByNo.rvScore}"/>
								<input type="hidden" name="hbNo" value="${hobby.hbNo}">
								<input type="hidden" name="rvNo" value="${reviewByNo.rvNo}">
                              	<input multiple="multiple" type="file" name="file" id="btnAtt"/>
                              	<div id="att_zone"></div>
								<span>새로운 파일을 업로드하시면, 이전 파일은 전부 삭제됩니다.</span>
                               	<input type="submit" value="제출하기" />
                           	</form>
                           
                        </div>
                     </div>
                     
                     <script>
                     /* 후기 글 수정 관련 modal */ 
                       var modal = document.getElementById('myModalupd');
                       var btn = document.getElementById("update");
                       var span = document.getElementsByClassName("close")[0];                                          
                
                       btn.onclick = function() {
                           modal.style.display = "block";
                       }
                
                       span.onclick = function() {
                           modal.style.display = "none";
                       }
                
                       window.onclick = function(event) {
                           if (event.target == modal) {
                               modal.style.display = "none";
                           }
                       }
         
                     var review = document.getElementsByClassName("close")[0];                                          
         
                     btn.onclick = function() {
                         modal.style.display = "block";
                     }
                     
                     </script>
                     
                  </c:if>

                  <!-- 후기 내용, 이미지 -->      
                  <span id="rvContent"> <c:out value="${ review.rvContent }" /> </span>

				  <!-- 등록한 이미지가 있는 경우 -->
                  <c:if test="${review.rvRenameFilename != null}">

                     <div id="reviewImgs">
                        <c:set var="imgs" value="${fn:split(review.rvRenameFilename,',')}" />
                        <c:forEach var="fileName" items="${imgs}" varStatus="g">
                           <img id="eachImg" src="${path}/resources/upload/review/${fileName}" />
                        </c:forEach>

                     </div>
                  </c:if>

               </div>
            </c:forEach>
         </c:if>
      </div>

		<!-- 후기 페이지바 -->
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<c:if test="${ listCount > 4}">
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=1'">&lt;&lt;</button>

				<!-- 이전 페이지로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${ pageInfo.prvePage }'">&lt;</button>

				<!--  10개 페이지 목록 -->

				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
					step="1" varStatus="status">
					<c:if test="${pageInfo.currentPage == status.current }">
						<button disabled>
							<c:out value="${status.current}" />
						</button>
					</c:if>
					<c:if test="${pageInfo.currentPage != status.current }">
						<button
							onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${status.current}'">
							<c:out value="${status.current}" />
						</button>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${pageInfo.nextPage}'">&gt;</button>

				<!-- 맨 끝으로 -->
				<button
					onclick="location.href='${path}/hobby/view/reviewList?hbNo=${hobby.hbNo}&page=${pageInfo.maxPage}'">&gt;&gt;</button>
			</c:if>

		</div>
	</div>
</div>


<script>

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
    

    
    /*첨부된 이미리들을 배열에 넣고 미리보기 */
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

</script>

<%@ include file="../../views/common/footer.jsp"%>
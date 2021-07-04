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
		<div id="reviewListTitle">
			<span> <c:out value="후기${ count }개" />
			</span> <select name="sortReview" id="sortReview">
				<option value="high" selected="selected">평점 높은순</option>
				<option value="low">평점 낮은순</option>
				<option value="recent">최신순</option>
				<option value="help">도움순</option>

				</optgroup>
			</select>
			<c:if test="${loginMember != null && reserveCount > 0}">

				<button id="review">글쓰기</button>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<span>후기 작성</span> <span class="close">&times;</span>
						<form action="${path}/hobby//view/writeReview" method="POST"
							id="reviewWrite" enctype="multipart/form-data">

							<textarea id="reviewContent" name="rvContent" class="req"
								placeholder="후기를 작성해주세요. 문의는 '문의하기'에서 가능합니다."></textarea>
							<input multiple="multiple" type="file" name="file" id="btnAtt" />
							<div id="att_zone"></div>

						</form>
					</div>
				</div>

				<script>
				 // Get the modal
		        var modal = document.getElementById('myModal');
		 
		        // Get the button that opens the modal
		        var btn = document.getElementById("review");
		 
		        // Get the <span> element that closes the modal
		        var span = document.getElementsByClassName("close")[0];                                          
		 
		        // When the user clicks on the button, open the modal 
		        btn.onclick = function() {
		            modal.style.display = "block";
		        }
		 
		        // When the user clicks on <span> (x), close the modal
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		 
		        // When the user clicks anywhere outside of the modal, close it
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
		<div id="reviewList">
			<c:if test="${reviewList == null} ">
				<tr>
					<td colspan="6">조회된 후기가 없습니다.</td>
				</tr>

			</c:if>
			<c:if test="${ reviewList != null }">
				<c:forEach var="review" items="${ reviewList }">
					<div id="review">
						<div id="memInfo">
							<img id="memImg"
								src="${path}/resources/upload/user/${review.memImgRename}" />
							<div>
								<span> ${ review.memName } </span> <span> <fmt:formatDate
										var="dateTempParse" pattern="yyyy-MM-dd HH:mm"
										value="${ review.rvCreateDate }" /> <c:set var="addInfo"
										value=" 작성됨" /> <c:out value="${dateTempParse}${addInfo}" />

								</span> <span> <c:forEach var="i" begin="1"
										end="${review.goodReview}">
										<i class="fas fa-star"></i>
									</c:forEach>
								</span>
							</div>
						</div>
						<c:if
							test="${ reviewByNo!= null && reviewByNo.memNo eq review.memNo }">
							<button id="update">수정</button>
							<div id="myModalupd" class="modalupd">
								<div class="modal-contentupd">
									<span>후기 작성</span> <span class="close">&times;</span>
									<form action="${path}/hobby//view/writeReview" method="POST"
										id="reviewWrite" enctype="multipart/form-data">

										<textarea id="reviewContent" name="rvContent" class="req" >${reviewByNo.rvContent}</textarea>
										<!-- <input multiple="multiple" type="file" name="file" id="btnAtt" />
										<div id="att_zone"></div>
 										-->
									</form>
								</div>
							</div>
							
							
							<script>
				 // Get the modal
		        var modal = document.getElementById('myModalupd');
		 
		        // Get the button that opens the modal
		        var btn = document.getElementById("update");
		 
		        // Get the <span> element that closes the modal
		        var span = document.getElementsByClassName("close")[0];                                          
		 
		        // When the user clicks on the button, open the modal 
		        btn.onclick = function() {
		            modal.style.display = "block";
		        }
		 
		        // When the user clicks on <span> (x), close the modal
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		 
		        // When the user clicks anywhere outside of the modal, close it
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
						<span id="rvContent"> <c:out value="${ review.rvContent }" />
						</span>

						<c:if test="${review.rvRenameFilename != null}">

							<div id="reviewImgs">


								<c:set var="imgs"
									value="${fn:split(review.rvRenameFilename,',')}" />
								<c:forEach var="fileName" items="${imgs}" varStatus="g">

									<img id="eachImg"
										src="${path}/resources/upload/review/${fileName}" />

								</c:forEach>

								<%-- <img alt="" src="${path}/resources/upload/review/list1.JPG"> --%>


							</div>
						</c:if>


					</div>
				</c:forEach>
			</c:if>
		</div>

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

</script>

<%@ include file="../../views/common/footer.jsp"%>
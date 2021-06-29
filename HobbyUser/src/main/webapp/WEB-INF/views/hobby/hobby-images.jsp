<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>

<style>
section {
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 1.5em;
	margin: 0;
	font-weight: 300;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	color: #34486b;
}

a {
	text-decoration: none;
	color: #222;
}

.title {
	width: 800px;
	padding: 25px;
	box-sizing: border-box;
}

.title span {
	font-weight: bold;
	display: block;
	margin-top: 20px;
}

.title #hbUrl {
	width: 100%;
	padding: 15px;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding-left: 40px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.title #hbUrl:hover {
	border: 1px solid dodgerblue;
	box-shadow: 0 0 5px #34486b;
}

.title #hbUrl::placeholder {
	opacity: 1;
	transition: 0.3s;
}

.title #hbUrl:focus::placeholder {
	opacity: 0;
	visibility: hidden;
}

.title p {
	overflow: hidden;
}

.title p label {
	float: left;
	cursor: pointer;
}

.title p a {
	float: right;
}

.title p a:hover {
	text-decoration: underline;
}

.title input[type=button] {
	background-color: #34486b;
	color: #fff;
	width: 300px;
	padding: 10px;
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 24px;
	transition: 0.3s;
	margin: 10px;
}

.btn {
	text-align: center;
	margin-top: 30px;
}

.title input[type=button]:hover {
	background-color: #111934;
}

.warn {
	margin: 100px;
	color: #242f83;
}

/* image */
.file-upload label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}
/* 파일 필드 숨기기 */
.file-upload input[type="file"] {  
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.file-upload input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.file-upload label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.file-upload .upload-name {
    display: inline-block;
    padding: .5em .75em;  /* label의 패딩값과 일치 */
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    margin-top:20px; 
    margin-bottom: 20px;
}
/* imaged preview */
.file-upload .upload-display {  /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
}

@media(min-width: 768px) { 
    .file-upload .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.file-upload .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.file-upload .upload-display img {  /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

</style>

<section>
	<div class="title">
		<span>취미 URL</span> 
		<input type="text" id="hbUrl" name="hb_url"
			placeholder="URL"> 
		<span>대표 이미지</span>

		<div class="file-upload preview-image">
			<input type="text" class="upload-name" value="파일선택"
				disabled="disabled"> <label for="input-file">업로드</label> <input
				type="file" id="input-file" class="upload-hidden">
		</div>
 
		<div class="btn">
			
			<input type="button" onclick="location.replace('${path}/hobby/title')" value="이전으로"/>
			<%-- <input type="button" onclick="location.replace('${path}/hobby/date-option')" value="다음으로"/> --%>
			<input type="submit" value="등록하기"/>

		</div>
	</div>
	<div class="warn">
		<p>
			- 최소: 가로 600px X 세로 600px<br> - 권장 : 가로 1000px X 세로 1000px (고해상도
			지원)<br> - 1:1 비율의 (정사각형) 이미지를 권장합니다.<br> - 초상권, 저작권에 문제가
			없어야 합니다.<br> - 상업적으로 사용 가능해야 합니다.<br> - 최소 1장 ~ 최대 5장까지
			가능합니다.<br> - 용량 10MB 이하<br> - 포맷 jpg, png
		</p>
	</div>
</section>

<script>
$(document).ready(function(){

    //$('#ex_filename').change(function() {
    //	var filename = $(this).val();
    //	$('.upload-name').val(filename);
    //});

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
</script>

<%@ include file="../../views/common/footer.jsp"%>
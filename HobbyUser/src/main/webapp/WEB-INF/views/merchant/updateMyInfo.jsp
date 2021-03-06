<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${path}/css/member_css/login.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}


.updateMemInfo {
	padding: 0% 35% 5% 35%;
}

.infoTitle{
	text-align: center;
	font-size: 25px;
	font-weight: bold;
	color: black;
	margin: 20px 0px 20px 0px;
}
.mInfoLabel{
	display: inline-block;
	text-align: right;
	font-size: 18px;
	font-weight: 600;
	padding-bottom: 8px;
}

.mInfoInput{
	font-size: 16px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 15px;
    border: 1px solid rgb(239, 239, 239);
    background-color: white;
    height: 48px;
    flex: 1 1 auto;
    width: 100%;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 16px;
    border-radius: 3px;
}

.mInfoInput:active {
   background-color: rgb(230, 243, 250);
}

#mInfoSubmit{
	background-color: rgb(32, 51, 84);
	font-size: 24px;
	font-weight: bold;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin: 0px;
    border: 1px solid rgb(239, 239, 239);
    height: 48px;
    flex: 1 1 auto;
    width: 100%;
    color: white;
    box-sizing: border-box;
    margin-top: 10px;
    padding: 0px 16px;
    border-radius: 3px;
    cursor: pointer;
}

.enrollArea{
	resize: none;
	height: 100px;
	
}

.label_bank{
	font-size: 16px;
    font-weight: normal;
    line-height: 20px;
    letter-spacing: -0.15px;
    margin-bottom: 15px;
    border: 1px solid rgb(239, 239, 239);
    background-color: white;
    height: 48px;
    color: rgb(26, 26, 26);
    box-sizing: border-box;
    padding: 0px 16px;
    border-radius: 3px;
    width: 282px;
}

/* image */


.profile-wrapper{
	height: 150px;
	width: 150px;
	position: relative;
	border: 2px solid rgb(32, 51, 84);
	border-radius: 50%;
	background: url('${ path }/profile/${ loginMerchant.merImgRename }');
	background-size: 100% 100% ;
	margin: 50px auto;
	overflow: hideen;
}

.upload-thumb{
	height: 150px;
	width: 150px;
	position: relative;
	border: 2px solid rgb(32, 51, 84);
	border-radius: 50%;
	margin: 47px -4px;
	overflow: hidden;
}
.upload_btn {
	height: 150px;
	width: 150px;
	position: absolute;
	border-radius: 50%;
	cursor: pointer;
	background-repeat: no-repeat;
	background-size: 100% 100% ;
	margin: -1px -2px;
	overflow: hideen;
}



/* ?????? ?????? ????????? */
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



/* imaged preview */
.file-upload .upload-display {  /* ???????????? ????????? ?????? */
    margin-bottom: 5px;
}

@media(min-width: 768px) { 
    .file-upload .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.file-upload .upload-thumb-wrap {  /* ????????? ???????????? ????????? ?????? */
    display: inline-block;
	border-radius: 50%;
    width: 200px;
    padding: 2px;
    margin-top:-50px;
    vertical-align: middle;
    
}


</style>

<div class="updateMemInfo">

<form id="memberFrm" action="${ path }/merchant/updateMyInfo" method="POST" enctype="multipart/form-data">

<div class="file-upload preview-image profile-wrapper">
   <input type="hidden" class="upload-name" value="" disabled="disabled"> 
   <label for="input-file" class="upload_btn" ></label> 
   <input type="file" id="input-file" name="input-file" class="upload-hidden">
</div>

<div class="infoTitle">${ loginMerchant.merName } ???, ???????????????!</div><br>
<div class="m_infoG">
<label class="mInfoLabel">?????????</label><br>
		<input type="text" name="merId" id="merId" class="mInfoInput"
			value="${ loginMerchant.merId }" readonly required />
</div>

<div class="m_infoG">
<label class="mInfoLabel">??????</label><br>
<input type="text" name="merName" id="merName" class="mInfoInput"
			value="${ loginMerchant.merName }" readonly required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">?????????</label><br>
<input type="text" name="merNick" id="merNick" class="mInfoInput"
			value="${ loginMerchant.merNick }" required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">????????? ??????</label><br>
<input type="text" name="merPhone" id="merPhone" 
			value="${ loginMerchant.merPhone }" class="mInfoInput" required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">?????????</label><br>
<input type="text" name="merEmail" id="merEmail" 
			value="${ loginMerchant.merEmail }"  class="mInfoInput" required/>
</div>

<div class="m_infoG">
<label class="mInfoLabel">????????????</label><br>

<input class="label_bank" type="text" name="bank" id="bank" placeholder="${ loginMerchant.bank }??????"  required="required" readonly>
<input class="label_bank" type="text" name="bankNumber" id="bankNumber" placeholder="${ loginMerchant.bankNumber }"  required="required" readonly>
</div>

<div class="m_infoG">
<label class="mInfoLabel">?????????</label><br>
<textarea name="greeting" id="greeting" 
			  class="enrollArea mInfoInput" >${ loginMerchant.greeting }</textarea>
</div>

<p>
<input type="submit" id="mInfoSubmit" value="?????? ??????" />
</p>


</form>
</div>

<script>
/* ????????? ????????? ?????? ???????????? */
$(document).ready(function(){

    var fileTarget = $('.file-upload .upload-hidden');

    fileTarget.on('change', function(){  // ?????? ????????????
         if(window.FileReader){  // modern browser
              var filename = $(this)[0].files[0].name;
         } 
         else {  // old IE
              var filename = $(this).val().split('/').pop().split('\\').pop();  // ???????????? ??????
         }

         // ????????? ????????? ??????
         $(this).siblings('.upload-name').val(filename);
    });
}); 

var imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();

    if(window.FileReader){
         //image ?????????
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

<div id="footer">
	<%@ include file="../../views/common/footer.jsp"%>
</div>
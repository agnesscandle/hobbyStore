<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

h1{
   background-color: #0277bd;
   padding: 5px;
   text-align: center;
   
}

#hobbyTitle{
   width:100%;
   border: none;
   text-align:center;
   font-size: 30px;
   font-weight: bolder;
   
}
#qnaTitle{
   font-size: 20px;
   border: none;
   
}
#qnaContent{
   width:100%;
   font-size: 15px;
   border: none;
   border-top: 2px solid;
   padding: 5px;
}
#submitQna{
    padding : 5px 15px;
    cursor : pointer;
    border : none;
    text-align : center;
    text-decoration: none;
    border-radius: 10px;
}
#cancelQna{
    padding : 5px 15px;
    cursor : pointer;
    border : none;
    text-align : center;
    text-decoration: none;
    border-radius: 10px;
}
#memId{
text-align: right;
border: none;
font-size: 15px;
}
.checks {
    padding: 15px 10px;
    text-align: center;
}
.checks input[type=radio]{
    display: none;
}
.checks input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.checks input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.checks input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
</style>
</head>
<body>

<h1>문의하기</h1>
<form id="qnaForm" name="qnaForm" >
<div>
 <input type="hidden" id="memNo" value="${ loginMember.memNo }">
<input type="hidden" id="hbNo" name="hbNo" value="${hobby.hbNo }">
<p id="hobbyTitle" name="hbTitle"><c:out value="${hobby.hbTitle }"> </c:out></p>
<input type="text" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요." />
<p id="memId" name="memId" >${loginMember.memId }</p>
<textarea id="qnaContent" name="qnaContent" cols="67" rows="15" placeholder="문의 할 내용을 입력하세요."style="resize: none;">
</textarea>
<div class="checks">
<input type="radio" id="qnaSecure1" name="qnaSecure" value="Y"><label for="qnaSecure1">비공개</label>

<input type="radio" id="qnaSecure2" name="qnaSecure" value="N" checked="checked"><label for="qnaSecure2">공개</label>
<br>
<br>

<input type="submit" value="문의하기" id="submitQna" />
<input type="button" onclick="javascript:window.close();" value="취소하기" id="cancelQna"/>
</div>
</div>
</form>
<script>
$(function(){ 
    $('#submitQna').on("click",function () {

   var qnaData = $("#qnaForm").serialize();
   $.ajax({
      type : "POST",
      url : "${ path }/hobby/question",
      data: qnaData,
      datatype: 'json',
      success : function(data){ 
         alert("글이 정상적으로 등록되었습니다.");
         window.close()}
   });
});
});
</script>

</body>
</html>
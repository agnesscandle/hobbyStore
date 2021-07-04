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

</head>
<body>

<p>문의하기</p>
<form id="qnaForm" name="qnaForm" >
<div>
<!-- <input type="hidden" id="memNo" value="${ member.memNo }"> -->
<input type="hidden" id="hbNo" name="hbNo" value="${hobby.hbNo }">
<p><input type="text" id="hobbyTitle" name="hbTitle" value="${hobby.hbTitle }"></p>
<input type="text" id="qnaTitle" name="qnaTitle" placeholder="제목을 입력하세요."/>
<textarea id="qnaContent" name="qnaContent" cols="67" rows="15" placeholder="문의 할 내용을 입력하세요."style="resize: none;">
</textarea>
<div>
<input type="radio" id="qnaSecure" name="qnaSecure" value="Y">비공개
<input type="radio" id="qnaSecure" name="qnaSecure" value="N">공개

</div>
<input type="submit" value="문의하기" id="submitQna" />
<input type="button" onclick="javascript:window.close();" value="취소하기"/>
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
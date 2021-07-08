<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../../views/common/header.jsp"%>
<style>
.title{
   background-color: #494949;
   padding: 30px;
   color: white;
}
#qnaTitle{
   width: 100%;
   height: 100px;
   font-size: 30px;
   border: none;
   padding: 5px;
}
#qnaContent{
width: 100%;
border-top: 2px solid;
border-bottom: none;
font-size: 22px;
}
.buttons{
   text-align: center;
}
.checks {
    padding: 15px 10px;
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
#update{
    padding : 5px 15px;
    cursor : pointer;
    border : none;
    text-align : center;
    text-decoration: none;
    border-radius: 10px;
}
#delete{
    margin-left : 10%;
    padding : 5px 15px;
    cursor : pointer;
    border : none;
    text-align : center;
    text-decoration: none;
    border-radius: 10px;
   }
</style>
</head>
<body>

<h1 class="title">문의하기</h1>
<form action="${ path }/hobby/qnaUpdate" method="POST" enctype="multipart/form-data">
<div>
<!-- <input type="hidden" id="memNo" value="${ member.memNo }"> -->
<input type="hidden" id="hbNo" name="hbNo" value="${qna.hbNo }">
<input type="hidden" id="qnaNo" name="qnaNo" value="${qna.qnaNo }">
<input type="text" id="qnaTitle" name="qnaTitle" value="${ qna.qnaTitle }"/><br>
<textarea id="qnaContent" name="qnaContent" cols="67" rows="15" style="resize: none;">
   <c:out value="${qna.qnaContent }"></c:out>
</textarea>

<div class="buttons">
<div class="checks">
<input type="radio" id="qnaSecure1" name="qnaSecure" value="Y" ><label for="qnaSecure1">비공개</label>

<input type="radio" id="qnaSecure2" name="qnaSecure" value="N" checked="checked"><label for="qnaSecure2">공개</label>
</div>
<hr>
<br>
<br>
<input type="submit" id="update" value="수정하기"  />
<input type="button" id="delete" onclick="location.replace('${path}/hobby/qnaDelete?qnaNo=${qna.qnaNo}')" value="삭제" id="qnaDelete"/>
</div>
</div>
</form>
<%@ include file="../../views/common/footer.jsp"%>
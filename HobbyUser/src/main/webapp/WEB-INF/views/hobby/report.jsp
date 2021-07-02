<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/css/hobby/report.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="widh=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${path}/css/style.css">
        <link rel="shortcut icon" type="imae/x-icon" href="${path}/images/logo.png"/>

        <script src="${ path }/js/jquery-3.6.0.min.js"></script>

        <title> 신고하기  </title>
    </head>
<body>
               <div class="container">
                <form action="${path}/hobby/report" method="POST">
                    <table id="tblReport">
                        <tr>
                            <th class="tblHeader">취미명</th>
                            <td>
                               <input class="col1" id="hbTitle" type="text" name="hbTitle" value="${param.hbTitle}" readonly/>
                               <input type="hidden" id="hbNo" name="hbNo" value="${param.hbNo}"/>                               
                            </td>
                        </tr>
                        <tr>
                            <th>작성자 아이디</th>
                            <td><input  class="col1" id="rpWriterId" type="text" name="rpWriterId" value="${loginMember.memId}" readonly/></td>
                        </tr>
                        <tr>
                            <th>신고 제목</th>
                            <td><input class="col1" id="rpTitle" type="text" placeholder="신고합니다."/></td>
                        </tr>
                        <tr>
                            <th >신고 내용</th>
                            <td>
                                <textarea class="col1" cols="70" rows="15" id="rpContent" name="rpContent" placeholder="신고하고 싶은 내용을 입력하세요." required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th id="btnContainer" colspan="2">
                                <input class="btn" id="btnReport" type="submit" value="신고하기">
                                <input class="btn" id="btnCancle" type="reset" value="취소하기">
                            </th>
                        </tr>
               </table>
             </form>
            </div>
</body>
<script>
$(document).ready(()=>{
   // 취소하기 버튼 : 창 닫기
   $("#btnCancle").on("click", (e)=>{
         window.close();
   });
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/css/hobby/merInfo.css">
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

        <title> 상인 정보보기  </title>
    </head>
<body>
        <div class="container">
            <h1> 상인 정보 </h1>
            <hr><br>
            <div class="tblContainer">
                <table>
                    <tr>
                        <td rowspan="2"><img id="merProfile" src="${ path }/images/필카맨프로필.png"></td>
                        <th rowspan="2" colspan="2" id="merNick">
                        	<c:out value="${merchant.merNick}"/>
                        </th>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td colspan="3">
                            <c:out value="${merchant.greeting}"/>
                        </td>
                    </tr>
                    <tr>
                        <th id="merEmail">Email  </th>
                        <td colspan="2"><c:out value="${merchant.merEmail}"/></td>
                    </tr>
                    <tr>
                        <th id="merLocation">Address  </th>
                        <td colspan="2"><c:out value="${hobby.hbLocation}"/></td>
                    </tr>
                </table>
                <br><sub> * 위 정보는 상인의 동의를 받아 기재된 정보입니다. </sub>
            </div>
            <br>
            <input class="btn" id="btnClose" type="button" value="닫기">
        </div>
</body>
<script>
$(document).ready(()=>{
   // 닫기 버튼
   $("#btnClose").on("click", (e)=>{
         window.close();
   });
});
</script>
</html>
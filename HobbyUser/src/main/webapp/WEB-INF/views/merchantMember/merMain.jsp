<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 잠깐 테스트 -->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widh=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/css/style.css">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<title>취미상점</title>
<style type="text/css">
.abc {

	display: flex;
	flex-direction:column;
}
/* Dropdown Button */
.dropbtn {
  background-color: #3498DB;
  color: navy;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
/*   background-color: #2980B9; */
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: navy;
  background-color:white;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #ddd}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}


.dropbtn {

  background-color: white;
  color: navy;
  padding: 16px;
  font-size: 25px;
  border: none;
  margin-top:50px;
}

.dropdown {

  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

/*  .dropdown:hover .dropbtn {background-color: #3e8e41;}*/
</style>

</head>


	<header>
		<div class="logo" onclick="location.href='${path}'">
			<img class="logoImg" src="${ path }/images/logo.png">
			<h4>취미상점</h4>
		</div>

		<div class="member">
			<table class="container" align="center">
				
				<!-- 로그인 되어있는 경우 -->
				<c:if test="${ loginMerMember != null }">
					<tr class="main info">
						<td colspan="2" class="infoId">${ loginMerMember.merName }님,
							환영합니다</td>
					</tr>
					<tr>
						<td class="btn logout"><button type="button"
								onclick="location.replace('${path}/merlogout')">로그아웃</button></td>
					</tr>
				</c:if>
			</table>
		</div>
	</header>

<!--  
	<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#hobby" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    취미관리
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#hobby1">취미만들기</a></li>
    <li><a class="dropdown-item" href="#hobby2">취미관리</a></li>
  </ul>
</div>
	
		<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#guestmanagement" role="button" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false">
    손님관리
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#attendeance">출석부</a></li>
    <li><a class="dropdown-item" href="#Reservationmanagement">예약관리</a></li>
    <li><a class="dropdown-item" href="#Contactus">문의관리</a></li>
    <li><a class="dropdown-item" href="#Reviewmanagement">후기관리</a></li>
  </ul>
</div>

<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#calculate" role="button" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false">
    정산
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#calculaterequest">정산요청</a></li>
    <li><a class="dropdown-item" href="#calculateConfirm">정산확인</a></li>
  </ul>
</div>

<div class="dropdown">
  <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false">
    지원센터
  </a>

  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" href="#Notice">공지사항</a></li>
    <li><a class="dropdown-item" href="#Manual">운영메뉴얼</a></li>
    <li><a class="dropdown-item" href="#ask">자주 묻는 질문</a></li>
  </ul>
</div>
	

-->	
<nav>
<div class="abc nav-links">
	<div class="dropdown">
	  <!-- <button onclick="myFunction()" class="dropbtn">Dropdown</button> -->
	  <p class="dropbtn">취미관리</p>
	  <div id="myDropdown" class="dropdown-content">
	    <a href="${ path }/hobby/enroll">취미만들기</a>
	    <a href="#">취미관리</a>
	  </div>
	</div>
	
	<div class="dropdown">
	  <!-- <button onclick="myFunction()" class="dropbtn">Dropdown</button> -->
	  <p class="dropbtn"> <a href="${ path }/merchant/guestmanagement">손님관리</a></p>
	  <div id="myDropdown" class="dropdown-content">
	    <a href="#attendeance">출석</a>
	    <a href="Reservationmanagement">예약</a>
	    <a href="Contactus">문의</a>
	    <a href="Reviewmanagement">후기</a>
	  </div>
	</div>
	
	
	<div class="dropdown">
	  <!-- <button onclick="myFunction()" class="dropbtn">Dropdown</button> -->
	  <p class="dropbtn">정산</p>
	  <div id="myDropdown" class="dropdown-content">
	    <a href="#">정산요청</a>
	    <a href="#">정산확인</a>
	  </div>
	</div>
	
	
	<div class="dropdown">
	  <!-- <button onclick="myFunction()" class="dropbtn">Dropdown</button> -->
	  <p class="dropbtn">지원센터</p>
	  <div id="myDropdown" class="dropdown-content">
	    <a href="#">공지사항</a>
	    <a href="#">운영메뉴얼</a>
	    <a href="#">자주 묻는 질문</a>
	  </div>
	</div>

</div>
</nav>	
<SCRIPT>

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

</script>
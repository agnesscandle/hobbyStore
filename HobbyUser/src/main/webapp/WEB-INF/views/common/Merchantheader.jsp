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
<link rel="stylesheet" href="${path}/css/merchantMember_css/Merchantheader.css">
<link rel="shortcut icon" type="imae/x-icon"
	href="${path}/images/logo.png" />

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<title>취미상점</title>

</head>



	<header>
		<div class="logo" onclick="location.href='${path}/merchant/list?adNo=${loginMerchant.merNo}'">
			<img class="logoImg" src="${ path }/images/logo.png">
			<h4>취미상점 상인</h4>
		</div>

		<div class="member">
			<table class="container" align="center">
				
				<!-- 로그인 되어있는 경우 -->
				<c:if test="${ loginMerchant != null }">
					<tr class="main info">
				<td colspan="3" class="infoId">${ loginMerchant.merName }님,환영합니다</td>
					</tr>
					<tr>
						<td class="btn logout"><button type="button"
								onclick="location.replace('${path}/merchant/merlogout')">로그아웃</button></td>
					</tr>
				</c:if>
			</table>
		</div>
	</header>
	
	
<div class="sideBar" style="width:200px; float:left;">

<nav id="nav1">

<div class="topMenu1 menu">
        
            <span>취미관리</span>
            <ul class="dept01 hide">
               
                <div class="hobbyEnroll" onclick="location.href='${ path }/merchant/hobbyEnroll'">취미만들기</div>
                  <!--  <a href="/hobbyEnroll">취미만들기</a> -->
               
                 <div id="hobbylist" class="hobbylist" onclick="location.href='${ path }/merchant/list?adNo=${loginMerchant.merNo}'">
                    취미관리
                </div>
                    
                    
            </ul>
        
</div>
</nav>

<nav id="nav2">
<div class="topMenu2 menu">        
        
            <span>손님관리</span>
            <ul class="dept02 hide">
                 <div class="attendance">출석관리</div>
                  <div class="hobbyEnroll" id="reserveList" >예약관리</div>
                  <div id="qnaList" class="qnaList">문의관리</div>
                 <div class="hobbyEnroll" onclick="location.href='${ path }/merchant/Reviewmanagement'">후기관리</div>
            </ul>        
            
        
 </div>       
</nav>

<nav id="nav3">
<div  class="topMenu3 menu">        
      
            <span>정산</span>
            <ul class="dept03 hide">
                 <div id="hobbyCalculate" class="hobbyCalculate">정산관리</div>
                  <div id="calculatehistory" class="calculatehistory">정산대기</div>
                  <div id="calculatefinish" class="calculatefinish">정산완료</div>
            </ul>        
      
 
</div>
</nav>

<nav id="nav4">
<div class="topMenu4 menu"> 		
 		
            <span>지원센터</span>
            <ul class="dept04 hide">
                 <div class="hobbyEnroll">공지사항</div>
                 <div class="hobbyEnroll" id="merManual">운영메뉴얼</div>
                 <div class="hobbyEnroll" id="merFaq">자주 묻는 질문</div>                  
            </ul>        
        
           
</div>   
  
</nav>
</div>
</body>

<script>




$("#nav1").click(function(){
    $(".dept01").slideToggle();
  });
$("#nav2").click(function(){
    $(".dept02").slideToggle();
  });
$("#nav3").click(function(){
    $(".dept03").slideToggle();
  });
$("#nav4").click(function(){
    $(".dept04").slideToggle();
  });

<!-- 취미만들기 페이지 이동 -->
$(function(){
   $("#hobbyEnroll").click(function(){
      location.href='${ path }/merchant/hobbyEnroll';
   })
})
<!--취미리스트 페이지 이동-->
$(function(){
   $("#hobbylist").click(function(){
      location.href='${ path }/merchant/list?merNo=${loginMerchant.merNo}';
   })
})


<!-- 예약 관리(리스트) 페이지 이동 -->
$(function(){
	$("#reserveList").click(function(){
		location.href="${path}/merchant/resHbList?merNo=${loginMerchant.merNo}";
	});
});
<!-- 운영 메뉴얼 페이지 이동 -->
$(function(){
	$("#merManual").click(function(){
		location.href="${path}/merchant/manual";
	});
});
<!-- 자주 묻는 질문 페이지 이동 -->
$(function(){
	$("#merFaq").click(function(){
		location.href="${path}/merchant/faq";
	});
});

<!--정산리스트 페이지 이동-->
$(function(){
   $("#hobbyCalculate").click(function(){
      location.href='${ path }/merchant/calculatelist?merNo=${loginMerchant.merNo}';
   })
})
<!--출석관리 페이지 이동-->
$(function(){
   $(".attendance").click(function(){
      location.href='${ path }/merchant/attendanceList?merNo=${loginMerchant.merNo}';
   })
})


$(function(){
   $("#calculatehistory").click(function(){
      location.href='${ path }/merchant/calculateWait?merNo=${loginMerchant.merNo}';
   })
})

$(function(){
   $("#calculatefinish").click(function(){
      location.href='${ path }/merchant/calculateFinish?merNo=${loginMerchant.merNo}';
   })
})


$(document).on('mouseover', '.topMenu2 span', function () {
    $('.dept02').slideDown(700);
});
$(document).on('mouseover', 'div', function () {
    if (!$(this).hasClass('topMenu2')) {
        $('.dept02').slideUp(700);
    }
});

<!-- qna 페이지 이동 -->
$(function(){
   $("#qnaList").click(function(){
      location.href='${ path }/merchant/merQnaList?merNo=${loginMerchant.merNo}';
   })
})

</script>
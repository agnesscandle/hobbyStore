<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>

<!-- datepiker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script>
  $( function() {
    $( "#takeDate" ).datepicker({
    	dateFormat: 'yy-mm-dd' //Input Display Format 변경
            
        });                    
        
  } );
  </script> 
<style>

	#search-container{
		position : relative;
		width : 800px;
		top : 30px;
		left : 250px;
		font-size : 18px;
	}
    
    #tbl-board {
    width: 1000px;
    border-top: 1px solid #34486b;
    border-collapse: collapse;
  }
  #tbl-board th, #tbl-board td {
    border-bottom: 1px solid #34486b;
    padding: 10px;
    font-size: 18px;
    text-align : center;
  }

  #c1, #c2, #c4, #c5{ width : 180px;}
  #c3, #c5, #c6, #c7{ width : 140px; }
  
  .tblContainer{
      position : relative;
      left : 250px;
  }
  h1, h2{
      position : relative;
      left : 200px;
      color : #293a57;
  }
  .btnRes, .btnAttend{
      font-size : 15px;
      font-weight: bold;
      padding : 4px 8px;
      border-radius : 8px;
      background-color: #eacc16;;
  }
  .btnRes2{
  	font-size : 15px;
  	font-weight : bold;
  	padding : 4px 8px;
  	border-radius : 8px;
  	color : white;
  	background-color : #293a57;
  }
  .btnRes:hover, .btnRes2:hover{
      border : 2px solid #34486b;
    }

</style>
</head>
<body>
    <div>
    <h1> 예약 현황 </h1>
    <div id="hbInfo">
    	<h2> [ <c:out value="${ hobby.hbTitle }"/> ] </h2> 
    </div>
    <div id="search-container">
	    	<input type="hidden" id="hbNo" name="hbNo" value="${hbNo}"/>
			<input type="text" id="takeDate" name="takeDate" pattern="yyMMdd">
			<input type="submit" id="dateTrans" value="조회하기" >
    </div>
    
	<div id="reserveList-container">
    <br><br>
    <div class="tblContainer">
        <table id="tbl-board">
			<tr>
                <th id="c1">예약일</th>
				<th id="c2">예약 아이디</th>
				<th id="c3">예약자 성명</th>
				<th id="c4">휴대폰 번호</th>
				<th id="c5">예약 인원 수</th>
				<th ic="c6">예약 여부</th>
			</tr>
			
			
			<c:if test="${ list eq [] }">
				<tr>
					<td colspan="6">
						조회된 예약 이력이 없습니다.
					</td>
				</tr>
			</c:if>
			
			<c:if test="${ list != [] }">
				<c:forEach var="reserve" items="${ list }" varStatus="status">
					<c:set var="memNo" value="${reserve.memNo}"/>
					
					<tr>
						<td><fmt:formatDate type="DATE" pattern="yyyy-MM-dd" value="${ reserve.resDate }"/></td>
						<td><c:out value="${ reserve.memId }"/></td>
						<td><c:out value="${ reserve.resName }"/></td>
						<td><c:out value="${ reserve.resPhone }"/></td>
                        <td><c:out value="${ reserve.resCount }"/>명</td>
                        <td>
                            <c:if test="${ reserve.resStatus eq 'Y'}">
                                <button type="button" class="btnRes" onclick="changeRes(this,'${hbNo}', '${reserve.resNo }')"> 예약 완료 </button>
                            </c:if>
                            <c:if test="${ reserve.resStatus eq 'N'}">
                                <button type="button" class="btnRes2"> 예약 취소 </button>
                            </c:if>
                        </td>
					</tr>
				</c:forEach>	  
			</c:if>
		</table>
    </div>

		
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.prvePage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button disabled><c:out value="${ status.current }"/></button>		
				</c:if>
				<c:if test="${ pageInfo.currentPage == status.current }">
					<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ status.current }'">
						<c:out value="${ status.current }"/>
					</button>	
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.nextPage }'">&gt;</button>
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/merchant/reserveList?hbNo=${ hbNo }&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
    </div>
</body>
<script>
$(function(){ 
    $('#dateTrans').on("click",function () {
			var hbNo = $('#hbNo').val();
			var takeDate = $('#takeDate').val();
			   $.ajax({
			      type : "POST",
			      url : "${ path }/merchant/reserveList",
			      data: {
			    	  'hbNo' : hbNo,
			    	  'takeDate' : takeDate
			      },
			      datatype: 'json'
			    }).done(function (fragment) {
			         $("#reserveList-container").replaceWith(fragment);
			    });

	
	});
});

</script>
<script>
// 예약 취소로 변경
function changeRes(changedBtn, hbNo, resNo){
	
		console.log($(changedBtn));
		console.log("hbNo : " + hbNo);
		console.log("resNo : " + resNo);
		
		alert("정말로 예약을 취소하시겠습니까? 예약 취소시 변경이 불가합니다.");
		
		$.ajax({
			type : "get",
			url : "${path}/merchant/changeRes",
			dataType : "json",
			data :{
				hbNo,
				resNo
			},
			success : function(data){
				console.log(data);
				console.log(changedBtn);
				
				if(data.status === 'N'){
					alert("예약이 취소되었습니다.");
					changedBtn.innerText = '예약 취소';
					changedBtn.className='btnRes2';
				}
			},
			error : function(e){
				console.log(e)
			}
		});
}

// 예약 취소 버튼
$(".btnRes2").on("click", (e)=>{
	alert("재예약은 결제를 통해 진행해 주시기 바랍니다.");
});

// 조회하기 버튼
$('#btnSearch').click(function(){
    
    $('#searchForm').submit();
 });
</script>
</html>
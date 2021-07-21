<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ include file="../../views/common/Merchantheader.jsp"%> --%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<!-- datepiker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
    $( "#takeDate" ).datepicker({
    	dateFormat: 'yy-mm-dd' //Input Display Format 변경
            
        });                    
        
  } );
  </script> 
<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${path}/css/hobby/list.css">

<style>
    #attendanceMem {
    width: 1000px;
    border-top: 1px solid #34486b;
    border-collapse: collapse;
  }
  #attendanceMem th, #attendanceMem td {
    border-bottom: 1px solid #34486b;
    padding: 10px;
    font-size: 18px;
    text-align : center;
  }

  #c1, #c2, #c4, #c5{ width : 180px;}
  #c3, #c5, #c6, #c7{ width : 140px; }
  
  #attendaceList{
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

<body>
 <h1> 예약 현황 </h1>
    <div id="hbInfo">
    	<h2> [ <c:out value="${ hobby.hbTitle }"/> ] </h2> 
    </div>
<div class="dateSelect">


<input type="hidden" id="hbNo" value="${ hbNo }" name="hbNo">
<input type="text" id="takeDate" name="takeDate" pattern="yyMMdd">
<input type="submit" id="dateTrans" value="전송" >
<!-- 	onclick="location.replace('${path}/merchant/attendanceMem?hbNo=${ hbNo }&takeDate='+$('#takeDate').val())">
 -->
</div>
<div id="attendaceList" >
        <table id="attendanceMem" >
			<tr>
                <th id="c1">예약일</th>
				<th id="c2">예약 아이디</th>
				<th id="c3">예약자 성명</th>
				<th id="c4">휴대폰 번호</th>
				<th id="c5">예약 인원 수</th>
				<th id="c6">출석 여부</th>
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
                            <c:if test="${ reserve.resAttend eq 'Y'}">
                                <button type="button" class="btnRes" onclick="changeRes(this,'${hbNo}', '${reserve.resNo }')"> 출석확인 </button>
                            </c:if>
                            <c:if test="${ reserve.resAttend eq 'N'}">
                                <button type="button" class="btnRes2"> 미출석 </button>
                            </c:if>
                        </td>
					</tr>
				</c:forEach>	  
			</c:if>
		</table>
    </div>

<script>
$(function(){ 
    $('#dateTrans').on("click",function () {
			var hbNo = $('#hbNo').val();
			var takeDate = $('#takeDate').val();
			   $.ajax({
			      type : "POST",
			      url : "${ path }/merchant/attendanceMem",
			      data: {
			    	  'hbNo' : hbNo,
			    	  'takeDate' : takeDate
			      },
			      datatype: 'json'
			    }).done(function (fragment) {
			         $("#attendaceList").replaceWith(fragment);
			    });

	
	});
});

</script>



<%@ include file="../../views/common/footer.jsp"%>
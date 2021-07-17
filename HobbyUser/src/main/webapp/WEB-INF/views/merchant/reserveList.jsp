<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../views/common/Merchantheader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
    width: 1000px;
    border-top: 1px solid #34486b;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #34486b;
    padding: 10px;
    font-size: 18px;
    text-align : center;
  }
  #c1, #c2, #c4, #c5{ width : 180px;}
  #c3, #c5, #c6{ width : 140px; }
  
  .tblContainer{
      position : relative;
      left : 250px;
  }
  h1{
      position : relative;
      left : 200px;
      color : #293a57;
  }
  .btnRes{
      font-size : 15px;
      font-weight: bold;
      padding : 4px 8px;
      border-radius : 8px;
      background-color: #eacc16;;
  }
  .btnRes:hover{
      border : 2px solid #34486b;
    }

</style>
</head>
<body>
    <div>
    <h1> 예약 현황 </h1>
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
			
			
			<c:if test="${ list == null }">
				<tr>
					<td colspan="6">
						조회된 예약 이력이 없습니다.
					</td>
				</tr>
			</c:if>
			
			<c:if test="${ list != null }">
				<c:forEach var="reserve" items="${ list }">
					<tr>
						<td><fmt:formatDate type="DATE" pattern="20yy-MM-dd" value="${ reserve.takeDate }"/></td>
						<td><c:out value="${ reserve.memId }"/></td>
						<td><c:out value="${ reserve.resName }"/></td>
						<td><c:out value="${ reserve.resPhone }"/></td>
                        <td><c:out value="${ reserve.resCount }"/>명</td>
                        <td>
                            <c:if test="${ reserve.resStatus eq 'Y'}">
                                <button type="button" class="btnRes" id="btnResOK"> 예약 완료 </button>
                            </c:if>
                            <c:if test="${ reserve.resStatus eq 'N'}">
                                <button type="button" class="btnRes"> 예약 취소 </button>
                            </c:if>
                        </td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
    </div>
        취미명 넣기 
		
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
 $("#btnResOK").click(function(){
     alert("예약을 취소하겠습니까?");
 });

</script>


</html>
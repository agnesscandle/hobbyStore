<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
</head>
<body>
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
			
			
			<c:if test="${ list == [] }">
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
                                <button type="button" class="btnRes" > 출석확인 </button>
                            </c:if>
                            <c:if test="${ reserve.resAttend eq 'N'}">
                                <button type="button" class="btnRes2" onclick="changeRes(this,'${hbNo}', '${reserve.resNo }')"> 미출석 </button>
                            </c:if>
                        </td>
					</tr>
				</c:forEach>	  
			</c:if>
		</table>
    </div>
    
    <script>
// 예약 취소로 변경
function changeRes(changedBtn, hbNo, resNo){
	
		console.log($(changedBtn));
		console.log("hbNo : " + hbNo);
		console.log("resNo : " + resNo);
		
		alert("정말로 출석상태로 변경합니다.");
		
		$.ajax({
			type : "get",
			url : "${path}/merchant/changeResAttend",
			dataType : "json",
			data :{
				hbNo,
				resNo
			},
			success : function(data){
				console.log(data);
				console.log(changedBtn);
				
				if(data.history === 'Y'){
					alert("출결상태로 완료되었습니다.");
					changedBtn.innerText = '출석확인';
					changedBtn.className='btnRes';
				
				}
				else{
					
						alert("출결상태 취소되었습니다.");
						changedBtn.innerText = '미출석';
						changedBtn.className='btnRes2';
				}
				
			},
			error : function(e){
				console.log(e)
			}
		});
}

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <%@ include file="../../views/common/Merchantheader.jsp"%> --%>
<%@ include file="../../views/common/Merchantheader.jsp"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${path}/css/hobby/list.css">

<body>
<div class="dateSelect">
<input type="date" class="takeDate" id="takeDate" value="today">
<input type="hidden" id="hbNo" value="${ hbNo }">
</div>

<div class="attendanceMem"></div>

<script type="text/javascript">
	window.onload = function() {
		today = new Date();
		today = today.toISOString().slice(0, 10);
		bir = document.getElementById("takeDate");
		bir.value = today;
	}
	
	$(function(){ 

	   var dateData = $("#dateSelect").serialize();
	   $.ajax({
	      type : "POST",
	      url : "${ path }/merchant/attendanceView",
	      data: dateData,
	      datatype: 'json',
	      success : function(data){ 
	    	  $("#attendanceMem").append(data);
	   });
	});
	});
</script>
</body>
<%@ include file="../../views/common/footer.jsp"%>
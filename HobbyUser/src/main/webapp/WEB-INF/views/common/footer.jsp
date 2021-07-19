<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<footer>
	<div class="leftFooter">
		<img src="${path}/images/logo.png"">
		<h4>취미상점</h4>
		<h5>
			취미상점은 모든 사람이 취미부자가 되는 <br> 그 날까지 함께합니다.
		</h5>
	</div>
	<div class="rightFooter">
		<table align="center">
			<tr>
				<td><a href=""><h5>공지사항</h5></a></td>
				<td rowspan="2"><a href="#"><img
						src="${path}/images/logo2.png""></a></td>
			</tr>
			<tr>
				<td><a a href="${path}/member/support"><h5>자주 묻는 질문</h5></a></td>
			</tr>
		</table>
	</div>
</footer>
</body>
</html>

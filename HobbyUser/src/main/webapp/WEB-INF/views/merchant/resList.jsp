<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<div class="reserveListContainer">

    <select name="hb">
        <optgroup label="취미명">
            <option value="totalHb">전체 취미</option>
            <option value="hbTitle">선택 취미</option>
        </optgroup>
    </select>
    <select name="period">
        <optgroup label="기간">
            <option value="">전체 취미</option>
            <option value="hbTitle">선택 취미</option>
        </optgroup>
    </select>
    <br>

    <table id="tbl-reserveList">
        <tr>
            <th>취미명</th>
            <th>회원 아이디</th>
            <th>날짜</th>
            <th>예약 여부</th>
        </tr>
        
        <tr>
            <td>취미명</td>
            <td>회원 아이디</td>
            <td>날짜</td>
            <td>예약 여부</td>
        </tr>
    </table>
    <div id="pageBar">
        <!-- 맨 처음으로 -->
        <button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
        
        <!-- 이전 페이지로 -->
        <button onclick="location.href='${ path }/board/list?page=${ pageInfo.prvePage }'">&lt;</button>

        <!--  10개 페이지 목록 -->
        <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
            <c:if test="${ pageInfo.currentPage == status.current }">
                <button disabled><c:out value="${ status.current }"/></button>		
            </c:if>
            <c:if test="${ pageInfo.currentPage == status.current }">
                <button onclick="location.href='${ path }/board/list?page=${ status.current }'">
                    <c:out value="${ status.current }"/>
                </button>	
            </c:if>
        </c:forEach>
        
        
        <!-- 다음 페이지로 -->
        <button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>
        
        <!-- 맨 끝으로 -->
        <button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
    </div>
</div>
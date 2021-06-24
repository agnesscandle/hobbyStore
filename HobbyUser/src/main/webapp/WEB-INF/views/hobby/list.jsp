<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<style>
.container {
   display: grid;
   grid-template-rows: 280px 280px;
   grid-template-columns: 280px 280px 280px 280px;
}

@media ( max-width : 1023px) {
   .container {
      display: grid;
      grid-template-rows: 280px 280px 280px 280px;
      grid-template-columns: 280px 280px;
   }
}

@media ( max-width : 767px ) {
   .container {
      display: grid;
      grid-template-rows: 280px 280px 280px 280px 280px;
      grid-template-columns: 280px;
   }
}

body {
   font-family: 'Montserrat', sans-serif;
   background-color: #eee;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
}

a {
   text-decoration: none;
   color: #222;
}
/* 
.container {
   display: grid;
   grid-template-rows: 280px 280px;
   grid-template-columns: 280px 280px 280px 280px;
}
 */
h1, h2, h3, h4, h5, h6 {
   font-weight: normal;
}

/* item */
.item {
   border-radius: 7px;
   overflow: hidden;
   position: relative;
   margin: 5px;
   /*box-shadow: 0 0 20px rgba(0, 0, 0, 0.164);*/
}

.item img {
   transition: 0.5s;
}

.detail {
   background-color: #f8f8f8;
   position: absolute;
   width: 100%;
   bottom: -177px;
   left: 0;
   height: 250px;
   transition: 0.5s;
   padding: 5px 20px;
   box-sizing: border-box;
}

.item:hover .detail {
   bottom: 0;
}

.item:hover img {
   filter: blur(2px)
}
/* title */
.title {
   border-bottom: 1px solid #ddd;
   overflow: hidden;
   margin-bottom: 15px;
}

.title h2 {
   font-size: 16px;
   color: #888;
   line-height: 1.2em;
   float: left;
}

.title h2 em {
   font-style: normal;
   display: block;
   margin-bottom: 5px;
   margin-bottom: 5px;
   color: #000;
   font-size: 20px;
}

.title .price {
   float: right;
   margin-top: 15px;
   font-size: 14px;
   color: #000;
   font-style: bold;
}

.info {
   position: relative;
}
/* Size */
.size {
   margin-bottom: 10px;
}

.size label, .color label {
   display: block;
   margin-bottom: 5px;
}

.size span, .color span {
   transition: 0.3s;
}

.size span {
   font-size: 12px;
   margin-right: 4px;
   width: 15px;
   height: 15px;
   display: inline-block;
   text-align: center;
   line-height: 15px;
   padding: 2px;
   border-radius: 3px;
   cursor: pointer;
}

.size span.active, .size span:hover {
   color: #fff;
   background-color: #000;
}

.color span {
   width: 17px;
   height: 17px;
   display: inline-block;
   margin-right: 6px;
   cursor: pointer;
}

.color span.active {
   border-radius: 50%;
}

.color span:nth-of-type(1) {
   background-color: #808000;
}

.color span:nth-of-type(2) {
   background-color: #ff0000;
}

.color span:nth-of-type(3) {
   background-color: #ffc0cb;
}

.color span:nth-of-type(4) {
   background-color: #00ffff;
}

.color span:nth-of-type(5) {
   background-color: #0000ff;
}

.add-cart {
   border: 1px solid #ddd;
   border-radius: 10px;
   width: 100%;
   padding: 7px;
   background-color: #fff;
   color: #0E0C32;
   cursor: pointer;
   margin-top: 10px;
   outline: none;
}

.add-cart:hover {
   background-color: #0E0C32;
   color: #fff;
}

del {
   color: #d3d3d3;
}

#pageBar {
   text-align: center;
   margin-top: 30px;
}
</style>
<body>
   <div>
      <div class="container">
         <c:if test="${ list != null}">
            <c:forEach var="hobby" items="${ list }">
               <div class="item">
                  <img src="${hobby.hb_thum_url}">
                  <div class="detail">
                     <div class="title">
                        <h2>
                           <em>${ hobby.hb_thum_name }</em> ${hobby.hb_title}
                        </h2>
                        <span class="price"><b>99,000원</b></span>
                     </div>
                     <div class="info">
                        <div class="size">
                           <label>Details</label>
                           <c:out value="${hobby.hb_summary}"></c:out>
                        </div>

                     </div>
                     <button class="add-cart">자세히 보기</button>
                  </div>
               </div>
            </c:forEach>
         </c:if>
      </div>

      <div id="pageBar">
         <!-- 맨 처음으로 -->
         <button onclick="location.href='${path}/hobby/list?page=1'">&lt;&lt;</button>

         <!-- 이전 페이지로 -->
         <button
            onclick="location.href='${path}/hobby/list?page=${ pageInfo.prvePage }'">&lt;</button>

         <!--  10개 페이지 목록 -->

         <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
            step="1" varStatus="status">
            <c:if test="${pageInfo.currentPage == status.current }">
               <button disabled>
                  <c:out value="${status.current}" />
               </button>
            </c:if>
            <c:if test="${pageInfo.currentPage != status.current }">
               <button
                  onclick="location.href='${path}/hobby/list?page=${status.current}'">
                  <c:out value="${status.current}" />
               </button>
            </c:if>
         </c:forEach>
         <!-- 다음 페이지로 -->
         <button
            onclick="location.href='${path}/hobby/list?page=${pageInfo.nextPage}'">&gt;</button>

         <!-- 맨 끝으로 -->
         <button
            onclick="location.href='${path}/hobby/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
      </div>
   </div>
   <script>
      $('.size span, .color span').click(function() {
         $(this).addClass('active')
         $(this).siblings().removeClass('active')
      })
      $('.like').click(function() {
         $(this).toggleClass('active')
      })
   </script>
</body>
</html>
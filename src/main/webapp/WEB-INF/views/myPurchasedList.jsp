<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div id="mySupport">
	<h3>내가 희망을 나눠준 사람들</h3>
	<div id="whoSupport">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
          <path fill="#5000ca" fill-opacity="1"
				d="M0,224L24,197.3C48,171,96,117,144,128C192,139,240,213,288,240C336,267,384,245,432,218.7C480,192,528,160,576,149.3C624,139,672,149,720,176C768,203,816,245,864,250.7C912,256,960,224,1008,197.3C1056,171,1104,149,1152,154.7C1200,160,1248,192,1296,181.3C1344,171,1392,117,1416,90.7L1440,64L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
        </svg>

		<table class="boardt">
        <colgroup>
          <col class="colNum">
          <col class="colTitle">
          <col class="colb">
          <col class="colb">
        </colgroup>
        <thead class="bhead">
          <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${product}">
          <tr class="b_tr">
            <td class="tTitle"><a class="btn btn-primary"> ${product.pName}</a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
	</div>
</div>
<%@ include file="layout/footer.jsp"%>
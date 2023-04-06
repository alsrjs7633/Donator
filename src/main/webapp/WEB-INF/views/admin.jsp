<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div id="wrap">
  <div id="top-banner">
    <svg id="fullwave" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
      <path fill="#5000ca" fill-opacity="1" d="M0,128L24,112C48,96,96,64,144,48C192,32,240,32,288,26.7C336,21,384,11,432,16C480,21,528,43,576,64C624,85,672,107,720,106.7C768,107,816,85,864,69.3C912,53,960,43,1008,42.7C1056,43,1104,53,1152,69.3C1200,85,1248,107,1296,96C1344,85,1392,43,1416,21.3L1440,0L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
    </svg>
    <div id="myPage-info">
      <div id="info-text">
        <H1>고객센터</H1>
        <h5>기부자들 고객센터</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">게시판</a>
      </div>
    </div>
  </div>
</div>
    <div class="boardContainer">
    <h2 class="noTitle">고객센터</h2>
    
    <form class="board_form">
      <c:choose>
      <c:when test="${empty principal}">
      </c:when>
      <c:otherwise>
      <button type=button class="board_btn" onclick="location.href='/boardSaveForm'">글쓰기</button>
      </c:otherwise>
      </c:choose>
      <input type="text" class="search_board" id="search_board">
      <button type="submit" class="board_btn">검색하기</button>
    </form>
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
        <tr class="b_tr">
          <td class="tNum">1</td>
          <td class="tTitle"><a href="/boardDetail">title</a></td>
          <td class="tName">차민건</td>
          <td class="tDate">2022-12-08</td>
        </tr>
        <tr class="b_tr">
          <td class="tNum">2</td>
          <td class="tTitle"><a href="/boardDetail">title</a></td>
          <td class="tName">차민건</td>
          <td class="tDate">2022-12-08</td>
        </tr>
        <tr class="b_tr">
          <td class="tNum">3</td>
          <td class="tTitle"><a href="/boardDetail">title</a></td>
          <td class="tName">차민건</td>
          <td class="tDate">2022-12-08</td>
        </tr>
        <tr class="b_tr">
          <td class="tNum">4</td>
          <td class="tTitle"><a href="/boardDetail">title</a></td>
          <td class="tName">차민건</td>
          <td class="tDate">2022-12-08</td>
        </tr>
      </tbody>
    </table>
    <div class="noti-paging">
      <ul class="noti-paging-li">
        <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
          <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
        </svg></a></li>
        <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
        </svg></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
        </svg></a></li>
        <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
          <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
          <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
        </svg></a></li>
      </ul>
    </div>

  </div>
<%@ include file="layout/footer.jsp"%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div id="wrap">
  <div id="top-banner">
    <svg id="fullwave" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
      <path fill="#5000ca" fill-opacity="1" d="M0,128L24,112C48,96,96,64,144,48C192,32,240,32,288,26.7C336,21,384,11,432,16C480,21,528,43,576,64C624,85,672,107,720,106.7C768,107,816,85,864,69.3C912,53,960,43,1008,42.7C1056,43,1104,53,1152,69.3C1200,85,1248,107,1296,96C1344,85,1392,43,1416,21.3L1440,0L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
    </svg>
    <div id="myPage-info">
      <div id="info-text">
        <H1>게시판</H1>
        <h5>기부자들 게시판</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">게시판</a>
      </div>
    </div>
  </div>
</div>

 <div class="containerB">
    <form class="board-container">
      <div class="form-group">
        <label for="title"></label>
        <input type="hidden" id="id" value="${board.id}"/> 
        <input type="text" class="form-title" placeholder="${board.title}" value="${board.title}" id="title">
      </div>
      
      <div class="form-group">
        <label for="content"></label>
        <textarea class="form-content" rows="5" id="content">${board.content}</textarea>
      </div>
    </form>
    <button id="btn-update" class="blue-button">수정완료</button>
  </div>


<%@ include file="../layout/footer.jsp"%>

<!-- //업데이트할때 세이브함수를 쓴다. -->
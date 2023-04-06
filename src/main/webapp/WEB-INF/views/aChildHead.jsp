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
        <H1>로그인</H1>
        <h5>기부자들 로그인</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">로그인</a>
      </div>
    </div>
  </div>
</div>
  <div class="explain">
    <h1>매달 소년,소녀가장을 위한 약속</h1>
    <br>
    <br>
    <p><b>매달 일정 금액을 꾸준히 후원해 주시면
      <br>
      소년,소녀가장에게 큰 도움을 줄 수 있습니다.
      <br>
      정기후원은 안정적인 후원금 확보로 행복한 삶을
      <br>
      위한 장기적인 지원을 가능하게 해줍니다.</b></p>
  </div>
  <div class="advertisement">
  <ul>
    <li>
      <div class="first_box">
      <div class="a">
        <img src="/images/소년소녀가장1.png" height="180.77px" width="325.28px">
      </div>
      <div class="b">
        <strong class="ad_title">식비 후원하기</strong>
      </div>
      <div class="c"> 
        <p>아이들이 튼튼하게 자랄 수 있습니다.</p>
      </div>
      <div class="d">
        <button type="button" color="yellow" onclick="location.href='/payment' ">후원하기</button>
      </div>
      </div>
    </li>

    <li>
      <div class="second_box">
      <div class="a">
        <img src="/images/소년소녀가장2.png" height="180.77px" width="325.28px">
      </div>
      <div class="b">
        <strong class="ad_title">난방비 후원하기</strong>
      </div>
      <div class="c"> 
        <p>추운겨울을 따뜻하게 보낼 수 있습니다.</p>
      </div>
      <div class="d">
        <button type="button" color="yellow" onclick="location.href='/payment' ">후원하기</button>
      </div>
      </div>
    </li>

    <li>
      <div class="third_box">
      <div class="a">
        <img src="/images/소년소녀가장3.png" height="180.77px" width="325.28px">
      </div>
      <div class="b">
        <strong class="ad_title">병원비 지원하기</strong>
      </div>
      <div class="c"> 
        <p>수술과 병원에 갈 수 있도록 도와줍니다.</p>
      </div>
      <div class="d">
        <button type="button" color="yellow" onclick="location.href='/payment' ">후원하기</button>
      </div>
      </div>
    </li>
  </ul>
  </div>
<%@ include file="layout/footer.jsp"%>
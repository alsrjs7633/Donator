<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>


<body>

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
  
  <div class="donation_box">
<!-- 
    <div class="money_box">
      <div class="money_explain">
        <h3>잔액</h3>
      </div>
      <br>
      <div class="money_img">
        <img src="/images/예치금Imoticon.png" alt="">
      </div>
      <div class="money_now">  
        <p class="now">100,000<b>원</b></p>       
      </div>
    </div>   -->

    <div class="first">

      <h3>후원방법</h3>
      <br>
      <form class="choice">
        <input type="radio" class="radio" id="lion1" name="chk_use" value="정기"><label for="lion1">정기</label>
        <input type="radio" class="radio" id="lion2" name="chk_use" value="일시"><label for="lion2">일시</label>
      </form>    
    </div>
    <hr>

    <form class="second">
      <h3>후원분야</h3>
      <br>
    <select class="category" name="category" id="pName">
      <option value="미정">후원분야 선택</option>
      <option value="소년,소녀가장">소년,소녀가장</option>
      <option value="병원비 지원하기">병원비 지원하기</option>
      <option value="보육원 아이들 돕기">보육원 아이들 돕기</option>
    </select>
    
    </form>

    <hr>

    <div class="third">
      <h3>후원금액(원)</h3>
      <br>

      <form class="select" id="pPrice">
        <input type="radio" class="radio" id="select1" name="chk_money" value="10000"><label for="select1">10000</label>
        <input type="radio" class="radio" id="select2" name="chk_money" value="20000"><label for="select2">20000</label>
        <input type="radio" class="radio" id="select3" name="chk_money" value="30000"><label for="select3">30000</label> 
        <input type="radio" class="radio" id="select4" name="chk_money" value="40000"><label for="select4">40000</label>
        <input type="radio" class="radio" id="select5" name="chk_money" value="50000"><label for="select5">50000</label>          
        <input type="text" class="input_text" placeholder="금액을 입력하세요" id="select6" name="chk_money"><label for="select6"></label> 
      </form>

      </div>

    <hr>

    <button class="submit_button" id="payment_button">후원하기</button>

  </div>  
</body>
<%@ include file="layout/footer.jsp"%>
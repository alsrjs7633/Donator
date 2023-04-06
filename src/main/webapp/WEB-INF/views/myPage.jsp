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
        <H1>마이페이지</H1>
        <h5>기부자들 마이페이지</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">마이페이지</a>
      </div>
    </div>
  </div>
  <div id="mainBoard">
    <div id="buttons">
      <div id="receipt">
        <a href="/myPurchasedList">기부금 영수증</a>
      </div>
     <!--  <div id="receipt">
        <a href="/adminPage">관리자페이지</a>
      </div> -->
    </div>
    
    <div id="wellcomeUser">
      <div id="Username">
        <span style="font-size: 50px; color:#bc79f9d9 ;">User</span>님,&nbsp;&nbsp; 항상 감사합니다.&emsp;&emsp;
        <button id="logoutBtn"><a href="/logout">로그아웃</a></button>
      </div>
    </div>
    <form class="user_info">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#5000ca" fill-opacity="1" d="M0,64L24,90.7C48,117,96,171,144,176C192,181,240,139,288,122.7C336,107,384,117,432,128C480,139,528,149,576,176C624,203,672,245,720,229.3C768,213,816,139,864,101.3C912,64,960,64,1008,64C1056,64,1104,64,1152,96C1200,128,1248,192,1296,218.7C1344,245,1392,235,1416,229.3L1440,224L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
      </svg>
        <table class="info_table">
        <tr>
          <th>전화번호</th>
          <td>

            <input id="tel" type="tel" name="Phone" readonly value="010-0000-0000">
          </td>
        </tr>
          <tr>
            <th>E-mail</th>
          <td>
            <input id="email" type="email" name="email" readonly value="user@naver.com">
            <span><button id="mailChk" type="button" class="dnone">인증받기</button></span>
          </td>
          
        </tr>
        <tr>
          <th>
            <input id="bank" type="text" name="bank" style="font-weight: bold; font-size: 15px;" readonly value="카카오뱅크">
          </th>
          <td>
            <input id="accountNum" type="text" name="accountNum" readonly value="3333-33-3333333">
          </td>
          <th></th>
        </tr>
        <tr>
          <th>후원액</th>
          <td><big>90,000</big><b>&nbsp;원</b></td>
          <tr>
            <th>정기후원</th>
          <td>매달 <big>5,000</big>&nbsp;<b>원</b></td>
          </tr>
          
        </tr>
      </table>
      
      <button id="startEdit" class="editBtn" type="button">수정</button>
      <button id="submit" type="submit" class="editBtn dnone">수정</button>
      <script>
        $("#startEdit").click(function(){
          $("#startEdit").addClass("dnone");
          $("#mailChk").removeClass("dnone");
          $("#submit").removeClass("dnone");
          $("#bank").attr("readonly",false);
          $("#tel").attr("readonly",false);
          $("#email").attr("readonly",false);
          $("#accountNum").attr("readonly",false);
          $("input").addClass("bgWhite");
        })
      </script>
    </form>
  </div>
</div>
 <%@ include file="layout/footer.jsp"%>
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
        <H1>회원가입</H1>
        <h5>기부자들 회원가입</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">회원가입</a>
      </div>
    </div>
  </div>
</div>
<div class="container">
    <form class="join_form" method="POST">
      <div class="form_group">
        <label class="form_name">아이디</label>
        <div class="idForm">
        <!-- 서버전송하는 id추가 -->
          <input name="username" type="text" placeholder="Enter UserId" class="input_id" id="username">
          <button type="button" class="double_check">중복확인</button>
        </div>
      </div>
      <div class="form_group">
        <label class="form_name">비밀번호</label>
        <input name="password" type="password" placeholder="Enter UserPassword" class="input_text" id="password">
      </div>
      <div class="form_group">
        <label class="form_name">비밀번호 확인</label>
        <input name="userPwdCheck" type="password" placeholder="Enter UserPassword" class="input_text" id="passwordCh">
      </div>
      <div class="form_group">
        <label class="form_name">성명</label>
        <input name="userName" type="text" placeholder="Enter UserName" class="input_text" id="name">
      </div>
      <div class="form_group">
        <label class="form_name">나이</label>
        <input name="userBirth" type="number" placeholder="Enter UserBirth 000000" class="input_text" id="birth">
      </div>
      <!--휴대폰 번호 인증 설정 안함-->
      <div class="form_group">
        <label class="form_name">휴대폰 번호</label>
        <div class="idForm">
          <input name="userPhone" type="number" placeholder="Enter UserId" class="input_id" id="tel">
          <button type="submit" class="double_check">본인인증</button>
        </div>
      </div>
      <div class="form_group">
        <label class="form_name">이메일</label>
        <input name="userEmail" type="email" placeholder="Enter UserEmail" class="input_text" id="email">
      </div>
      <div class="form_group">
        <label class="form_name">성별</label>
        <div class="agree">
          <label class="inputCheck">
            <input type="radio" name="genderch" id="man" value="MO"> 남
          </label>
          <label class="inputCheck">
            <input type="radio" name="genderch"  id="woman" value="WO"> 여

          </label>
        </div>
      </div>
      <div class="form_group">
            <h3>지역</h3>
            <div class="fil_select" style="height:28px;">
              <select class="filt_select" id="area_select" style="height:28px;">
                <option value="-1" selected>전체</option>
                <option value="AP">서울</option>
                <optino value="BP">경기도</optino>
                <option value="CP">강원도</option>
                <option value="DP">충청남도</option>
                <option value="EP">충청북도</option>
                <option value="FP">경상남도</option>
                <option value="GP">경상북도</option>
                <option value="HP">전라남도</option>
                <option value="IP">전라북도</option>
              </select>
            </div>
          </div>
      <div class="form_group">
        <label class="form_name">정보 수신 동의(선택)</label>
        <div class="agree">
          <label class="inputCheck">
            <input type="checkbox" name="phoneAgree" id="phoneAgree" > 모바일
          </label>
          <label class="inputCheck">
            <input type="checkbox" name="emailAgree" id="emailAgree"> 이메일
          </label>
        </div>
      </div>

      <div class="joinAgree">
        <h2 style="font-size:32px">약관 및 개인정보 수집,이용 동의</h2>
        <hr>
        <div class="agree_container">
          <label class="allAgree">
            <input type="checkbox" name="policyAgree" class="jcheckAll">
            모두 동의합니다
          </label>
        </div>
        <div class="agree_check">
          <label class="agree_checkbox">
            <input type="checkbox" name="policyAgree1" class="jcheckOne" id="jch2">
            [필수]웹사이트 이용약관 동의
          </label>
          <a href="#" class="anchorText">보기</a>
        </div>
        <div class="agree_check">
          <label class="agree_checkbox">
            <input type="checkbox" name="policyAgree2" class="jcheckOne" id="jch1">
            [필수]개인저보 수집,이용 동의
          </label>
          <a href="#" class="anchorText">보기</a>
        </div>
      </div>
      <!-- join_save 추가 -->
    </form>
          <button id="join_save" type="submit" class="join_btn" onclick="javascript:fn_submit()">가입하기</button>

  </div>


<%@ include file="../layout/footer.jsp"%>
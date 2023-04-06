<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div class="cart_container">
    <div class="cart_select_wrap">
      <div class="cart_check_all">
        <input type="checkbox" class="cart_checkbox" id="check_all">
        <label for="check_all">전체선택</label>
      </div>
      <div class="cart_check_del">
        <img class="img_x"
          src="https://www.compassion.or.kr/resources/fo/compassion/assets/images/common/ico_del_blue_20.png">
        <input type="checkbox" class="cart_del_checkbox" id="check_del">
        <label for="check_del">선택삭제</label>
      </div>
    </div>
    <div class="cart_cont">
      <div class="cont_head">
        <p>후원하기</p>
      </div>
      <div class="cont_card">
        <input type="checkbox" id="ch card_check" name="card_check">
        <label for="ch card_check" class="card_label">
          <span class="cont_img">
            <svg xmlns="http://www.w3.org/2000/svg" width="18%" height="126" fill="currentColor"
              class="bi bi-person-fill" viewBox="0 0 16 16">
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
            </svg>
          </span>
          <span class="cont_info">
            <div class="info_info">
              <span class="info_kind">
                1:1후원
              </span>
              <h2>이름</h2>
              <p>지역 나이 성별</p>
            </div>
            <div class="buy_info">
              <p><span style="font-weight:bold;font-size:24px">45000</span>원/월</p>
              <button class="buy_btn">바로 후원하기</button>
            </div>
          </span>
        </label>
      </div>

      <div class="cont_card">
        <input type="checkbox" id="ch card_check2" name="card_check">
        <label for="ch card_check2" class="card_label">
          <span class="cont_img">
            <svg xmlns="http://www.w3.org/2000/svg" width="18%" height="126" fill="currentColor"
              class="bi bi-person-fill" viewBox="0 0 16 16">
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
            </svg>
          </span>
          <span class="cont_info">
            <div class="info_info">
              <span class="info_kind">
                1:1후원
              </span>
              <h2>이름</h2>
              <p>지역 나이 성별</p>
            </div>
            <div class="buy_info">
              <p><span style="font-weight:bold;font-size:24px">45000</span>원/월</p>
              <button class="buy_btn">바로 후원하기</button>
            </div>
          </span>
        </label>
      </div>
      <div class="cont_card">
        <input type="checkbox" id="ch card_check3"  name="card_check">
        <label for="ch card_check3" class="card_label">
          <span class="cont_img">
            <svg xmlns="http://www.w3.org/2000/svg" width="18%" height="126" fill="currentColor"
              class="bi bi-person-fill" viewBox="0 0 16 16">
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
            </svg>
          </span>
          <span class="cont_info">
            <div class="info_info">
              <span class="info_kind">
                1:1후원
              </span>
              <h2>이름</h2>
              <p>지역 나이 성별</p>
            </div>
            <div class="buy_info">
              <p><span style="font-weight:bold;font-size:24px">45000</span>원/월</p>
              <button class="buy_btn">바로 후원하기</button>
            </div>
          </span>
        </label>
      </div>
    </div>
    <div class="cart_payment">
      <ul>
        <li><span>월 후원 금액</span><span class="month pay">90000원</span></li>
        <li><span>년 후원 금액</span><span class="year pay">0원</span></li>
        <li><span>총 후원 금액</span><span class="tot pay">90000원</span></li>
      </ul>
    </div>
    <div class="select_cart">
      <button class="select_buy">선택 후원하기</button>
      <button class="all_buy">모두 후원하기</button>
    </div>
  </div>
</div>
<%@ include file="layout/footer.jsp"%>
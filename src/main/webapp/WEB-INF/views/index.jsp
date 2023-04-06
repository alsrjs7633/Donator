<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<div class="main_box">

  <ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
    <div class="slide">
      <img src="/images/girl-gb15d6fa93_1920.jpg" style="width:100%" height="700px">
        </div>
    <div class="nav">
      <label for="img-6" class="prev">&#x2039;</label>
      <label for="img-2" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="/images/monk-gba87c6728_1920.jpg" style="width:100%" height="700px">
        </div>
    <div class="nav">
      <label for="img-1" class="prev">&#x2039;</label>
      <label for="img-3" class="next">&#x203a;</label>
    </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="/images/man-g22fd4ee92_1920.jpg" style="width:100%" height="700px">
        </div>
    <div class="nav">
      <label for="img-2" class="prev">&#x2039;</label>
      <label for="img-4" class="next">&#x203a;</label>
    </div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
    </li>
  </ul>
<script>
  var slideIndex =0;
  auto_slide();

  function auto_slide(){
    var radioBtn = document.getElementsByName("radio-btn");
    var slideItem = radioBtn[slideIndex];
    slideItem.checked=true;
    slideIndex++;
    if(slideIndex == 7){
      slideIndex = 0;
    }
    setTimeout(auto_slide, 5000);
  }
</script>

 <!-- ------------------------------------------------------------------------------- -->

 <div class="youtubeBackground">
  <section class="video">
    <iframe width="880" height="450" src="https://www.youtube.com/embed/SGSYiCaUmwg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </section>
 </div>  

  <section class="introduce">
    <div class="confidence_logo"><strong>100%</strong></div>
    <p>기부자들은 후원금 <strong>전부를</strong> 취약계층에게 전액 지급합니다.
      기부 대상자는 관할 동사무소에서 지급받은 증빙자료와 
      담당 매니저가 직접 찾아가 상담을 받은 후 
      지급 관리 대상자가 될 수 있습니다.</p>
  </section>

  <section class="support">
    <p><strong>당신의 소중한 관심이 취약계층에겐 따뜻한 밥 한끼가 됩니다.</strong>&nbsp;&nbsp;&nbsp;
      <button type="submit" id="submit" onclick="location.href='/payment' ">후원하기</button></p>
  </section>
<%@ include file="layout/footer.jsp"%>
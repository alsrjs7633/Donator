<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="css/header.css" />
    <script
      src="https://kit.fontawesome.com/ecb3ecb40d.js"
      crossorigin="anonymous"
    ></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;900&display=swap"
      rel="stylesheet"
    />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/myPage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js" integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q==" crossorigin="anonymous"></script>
    <style>
      .a1{
        display: flex;
        justify-content: space-around;
        width: 100%;
      }
      .second {
    position:relative;
    width:200px;
    height:200px;
    margin-top: 100px;
    margin-bottom: 30px;
        z-index: -0;
}
.second>canvas{
    width:100%;
}
.second > strong {
    position:absolute; 
    top:50%; 
    left:50%; 
    transform:translatex(-50%) translatey(-50%);
    font-size:2rem;
}
.circle{
  width: 200px;
  height: 200px;
}
    </style>
  </head>
 
  <body>
    <div id="nav-wrap">
      <nav class="navi">
        <div class="navContainer">
          <a class="logo-area" href="#page-top"><h1>기부자들</h1></a>
          <button class="openMenu dnone" type="button">Menu</button>
          <div class="nav-menu">
            <ul class="nav-ul">
              <li id="supBtn" class="nav-item">
                <a class="nav-link" href="#" onclick="openSup()">
                  <span class="frame-btn__text">후원</span>
                </a>
              </li>
              <li id="fundBtn" class="nav-item">
                <a class="nav-link" href="#">
                  <span class="frame-btn__text">펀딩</span>
                </a>
              </li>
              <li id="boardBtn" class="nav-item">
                <a class="nav-link" href="#" onclick="openBoard()">
                  <span class="frame-btn__text">게시판</span>
                </a>
              </li>
              <li id="infoBtn" class="nav-item">
                <a class="nav-link frame-btn" href="#" onclick="openInfo()">
                  <span class="frame-btn__text">소개</span>
                </a>
              </li>
            </ul>
          </div>
          <button class="fast-sup">
              <span class="">
                <span class="sup-color">빠른 후원</span>
              </span>
            </button>
          <div class="user-icon">
            <ul class="user-ul">
              <!--로그인-->
              <li>
                <a href="#"><i class="fa-solid fa-right-to-bracket"></i></a>
              </li>
              <!--마이페이지-->
              <li class="dnone">
                <a href="#"><i class="fa-solid fa-user"></i></a>
              </li>
            </ul>
          </div>
          <div class="mobile-open">
            <i class="fa-solid fa-caret-down"></i>
          </div>
          <script>
            $(document).ready(function(){
              
              $(".mobile-open").click(function(){
                  if($("#mobile-menu").hasClass("dnone")){
                    $("#mobile-menu").removeClass("dnone");
                  }else{
                    $("#mobile-menu").addClass("dnone");
                  }
                
              });
              $("#nav-ul > li").mouseenter(function(){
                for(let i=0;i<$("nav-ul > li").length;i++){
                  $(".dnone-menu")
                }
              })
            });
          </script>
        </div>
      </nav>
      <div class="hov-menu">
        <div id="sup-menu" class="dnone-menu dnone">
          <ul>
            <li>
              <a href="#">소년/소녀가장</a>
            </li>
            <li>
              <a href="#">한부모 가정</a>
            </li>
            <li>
              <a href="#">독거노인 가정</a>
            </li>
            <li>
              <a href="">1:n 같이 양육</a>
            </li>
          </ul>
        </div>
        <div id="board-menu" class="dnone-menu dnone">
          <ul>
            <li>
              <a href="#">공지사항</a>
            </li>
            <li>
              <a href="#">게시글 보기</a>
            </li>
            <li>
              <a href="#">후기</a>
            </li>
          </ul>
        </div>
        <div id="info-menu" class="dnone-menu dnone">
          <ul>
            <li>
              <a href="#">소개글</a>
            </li>
            <li>
              <a href="#">찾아오시는 길</a>
            </li>
            <li>
              <a href="#">FAQ</a>
            </li>
          </ul>
        </div>
        <div id="mobile-menu" class="dnone-menu dnone">
          <ul>
            <li>
              <a href="">후원</a>
            </li>
            <li>
              <a href="">펀딩</a>
            </li>
            <li>
              <a href="">게시판</a>
            </li>
            <li>
              <a href="">소개</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <script src="js/header.js"></script>
<div id="wrap">
  <div id="top-banner">
    <svg id="fullwave" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
      <path fill="#5000ca" fill-opacity="1" d="M0,128L24,112C48,96,96,64,144,48C192,32,240,32,288,26.7C336,21,384,11,432,16C480,21,528,43,576,64C624,85,672,107,720,106.7C768,107,816,85,864,69.3C912,53,960,43,1008,42.7C1056,43,1104,53,1152,69.3C1200,85,1248,107,1296,96C1344,85,1392,43,1416,21.3L1440,0L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
    </svg>
    <div id="myPage-info">
      <div id="info-text">
        <H1>소개</H1>
        <h5>Who we?</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">소개</a>
      </div>
    </div>
  </div>
  <div id="mainBoard">
    
    <div id="wellcomeUser">
      <div id="Username" style="font-size: 30px;">
       우리는 <span style="font-size: 50px; color:#bc79f9d9 ;">기부자들</span>입니다.
      </div>
    </div>
    <div class="user_info" style="display: flex; flex-direction: column;">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
        <path fill="#5000ca" fill-opacity="1" d="M0,64L24,90.7C48,117,96,171,144,176C192,181,240,139,288,122.7C336,107,384,117,432,128C480,139,528,149,576,176C624,203,672,245,720,229.3C768,213,816,139,864,101.3C912,64,960,64,1008,64C1056,64,1104,64,1152,96C1200,128,1248,192,1296,218.7C1344,245,1392,235,1416,229.3L1440,224L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
      </svg>
      <div class="a1 active-on-visible" data-active-on-visible-callback-func-name="Circle__run">
        <div class="second circle" circleProgress='76.2'>
            <strong class="circle-percent"></strong>
        </div>
        <div class="second circle" circleProgress='100'>
            <strong class="circle-percent"></strong>
        </div>
                                                                              <script>
                                                                                /* 발견되면 활성화시키는 라이브러리 시작 */
                                                                      function ActiveOnVisible__init() {
                                                                          $(window).resize(ActiveOnVisible__initOffset);
                                                                          ActiveOnVisible__initOffset();

                                                                          $(window).scroll(ActiveOnVisible__checkAndActive);
                                                                          ActiveOnVisible__checkAndActive();
                                                                      }

                                                                      function ActiveOnVisible__initOffset() {
                                                                          $('.active-on-visible').each(function(index, node) {
                                                                              var $node = $(node);

                                                                              var offsetTop = $node.offset().top;
                                                                              $node.attr('data-active-on-visible-offsetTop', offsetTop);

                                                                              if ( !$node.attr('data-active-on-visible-diff-y') ) {
                                                                                  $node.attr('data-active-on-visible-diff-y', '0');
                                                                              }

                                                                              if ( !$node.attr('data-active-on-visible-delay') ) {
                                                                                  $node.attr('data-active-on-visible-delay', '0');
                                                                              }
                                                                          });

                                                                          ActiveOnVisible__checkAndActive();
                                                                      }

                                                                      function ActiveOnVisible__checkAndActive() { 
                                                                          $('.active-on-visible:not(.actived)').each(function(index, node) {
                                                                              var $node = $(node);

                                                                              var offsetTop = $node.attr('data-active-on-visible-offsetTop') * 1;
                                                                              var diffY = parseInt($node.attr('data-active-on-visible-diff-y'));
                                                                              var delay = parseInt($node.attr('data-active-on-visible-delay'));

                                                                              var callbackFuncName = $node.attr('data-active-on-visible-callback-func-name');

                                                                              if ( $(window).scrollTop() + $(window).height() + diffY > offsetTop ) {
                                                                                  $node.addClass('actived');

                                                                                  setTimeout(function() {
                                                                                      $node.addClass('active');
                                                                                      if ( window[callbackFuncName] ) {
                                                                                          window[callbackFuncName]($node);
                                                                                      }
                                                                                  }, delay);
                                                                              }
                                                                          });
                                                                      }

                                                                      $(function() {
                                                                          ActiveOnVisible__init();
                                                                      })
                                                                      /* 발견되면 활성화시키는 라이브러리 끝 */


                                                                      function Circle__run() {
                                                                          $(".second.circle").each(function(index, node) {
                                                                              var perNum = $(node).attr('circleProgress');
                                                                              
                                                                              $(this).circleProgress({
                                                                                  value: perNum / 100,
                                                                                  size:200,
                                                                                  startAngle: 300,
                                                                                  thickness: 20,
                                                                                  fill: {
                                                                                      gradient: ["#3cbbb1", "#c4cbca","#f8ffe5"],
                                                                                      gradientAngle: Math.PI / 3
                                                                                  },
                                                                                  animation: {
                                                                                      duration: 3000,
                                                                                      easing: "swing"
                                                                                  },
                                                                                  lineCap: "round",
                                                                                  reverse: true
                                                                          
                                                                              }).on('circle-animation-progress', function (event, progress) {
                                                                                  $(this).find('.circle-percent').html(Math.round(perNum * progress) + '<i>%</i>');
                                                                              });
                                                                          });
                                                                      }
                                                                              </script>
    </div>
    <div id="compare" style="text-align: center; display: flex; justify-content: space-around;">
      <div id="unicef_info" class="compare_item"
            style="color: wheat;
                    font-size: 20px;
                    font-weight: bold;">
            유니세프 수입 중<br>기부금 비율
      </div>
      <div id="sups_info" class="compare_itme"
            style="color: wheat;
            font-size: 20px;
            font-weight: bold;">
          기부자들 수입 중<br>기부금 비율
      </div>
    </div>
    <div style="margin: 0 auto;
                margin-top: 60px;">
      기부자들은 후원금의 100%를 온전히 전달하는데에 힘씁니다.
      <br>
    </div>
    </div>
    <div id="mySupport">
      <h3>내가 희망을 나눠준 사람들</h3>
      <div id="whoSupport">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
          <path fill="#5000ca" fill-opacity="1" d="M0,224L24,197.3C48,171,96,117,144,128C192,139,240,213,288,240C336,267,384,245,432,218.7C480,192,528,160,576,149.3C624,139,672,149,720,176C768,203,816,245,864,250.7C912,256,960,224,1008,197.3C1056,171,1104,149,1152,154.7C1200,160,1248,192,1296,181.3C1344,171,1392,117,1416,90.7L1440,64L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
        </svg>
        <div class="nth-sup">
          <div class="sup-img">
            <img src="img/person.jpg" width="300px">
          </div>
        </div>
        <div class="nth-sup">
          <div class="sup-img">
            <img src="img/person.jpg" width="300px">
          </div>
        </div>
        <div class="nth-sup">
          <div class="sup-img">
            <img src="img/person.jpg" width="300px">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
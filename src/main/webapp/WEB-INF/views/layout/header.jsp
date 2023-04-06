<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title> -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/myPage.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/FAQ.css">
  <link rel="stylesheet" href="/css/search.css">
  <link rel="stylesheet" href="/css/join.css">
  <link rel="stylesheet" href="/css/login.css">
  <link rel="stylesheet" href="/css/board.css">
  <link rel="stylesheet" href="/css/boardDetail.css">
  <link rel="stylesheet" href="/css/boardList.css">
  <link rel="stylesheet" href="/css/findLoc.css">
  <link rel="stylesheet" href="/css/cart.css">
  <link rel="stylesheet" href="/css/boardDetail.css">
  <link rel="stylesheet" href="/css/boardList.css">
  <link rel="stylesheet" href="/css/noticeBoard.css">



  <script  src="http://code.jquery.com/jquery-latest.min.js"></script><!-- jquery 최신버전 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/ecb3ecb40d.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/css/funding.css">
  <link rel="stylesheet" href="/css/payment.css">	
  
  <link rel="stylesheet" href="/css/myPage.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;900&display=swap" rel="stylesheet"></head>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
  </sec:authorize>
<body>

  <div id="nav-wrap">
    <nav class="navi">
      <div class="navContainer">
          <a class="logo-area" href="/"><h1>기부자들</h1></a>
          <button class="openMenu dnone" type="button" >
              Menu
          </button>
          <div class="nav-menu" >
              <ul class="nav-ul">
                  <li class="nav-item">
                    <div class="nav-link" href="#" onclick="openSup()">
                      <span class="frame-btn__text">후원</span>
                    </div>
                  </li>
                  <li id="fundBtn" class="nav-item">
                    <div class="nav-link" href="#"onclick="openFund()">
                      <span class="frame-btn__text">펀딩</span>
                    </div>
                  </li>
                  <li id="boardBtn" class="nav-item">
                    <div class="nav-link" href="#"onclick="openBoard()">
                      <span class="frame-btn__text">게시판</span>
                    </div>
                  </li>
                  <li id="infoBtn" class="nav-item">
                    <div class="nav-link frame-btn" href="#"onclick="openInfo()">
                      <span class="frame-btn__text">소개</span>
                    </div>
                  </li>
              </ul>
              <button class="fast-sup">
                  <span class="">
                      <span class="sup-color">빠른 후원</span>
                  </span>
              </button>
              <ul class="user-ul">
                <!--로그인-->
                <c:choose>
                <c:when test="${empty principal}">
                <li>
                  <a href="/auth/loginForm"><i class="fa-solid fa-right-to-bracket"></i></a>
                </li> 
                </c:when>
                <c:otherwise>
                <li>
                  <a href="/logout"><i class="fa-solid fa-right-to-bracket" style="transform: scaleX(-1);"></i></a>
                </li>
                </c:otherwise>
                </c:choose>
                <!--마이페이지-->
                <li class="dnone">
                  <a href="#"><i class="fa-solid fa-user"></i></a>
                </li>
                <li>
                  <a href="/myPage">마이페이지</a>
                </li>
              </ul>
          </div>
      </div>
    </nav>
    <div class="hov-menu">
      <div id="sup-menu" class="dnone-menu dnone">
        <ul>
          <li>
            <a href="/auth/aChildHead">소년/소녀가장</a>
          </li>
          <li>
            <a href="/auth/singleParent">한부모 가정</a>
          </li>
          <li>
            <a href="/auth/seniorCitizen">독거노인 가정</a>
          </li>
        </ul>
      </div>
      <div id="fund-menu" class="dnone-menu dnone">
        <ul>
          <li>
            <a href="/search">1:3 같이 양육</a>
          </li>
          <li>
            <a href="/search">1:5 같이 양육</a>
          </li>
          <li>
            <a href="#"></a>
          </li>
        </ul>
      </div>
      <div id="board-menu" class="dnone-menu dnone">
        <ul>
          <li>
            <a href="/board/boardList">공지사항</a>
          </li>
          <li>
            <a href="/board/boardList">게시글 보기</a>
          </li>
          <li>
            <a href="/board/boardList">후기</a>
          </li>
        </ul>
      </div>
      <div id="info-menu" class="dnone-menu dnone">
        <ul>
          <li>
            <a href="/information">소개글</a>
          </li>
          <li>

            <a href="/auth/findLoc">찾아오시는 길</a>

          </li>
          <li>
            <a href="/auth/faq">FAQ</a>
          </li>
          <li>
            <a href="/user/adminPage">관리자페이지</a>
          </li>
        </ul>
      </div>
    </div>
  </div>

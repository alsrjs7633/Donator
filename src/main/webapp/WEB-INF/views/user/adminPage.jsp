<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/admin.css">
<div id="wrap">
	<div id="top-banner">
		<svg id="fullwave" xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 1440 320">
      <path fill="#5000ca" fill-opacity="1"
				d="M0,128L24,112C48,96,96,64,144,48C192,32,240,32,288,26.7C336,21,384,11,432,16C480,21,528,43,576,64C624,85,672,107,720,106.7C768,107,816,85,864,69.3C912,53,960,43,1008,42.7C1056,43,1104,53,1152,69.3C1200,85,1248,107,1296,96C1344,85,1392,43,1416,21.3L1440,0L1440,0L1416,0C1392,0,1344,0,1296,0C1248,0,1200,0,1152,0C1104,0,1056,0,1008,0C960,0,912,0,864,0C816,0,768,0,720,0C672,0,624,0,576,0C528,0,480,0,432,0C384,0,336,0,288,0C240,0,192,0,144,0C96,0,48,0,24,0L0,0Z"></path>
    </svg>
		<div id="myPage-info">
			<div id="info-text">
				<H1>관리자페이지</H1>
			</div>
			<div id="myPage-link">
				<a href="/">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp; <a href="">관리자페이지</a>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->

<div class="table-wrap">
	<form action="/user/adminPage" method="GET" class="search-wrap">
		<select class="form-select form-select-sm"
			aria-label=".form-select-lg example" name="searchType"
			id="searchType">
			<option value="username">아이디</option>
			<option value="name">닉네임</option>
			<option value="email">이메일</option>
		</select>
		<div class="input-group input-group-sm">
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="searchKeyword"
				id="searchKeyword">
		</div>
		<button type="submit" class="btn btn-secondary">검색</button>
	</form>

	<table class="table border">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">아이디</th>
				<th scope="col">닉네임</th>
				<th scope="col">이메일</th>
				<th scope="col">가입일</th>
				<th scope="col">게시글</th>
				<th scope="col">댓글</th>
				<th scope="col">기부</th>
				<th scope="col">관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users.content}">
				<tr>
					<th id="uid" scope="row">${user.id}</th>
					<td>${user.username}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>${user.createDate}</td>
					<td><button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#myModal"  id="adminBoard" onclick="modalOpen('board', '${user.name}', ${user.id})">${user.boardCount}</button></td>
					<td><button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#myModal" id="adminReply" onclick="modalOpen('reply', '${user.name}', ${user.id})">${user.replyCount}</button></td>
					<td><button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#myModal" id="adminDonators" onclick="modalOpen('email', '${user.name}', ${user.id})">${user.donatorsCount}</button></td>
					<td><button onclick="userDelete()" type="button" class="btn btn-danger">추방</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:set var="startPage" value="${users.number - users.number % 5}" />
	<ul class="pagination justify-content-center pgMargin">
		<li class="page-item <c:if test='${users.number < 5}'>disabled</c:if>">
			<a class="page-link"
			href="/user/adminPage?category=${param.category}&page=${startPage - 5}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"><</a>
		</li>
		<c:forEach var="page" begin="1" end="5">
			<c:if test="${(startPage + page) <= users.totalPages}">
				<li
					class="page-item <c:if test='${users.number eq startPage + page - 1}'>active</c:if>">
					<a class="page-link"
					href="/user/adminPage?category=${param.category}&page=${startPage + page - 1}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">${startPage + page}</a>
				</li>
			</c:if>
		</c:forEach>
		<li
			class="page-item <c:if test='${startPage + 5 > users.totalPages}'>disabled</c:if>">
			<a class="page-link"
			href="/user/adminPage?category=${param.category}&page=${startPage + 5}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}">></a>
		</li>
	</ul>
</div>


<div class="modal fade" id="myModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
    <div class="modal-content">
    
      <div class="modal-header">
        <h4 class="modal-title" id="modalTitle"></h4>
      </div>
      
      <div class="modal-body" id="modalBody">
      
        <table class="table board-table table-hover">
				<thead id="modalTableHead"></thead>
				<tbody id="modalTableBody"></tbody>
		  </table>
        
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="modalClose()">Close</button>
      </div>
    </div>
  </div>
</div>








<%@ include file="../layout/footer.jsp"%>
<script  src="/js/admin.js"></script>
<script src="/js/board.js"></script>
<script src="/js/user.js"></script>


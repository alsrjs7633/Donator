<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">

	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	
	<c:if test="${board.users.id==principal.user.id }">
	<button id="btn-delete" class="btn btn-danger">삭제</button>
	<a href="/board/${board.id}/updateForm" class="btn btn-warning">수정</a> <!-- get방식으로 할 것이기 때문에 a태그를 사용하는것이다. -->
	</c:if>
	<div>
		<br /> <br />
		<div>
			글 번호 : <span id="id"><i>${board.id}</i></span>      <!--  벨루가 아니기에 텍스트로 가져오는 것이다. -->
			작성자 : <span><i>${board.users.username}</i></span>
		</div>
		<h3>${board.title}</h3>
	</div>
	<hr />
	<div>
		<h3>${board.content}</h3>
	</div>
	<hr />
</div>
<br />
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>

<!-- //파라미터로 주고 받을 수 있기에 get으로 하는 것이다.
//json으로 할 필요가 없을 때 ajax를 쓸 필요가 없다. -->
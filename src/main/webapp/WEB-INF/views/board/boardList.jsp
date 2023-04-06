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
        <H1>게시판</H1>
        <h5>기부자들 게시판</h3>
      </div>
      <div id="myPage-link">
        <a href="">Home</a>&nbsp;&nbsp;>&nbsp;&nbsp;
        <a href="">게시판</a>
      </div>
    </div>
  </div>
</div>

      <div class="boardContainer">
      <h2 class="noTitle">게시판</h2>
      <div class="board_form">
      <button type="submit" value="prev" class="viewPost board_btn" onclick="location.href='/board/board'">글쓰기</button>
      <form action="/board/boardList" method="GET" >
      <input type="text" class="search_board" id="search_board" name="searchTitle" style="height:100%">
      <button type="submit" class="board_btn">검색하기</button>
      </form>
    </div>
      <table class="boardt">
        <colgroup>
          <col class="colNum">
          <col class="colTitle">
          <col class="colb">
          <col class="colb">
        </colgroup>
        <thead class="bhead">
          <tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards.content}">
          <tr class="b_tr">
            <td class="tTitle" style="text-align:center"><a href="/board/${board.id}" class="btn btn-primary">${board.id}</a></td>
            <td class="tTitle" ><a href="/board/${board.id}" class="btn btn-primary">${board.title}</a></td>
            <td class="tTitle" style="text-align:center"><a href="/board/${board.id}" class="btn btn-primary">${board.users.name}</a></td>
            <td class="tTitle" style="text-align:center"><a href="/board/${board.id}" class="btn btn-primary">${board.createDate}</a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      
      
	<!-- search{e} -->
<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${boards.first}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number-1}">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${boards.number-1}">Previous</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${boards.first}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number+1}">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${boards.number+1}">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>

	<!-- 페이지 목록 갯수   -->
  
      
      
      

   <%--  <div class="noti-paging">
        <ul class="noti-paging-li">
          <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
            <path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
          </svg></a></li>
          <li><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
          </svg></li>
          <li><a href="?page=${boards.number+1}">1</a></li>
          <li><a href="?page=${boards.number+1}">2</a></li>
          <li><a href="?page=${boards.number+1}">3</a></li>
          <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg></a></li>
          <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z"/>
            <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg></a></li>
        </ul>
      </div>
    </div> --%>
  </div>
<%@ include file="../layout/footer.jsp"%>

<script type="text/javascript">
	//글 작성 버튼 클릭 시 testRegister로 이동
	$("#btn_write").click(function javascript_onclikc() {
		$(location).attr('href', 'pageRegister.do');

	});
	
	//글조회
	//	어떤 게시물을 클릭했는지 게시물의 번호(testId)를 넘겨 줘야 함 따라서 게시물 클릭 이벤트에서 게시물의 번호를 인자 값으로 받습니다.
	//  get 방식으로 데이터를 전송합니다. 따라서 ? 연산자를 사용해 testId를 주소 뒤에 붙여 줍니다
	function fn_view(testId){
    
  	  var form = document.getElementById("boardForm");
  	  var url = "<c:url value='/pageDetail.do'/>";
  	  url = url + "?pageId=" + testId;
    
 	   form.action = url;    
 	   form.submit(); 
	}
	//이전 버튼 이벤트
	//5개의 인자값을 가지고 이동 testList.do
	//무조건 이전페이지 범위의 가장 앞 페이지로 이동
	function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
			
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
			
		var url = "/pageList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&searchType=" + searchType;
		url = url + "&keyword=" + keyword;
		location.href = url;
		}

	  //페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {

		var url = "/pageList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword; 

			location.href = url;	
		}

		//다음 버튼 이벤트
		//다음 페이지 범위의 가장 앞 페이지로 이동
	function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;			
		var url = "/pageList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&searchType=" + searchType;
			url = url + "&keyword=" + keyword;
			location.href = url;
		}
		
		
	/* $는 jQuery를 시작하는 명령어로
	$(DOM요소) 와 같은 명령어로 각 요소에 접근 할 수 있다.
	e.preventDefault(); 는 버튼 고유의 기능을 막는 명령어 */ 
		
		// 검색
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/pageList.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		url = url + "&listSize=" + $('#listSize').val();
		location.href = url;
		console.log(url);

	});	

	/*한페이지당 게시물 */
	function page(testId){
	  var startPage = testId;
	  var listSize = $("#listSize option:selected").val();
		
	  if(listSize == 10){
		  var url="/pageList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 15){
		  var url ="/pageList.do?startPage="+startPage+"&listSize="+listSize
	  }else if(listSize == 20){
	      var url="/pageList.do?startPage="+startPage+"&listSize="+listSize
	 
	  }
	  location.href = url;
	}
</script>
    

  


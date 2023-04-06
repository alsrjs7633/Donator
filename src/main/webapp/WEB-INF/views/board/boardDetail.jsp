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

<div class="top_button_box"> 
    <c:if test="${board.users.id==principal.user.id }">
	<a href="/board/${board.id}/updateForm" class="modify_button">●수정</a> <!-- get방식으로 할 것이기 때문에 a태그를 사용하는것이다. -->
	<button class="delete_button" id="btn-delete" value="${board.id}" >▲삭제</button><button type="submit" value="list" class="list_button" onclick="history.back()"><b>■목록</b></button>
	</c:if>
</div>
 
  <div class="boardDeatil_box">  
    <div class="boardDetail_box">

      <div class="article_header">
        <div class="title_box">
          <h2 class="title">${board.title}</h2>
        </div>

        <div class="writer_top_box">
          <div class="writer_box">
            <div class="user_imoticon"><img src="/images/user_imoticon.png" alt=""></div>
            <p class="writer_id">${board.users.username}</p>
            <button type="submit" value="chatting" class="chatting"><b>1:1채팅</b></button>
            <p class="now_time">작성일:${board.createDate}, 조회수:${board.count}</p>
          </div>
 
        </div> 
      </div>

      <hr>

      <div class="post_box">
        <div class="post">
          <p>${board.content}</p>
        </div> 
      </div>

      <div class="post_advertisement_box">
          <div class="post_advertisement"><img src="/images/advertisement_banner.png" class="ad_banner"></div>
      </div>

  

      <div class="writer_post_box">
        <div class="writer_post">
          <div class="writer_imoticon"><img src="/images/user_imoticon.png" class="writer_second_imoticon"></div>
          <div class="wirter_post_button"><button type="submit" value="writer_post_button">조잰님의 게시글 더보기 ></button></div>
        </div>
      </div>

       <hr>
    
      <div class="posting_box">
      
	      	<input type="hidden" id="boardId" value="${board.id}"/>
	        <div class="posting_title">
	          <h4>댓글</h4>
	        </div>
	        <textarea placeholder="댓글을 남겨보세요." class="textarea" id="rely-content"></textarea>
	        
	        <div class="textarea_imoticon_box">
	            <button class="textarea_first_imoticon"><img src="/images/reply_camera_button_imoticon.png" class="reply_camera_button_imoticon_img"></button>
	            <button class="textarea_second_imoticon"><img src="/images/reply_smiling_button_imoticon.png" class="reply_smiling_button_imoticon_img"></button>
	        </div>
            <input type="button" class="lets_reply_button" id="btn-reply-save" value="등록">
      
      </div>
      
      
      <div class="registed_reply_box">
      
      	<c:forEach var="reply" items="${board.reply}">
      
        <div class="first_reply" id="reply_${reply.id}"> <!-- 검사를 했을때 번호가 나오기때문에 써준것이다. -->
          <div class="first_reply_imoticon"><img src="/images/user_imoticon.png" class="reply_imoticon"></div>
          
          <div class="reply_main">
            <p><b>${board.users.username }</b></p>
            <p id="replyContentModify">${reply.content }</p>       
          </div>

          <div class="reply_decoration">
            <p class="reply_time">${reply.createDate}</p>
            <p class="lets_reply">답글쓰기</p>    
              
              
       
            <input type="hidden" id="replyId" value="${reply.id}"/>  
            <button class="boardDetail_modifyButton" id="btn-reply-update">수정</button>
            <button class="boardDetail_cancle" id="btn-reply-cancle" style="display: none;">취소</button>
            <button onclick="board.replyDelete(${board.id},${reply.id})" class="boardDetail_deleteButton" id="btn-reply-delete">삭제</button>
            
            <div class="r_reply_edit" style="display: none;">
            	<input type="hidden" value="${reply.id}">
            	<input type="text" placeholder="수정" id="reply_edit">
				<button type="button" id="r_reoly" class="btn btn-outline-primary bi bi-pencil-square"> 수정</button>
            </div> <!-- 어떤 게시글인지 어떤 댓글인지 알게하기 위해서 함수 두개를 쓴 것이다. -->
        
              
          </div>
          
 			 
        </div>
		   
        </c:forEach>
       
      </div>
      
    </div>

  </div>  
  <script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>

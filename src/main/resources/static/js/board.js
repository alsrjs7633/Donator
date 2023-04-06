reupdate = document.querySelectorAll(".boardDetail_modifyButton")
recancle = document.querySelectorAll(".boardDetail_cancle")
reedit = document.querySelectorAll("#r_reoly")


reupdate.forEach((target)=>{
			target.addEventListener('click',(e)=>{
				e.preventDefault();
				editzone=(e.target.parentElement.children[6]);
				cancle=(e.target.parentElement.children[4]);
				edit_re=(e.target.parentElement.children[3]);
				
				editzone.style.display="block";
				cancle.style.display="block";
				edit_re.style.display="none";
			})
		});
		
		
recancle.forEach((target)=>{
			target.addEventListener('click',(e)=>{
				e.preventDefault();
				editzone=(e.target.parentElement.children[6]);
				cancle=(e.target.parentElement.children[4]);
				edit_re=(e.target.parentElement.children[3]);
				
				editzone.style.display="none";
				cancle.style.display="none";
				edit_re.style.display="block";
			})
		});
		
reedit.forEach((target)=>{
			target.addEventListener('click',(e)=>{
				e.preventDefault();
				this.editreply(e)
				
				
			})
		});
		
function editreply(e){
	const edit_value = (e.target.parentElement.children[1]).value;
	const id = (e.target.parentElement.children[0]).value;
	
	let data={
		content : edit_value
	}
	$.ajax({
			type:"PUT",
			url:`/api/boardDetail/reply/`+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			window.location.reload();
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	
}

let board={
	init: function(){
		
		$("#btn-save").on("click",()=>{
			//화살표 함수사용 이유:this를 바인딩하기 위해 사용한다.
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			//화살표 함수사용 이유: this를 바인딩하기 위해 사용
			this.deleteById();
		});
		$("#btn-update").on("click",()=>{
			//화살표 함수사용 이유:this를 바인딩하기 위해 사용한다.
			this.update();
		});
		$("#btn-reply-save").on("click",()=>{
			//화살표 함수사용 이유:this를 바인딩하기 위해 사용한다.
			this.replySave();
		});
		
	},
	
	 // 댓글 수정
    replyUpdate: function(){
		//alert('user의 save함수 호출됨');
		let boardId=$("#boardId").val(),
			replyId=$("#replyId").val()
		
		let data={
			content:$("#replyContent").val()
		};
		console.log(boardId,replyId);
		console.log(data);
		$.ajax({
			type:"PUT",
			url:`/api/boardDetail/${boardId}/reply/${replyId}`,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			window.location.reload();
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		
	},
	
	
	
	save: function(){
		//alert('user의 save함수 호출됨');
		let data={
			title:$("#title").val(),
			content:$("#content").val()
		};
		$.ajax({
			type:"POST",
			url:"/api/board",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("글쓰기가 완료되었습니다.");
			location.href="/board/boardList";//boardindex
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
 	deleteById: function(){
		var id=$("#btn-delete").val();  //boardDetail에서 value값을 적어주고 아이디를 여기에 적어준 다음 value값을 던져줘서 된 것이다. .val()는 안에 포함된 값을 던져준다는 의미이고 text는 삭제버튼의 text값을 의미한다.
		console.log('id'+id);
		    $.ajax({
			type:"DELETE",
			url:"/api/board/"+id,
			dataType: "json"
			//응답의 결과가 문자열이 아닌ㄴ json으로 변환
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/board/boardList";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
			//응답이 비정상
		});
		//ajax통신을 이용해서 3개의 데이터를 json
	},
	update: function(){
		//alert('user의 save함수 호출됨');
		let id=$("#id").val();
		
		let data={
			title:$("#title").val(),
			content:$("#content").val()
		};
		console.log(id);
		console.log(data);
		$.ajax({
			type:"PUT",
			url:"/api/board/"+id,
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("수정이 완료되었습니다.");
			location.href="/board/boardList";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		
	},
	replySave: function(){
		let data={
			content:$("#rely-content").val()
			/*boardId:$("#boardId").val()*/ //boardId 는 밑에 넣을 거니까 이곳에선 넣지 않아도 된다.
		};
		
		
		let boardId = $("#boardId").val();  //int로 뜨지 않게 하기 위해 .val()을 썼다.
		/*console.log(data);*/ //ajax를 하기 전 위에 쓴 것이 잘 작용이 되는지 시험하기 위해 쓴것이다.
		/*console.log('dd'+boardId); *///ajax를 하기 전 위에 쓴 것이 잘 작용이 되는지 시험하기 위해 쓴것이다.
		
		$.ajax({
			type:"POST",
			url:`/api/board/${boardId}/reply`, //주소파라미터 값으로 넘길거다 이건 스크립트에서 스트링으로 넘어갈 수 있다.
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			dataType:"json"
		}).done(function(resp){
			alert("댓글작성이 완료되었습니다.");
			location.href="/board/"+boardId;  //`` 이걸 쓰는걸 빽트기라고 한다.
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	
	replyDelete: function(boardId,replyId){
		console.log(boardId, replyId)
		$.ajax({                                          //들고 올게 없기때문에 data가 필요없어서 지웠다.
			type:"DELETE",
			url:`/api/boardDetail/${boardId}/reply/${replyId}`, //주소파라미터 값으로 넘길거다 이건 스크립트에서 스트링으로 넘어갈 수 있다.
			dataType:"json"
		}).done(function(resp){
			alert("댓글삭제가 완료되었습니다.");
			
			location.href="/board/"+boardId;  //삭제가 완료되면 해당게시글로 돌아온다는 뜻이
			/*location.href="/board/"+boardId;*/  //`` 이걸 쓰는걸 빽트기라고 한다.
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
}


board.init();
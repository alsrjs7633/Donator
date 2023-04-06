function modalOpen(type, name, userid) {

	if (type == "board") {
		$("#modalTitle").text(name + "님의 작성 게시물");
		let item =
			`<tr>
				<th class="board-table-no">번호</th>
				<th class="board-table-title">제목</th>
				<th class="board-table-date">작성일</th>
				<th class="board-table-delete">삭제</th>
			</tr>`

		$.ajax({
			url: `/api/board/${userid}`,
			dataType: "json"

		}).done(resp => {
			resp.forEach((board) => {
				item += getBoardModalItem(board);

			});

			$("#modalTableBody").append(item);
		}).fail(error => {
			console.log(error);
		});
	} else if (type == "reply"){
		$("#modalTitle").text(name + "님의 작성 댓글");

		let item =
			`<tr>
				<th class="board-table-no">번호</th>
				<th class="board-table-title">내용</th>
				<th class="board-table-date">작성일</th>
				<th class="board-table-delete">삭제</th>

			</tr>`

		$.ajax({
			url: `/api/reply/${userid}`,
			dataType: "json"
		}).done(resp => {
			resp.forEach((reply) => {
				item += getReplyModalItem(reply);
			});
			$("#modalTableBody").append(item);
		}).fail(error => {
			console.log(error);
		});
	}else{
		$("#modalTitle").text(name + "님의 기부 현황");
		let item =
			`<tr>
				<th class="board-table-no">번호</th>
				<th class="board-table-title">기간</th>
				<th class="board-table-date">분야</th>
				<th class="board-table-delete">금액</th>
				<th class="board-table-date">기부일</th>
			</tr>`

		$.ajax({
			url: `/api/product/${userid}`,
			dataType: "json"

		}).done(resp => {
			resp.forEach((product) => {
				item += getDonatorsModalItem(product);

			});

			$("#modalTableBody").append(item);
		}).fail(error => {
			console.log(error);
		});
	}
}
function userDelete (){
		//alert('user의 delete 함수 호출됨');
		let id=$("#uid").text();
		$.ajax({
			type:"DELETE",
			url:"/delete/"+id,
			
			dataType:"json" //자동으로 변환해주기 때문에 생략 가능
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("삭제되었습니다");
			location.href="/user/adminPage";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
			//응답이 비정상
		});
	}
function getBoardModalItem(board) {
	let item =
		`<tr>
			<td  onclick="location.href='/board/${board.id}/'"id="btn-delete">${board.id}</td>				
			<td onclick="location.href='/board/${board.id}/'" class="board-table-title">${board.title}</td>
			<td onclick="location.href='/board/${board.id}/'">${board.create_date}</td>
			<td><button onclick="deleteBoardById()" type="button" class="btn btn-danger"  >삭제</button></td>
		</tr>`;

	return item;
}
function deleteBoardById (){
		var id=$("#btn-delete").text();  //boardDetail에서 value값을 적어주고 아이디를 여기에 적어준 다음 value값을 던져줘서 된 것이다. .val()는 안에 포함된 값을 던져준다는 의미이고 text는 삭제버튼의 text값을 의미한다.
		console.log('id'+id);
		    $.ajax({
			type:"DELETE",
			url:"/api/board/"+id,
			dataType: "json"
			//응답의 결과가 문자열이 아닌ㄴ json으로 변환
		}).done(function(resp){
			alert("삭제가 완료되었습니다.");
			location.href="/user/adminPage";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
			//응답이 비정상
		});
		//ajax통신을 이용해서 3개의 데이터를 json
	}

function getReplyModalItem(reply) {
	let item =
		`<tr>
			<td id="modalReplyId">${reply.id}</td>				
			<td class="reply-table-title">${reply.content}</td>
			<td>${reply.create_date}</td>
			<td><button onclick="replyDeleteBtn()" type="button" class="btn btn-danger" onclick="board.deleteById()" >삭제</button></td>
		</tr>`;

	return item;
}
function replyDeleteBtn(){
		var id=$("#modalReplyId").text()
		$.ajax({                                          //들고 올게 없기때문에 data가 필요없어서 지웠다.
			type:"DELETE",
			url:`/api/reply/`+id, //주소파라미터 값으로 넘길거다 이건 스크립트에서 스트링으로 넘어갈 수 있다.
			dataType:"json"
		}).done(function(resp){
			alert("댓글삭제가 완료되었습니다.");
			
			location.href="/user/adminPage";  //삭제가 완료되면 해당게시글로 돌아온다는 뜻이
			/*location.href="/board/"+boardId;*/  //`` 이걸 쓰는걸 빽트기라고 한다.
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
function getDonatorsModalItem(product) {
	let item =
		`<tr>
			<td>${product.id}</td>				
			<td class="reply-table-title">${product.payChoice}</td>
			<td class="reply-table-title">${product.payName}</td>
			<td class="reply-table-title">${product.payPrice}</td>
			<td>${product.create_date}</td>

		</tr>`;

	return item;
}

function modalClose() {
	$("#modalTableHead > tr").remove();
	$("#modalTableBody > tr").remove();
}
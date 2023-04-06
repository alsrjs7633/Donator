/*ajax 호출시 default가 비동기 호출이다
  ajax통신을 이용해서 3개의 데이터를 json으로 변경하여 insert요청을 한다.
  ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해준다.
  */

let payment = {
	init: function() {
		$("#payment_button").on("click",()=>{
			this.payment();
		});
	},

	payment: function() {
		
		let data = {
			payChoice: $("input[name='chk_use']:checked").val(),
			payName:$("#pName").val(),
			payPrice:$("input[name='chk_money']:checked").val()
		};
		
        console.log(data.payChoice)
        console.log(data.payName)
		console.log(data.payPrice)
		var IMP = window.IMP;
		IMP.init('imp31226588');
		var msg;

		IMP.request_pay({
			pg: 'kakaopay',
			pay_method : 'card',
			merchant_uid : '기부자들' + new Date().getTime(),
			name : "기부자들",
			amount :data.payPrice,
		}, function(resp) {
			$.ajax({
				type: "POST",
				url: "/payment",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp){
			alert("결제가 완료되었습니다."+data.payPrice);
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		});
	}

}
payment.init();


/*let payment = {
	init: function() {
		$("#payment_button").on("click",()=>{
			this.payment();
		});
	},
	

	payment: function() {
		
		let data = {
			payChoice: $("input[name='chk_use']:checked").val(),
			pName:$("#pName").val(),
			pPrice:$("input[name='chk_money']:checked").val()
		};
		
        console.log(data.payChoice)
        console.log(data.pName)
		console.log(data.pPrice)
		var IMP = window.IMP;
		IMP.init('imp31226588');
		var msg;

		IMP.request_pay({
			pg: 'kakaopay',
			pay_method : 'card',
			merchant_uid : '기부자들' + new Date().getTime(),
			name : "기부자들",
			amount :data.pPrice,
		}, function(resp) {
			$.ajax({
				type: "POST",
				url: "/payment",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp){
			alert("결제가 완료되었습니다.");
			location.href="/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
		});
	}

}
payment.init();*/
$(document).ready(function () {
      $('.jcheckAll').click(function () {
        $('.jcheckOne').prop('checked',this.checked);
      });

      
      
    });
    //////
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#proofFile").on("change", handleImgFileSelect);
    });
	$(document).ready(function() {
		$("#App_proofFile").on("change", handleImgFileSelect);
	});

 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
    //파일 업로드
    function fn_submit(){
        
        var form = new FormData();
        form.append( "proofFile", $("#proofFile")[0].files[0] );
        console.log(form)
         jQuery.ajax({
             url : "/upload"
           , type : "POST"
           , enctype: "multipart/form-data"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
function submitForm() {
	// FormData 객체 생성
	var formData = new FormData(document.getElementById("applicationForm"));

	// AJAX 요청 생성
	$.ajax({
		url: "/application",
		type: "POST",
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			console.log(response);
		}
	});
}

let index={
	check: function(){//필수 입력사항 체크
	  var ch1=$('#jch2').is(':checked');
      var ch2=$('#jch1').is(':checked');
      return ch1&&ch2;
	},
	pa:function(){//선택사항 체크시 1
		if($('#phoneAgree').is(':checked')){
			return 1;
		}
	},
	ea:function(){//선택사항 체크시 1
		if($('#emailAgree').is(':checked')){
			return 1;
		}
	},
	//아이디 중복체크
	
	
	
	//회원가입
	init: function(){
		$("#join_save").on("click",()=>{
			if(index.check()){
			this.save();
			}else{
				alert("약관에 동의해주세요");
				location.href="/auth/joinForm"
			}
			
		});
		$("#upload_btn").on("click",()=>{
			
			this.upload();
		
		});
		
	},
	
	

	save: function(){
		let data={
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val(),
			name: $("#name").val(),
			tel: $("#tel").val(),
			birth: $("#birth").val(),
			area: $("#area_select").val(),
			phoneagree: index.pa(),
			emailagree: index.ea(),
			gender: $("input[name='genderch']:checked").val()
		}
		$.ajax({ 
			//회원가입 수행 요청 
			//(100초라 가정한다면 도중에 done이나 fail 실행 )
			type:"POST",
			url:"/auth/joinProc",
			data:JSON.stringify(data), //http body 데이터
			contentType:"application/json; charset=utf-8",
			dataType:"json" //자동으로 변환해주기 때문에 생략 가능
			//응답의 결과가 문자열이 아닌 json으로 변환
		}).done(function(resp){
			alert("회원가입이 완료되었습니다.");
			location.href="/";
			//응답이 정상
		}).fail(function(error){
			alert(JSON.stringify(error));
			//응답이 비정상
		});
	},
}
	

index.init();



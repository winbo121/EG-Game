
/*회원가입 프로필 부분*/
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('.image-upload-wrap').hide();
			$('.file-upload-image').attr('src', e.target.result);
			$('.file-upload-content').show();
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		removeUpload();
	}
}

function removeUpload() {
	$('.file-upload-input').replaceWith($('.file-upload-input').clone());
	$('.file-upload-content').hide();
	$('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function() {
	$('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function() {
	$('.image-upload-wrap').removeClass('image-dropping');
});

/*회원가입  script*/

    $(".join_input").on("focus", function() {
	$(this).parent().attr("id","focus");
}).on("blur", function() {
	$(this).parent().removeAttr("id","focus");
});


/* 이메일 */
function Email(email){
	var email_chk = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	if (email_chk.test(email)) {
		return true;
	} 
	else {
		return false;
	}
}

$("#join_email").keyup(function(e){
	
	var email = $("#join_email").val();
	
	
	if (e.keyCode == 13) {
		if(email.length==0){
			$("#email_textblank").css('display', 'inline-block');
			$("#email_success").css('display', 'none');
			$("#email_fail").css('display', 'none');
		}
		else if (Email(email)) {
			$("#email_textblank").css('display', 'none');
			$("#email_fail").css('display', 'none');
			$("#email_success").css('display', 'inline-block');
		}
		else {
			$("#email_textblank").css('display', 'none');
			$("#email_success").css('display', 'none');
			$("#email_fail").css('display', 'inline-block');
		}
	}
	
	if(e.keyCode == 8){
		var emailVal = $(this).val();
		
		
		if(emailVal.length<1){
			$(".join_id>span").css("display", "none");
		}
	}
});

/*비밀번호*/
$("#join_pw").keyup(function(e) {
	
	var pw = $("#join_pw").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (e.keyCode == 13) {
		if(pw.length==0){
			$("#pw_textblank").css('display', 'inline-block');
			$("#pw_text").css('display', 'none');
			$("#pw_blank").css('display', 'none');
			$("#pw_special").css('display', 'none');
		}
		
		else if (pw.length < 8 || pw.length > 20) {
			$("#pw_text").css('display', 'inline-block');
			$("#pw_textblank").css('display', 'none');
			$("#pw_blank").css('display', 'none');
			$("#pw_special").css('display', 'none');
			
		} else if (pw.search(/\s/) != -1) {
			$("#pw_blank").css('display', 'inline-block');
			$("#pw_text").css('display', 'none');
			$("#pw_textblank").css('display', 'none');
			$("#pw_special").css('display', 'none');
			
		} else if (num < 0 || eng < 0 || spe < 0) {
			$("#pw_special").css('display', 'inline-block');
			$("#pw_blank").css('display', 'none');
			$("#pw_text").css('display', 'none');
			$("#pw_textblank").css('display', 'none');
		}
	}
	
	if(e.keyCode == 8){
		var pwVal = $(this).val();
		
		
		
		if(pwVal.length<1){
			$(".join_pw>span").css("display", "none");
		}
	}
});

/*비밀번호 재확인*/
$("#join_rfpw").keyup(function(e) {

	var pw = $("#join_pw").val();
	var pw2 = $("#join_rfpw").val();

	if (e.keyCode == 13) {
		
		if(pw2.length==0){
			$("#rfpw_textblank").css('display', 'inline-block');
			$("#pw_chk").css('display', 'none');
			$("#pw_chk1").css('display', 'none');
		}
		
		else if (pw != '' && pw2 == '') {
			null;
		} else if (pw != "" || pw2 != "") {
			if (pw == pw2) {
				// 비밀번호 일치 이벤트 실행
				$("#pw_chk").css('display', 'inline-block');
				$("#pw_chk1").css('display', 'none');
			} else {
				// 비밀번호 불일치 이벤트 실행
				$("#pw_chk").css('display', 'none');
				$("#pw_chk1").css('display', 'inline-block');
			}
		}
	}

	if (e.keyCode == 8) {
		var pwVal1 = $(this).val();

		if (pwVal1.length < 1) {
			$(".join_rfpw>span").css("display", "none");
		}
	}
});

/*휴대전화 체크*/
function Phone(phone) {

	var phone_chk = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

	
	if (phone_chk.test(phone)) {
		return true;
	} 
	else {
		return false;
	}

}

$("#user_phone").keyup(function(e) {

	var phone = $("#user_phone").val();
	var hyphen = $("#user_phone").val(phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));

	
		if (e.keyCode == 13) {
			if (phone.length == 0) {
				$("#phone_textblank").css('display', 'inline-block');
				$("#phone_fail").css('display', 'none');
		}

			else if (Phone(phone)) {
				$("#phone_textblank").css('display', 'none');
				$("#phone_fail").css('display', 'none');

		} 
			else {
				$("#phone_fail").css('display', 'inline-block');
				$("#phone_textblank").css('display', 'none');
		}
	}
	
	if(e.keyCode == 8){
		
		var phoneVal = $(this).val();
		
		
		if(phoneVal.length<1){
			$(".join_phone>span").css("display", "none");
		}
	}
});

// 전체 체크
function all_chk(){
	
	var email = $("#join_email").val();
	var pw = $("#join_pw").val();
	var pw2 = $("#join_rfpw").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	var phone = $("#user_phone").val();
	var nick = $("#unick").val();
	
		if(email.length==0){
			$("#email_textblank").css('display', 'inline-block');
			$("#email_success").css('display', 'none');
			$("#email_fail").css('display', 'none');
		}
		else if (Email(email)) {
			$("#email_textblank").css('display', 'none');
			$("#email_fail").css('display', 'none');
			$("#email_success").css('display', 'inline-block');
		}
		else {
			$("#email_textblank").css('display', 'none');
			$("#email_success").css('display', 'none');
			$("#email_fail").css('display', 'inline-block');
		}
		
		if(pw.length==0){
			$("#pw_textblank").css('display', 'inline-block');
			$("#pw_text").css('display', 'none');
			$("#pw_blank").css('display', 'none');
			$("#pw_special").css('display', 'none');
		}
			
		else if (pw.length < 8 || pw.length > 20) {
			$("#pw_text").css('display', 'inline-block');
			$("#pw_textblank").css('display', 'none');
			$("#pw_blank").css('display', 'none');
			$("#pw_special").css('display', 'none');
				
		} else if (pw.search(/\s/) != -1) {
			$("#pw_blank").css('display', 'inline-block');
			$("#pw_text").css('display', 'none');
			$("#pw_textblank").css('display', 'none');
			$("#pw_special").css('display', 'none');
				
		} else if (num < 0 || eng < 0 || spe < 0) {
			$("#pw_special").css('display', 'inline-block');
			$("#pw_blank").css('display', 'none');
			$("#pw_text").css('display', 'none');
			$("#pw_textblank").css('display', 'none');
		}
		
		if(pw2.length==0){
			$("#rfpw_textblank").css('display', 'inline-block');
			$("#pw_chk").css('display', 'none');
			$("#pw_chk1").css('display', 'none');
		}
		
		else if (pw != '' && pw2 == '') {
			null;
		} else if (pw != "" || pw2 != "") {
			if (pw == pw2) {
				// 비밀번호 일치 이벤트 실행
				$("#pw_chk").css('display', 'inline-block');
				$("#pw_chk1").css('display', 'none');
			} else {
				// 비밀번호 불일치 이벤트 실행
				$("#pw_chk").css('display', 'none');
				$("#pw_chk1").css('display', 'inline-block');
			}
		}
		
		if (phone.length == 0) {
			$("#phone_textblank").css('display', 'inline-block');
			$("#phone_fail").css('display', 'none');
		}

		else if (Phone(phone)) {
			$("#phone_textblank").css('display', 'none');
			$("#phone_fail").css('display', 'none');

		} 
		else {
			$("#phone_fail").css('display', 'inline-block');
			$("#phone_textblank").css('display', 'none');
		}
		if(nick.length == 0){
			$("#nick_textblank").css('display', 'inline-block');
		}
}
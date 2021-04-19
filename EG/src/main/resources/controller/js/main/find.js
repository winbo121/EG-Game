
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

$("#txt_inputID").keyup(function(e) {

	var phone = $("#txt_inputID").val();
	var hyphen = $("#txt_inputID").val(phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-"));

		if(phone.length >2){
			$(".delBt").css('display', 'inline-block');
		}
	
		if(e.keyCode == 8){
		
			var phoneVal = $(this).val();
		
		
		if(phoneVal.length<1){
			$(".errorMsg>span").css("display", "none");
			$(".delBt").css('display', 'none');
			$(".input_wrap").css('border', 'none');
		}
	}
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

$("#txt_inputPw").keyup(function(e){
	
	var email = $("#txt_inputPw").val();
	
	if(email.length >2){
		$(".delBt").css('display', 'inline-block');
	}
	
	if(e.keyCode == 8){
		var emailVal = $(this).val();
		
		
		if(emailVal.length<1){
			$(".errorMsg>span").css("display", "none");
			$(".delBt").css('display', 'none');
			$(".input_wrap").css('border', 'none');
		}
	}
});


function ID_find_chk(){
	var phone = $("#txt_inputID").val();
	
	if (phone.length == 0) {
		$("#phone_textblank").css('display', 'inline-block');
		$("#phone_fail").css('display', 'none');
		$(".input_wrap").css('border', '1px solid #FE2E2E');
	}
	
	else if (Phone(phone)) {
		$("#phone_textblank").css('display', 'none');
		$("#phone_fail").css('display', 'none');
	} 
	else {
		$("#phone_fail").css('display', 'inline-block');
		$("#phone_textblank").css('display', 'none');
		$(".input_wrap").css('border', '1px solid #FE2E2E');
	}
}

function Pw_find_chk(){
	var email = $("#txt_inputPw").val();
	
	if(email.length==0){
		$("#email_textblank").css('display', 'inline-block');
		$("#email_fail").css('display', 'none');
		$(".input_wrap").css('border', '1px solid #FE2E2E');
	}
	else if (Email(email)) {
		$("#email_textblank").css('display', 'none');
		$("#email_fail").css('display', 'none');
	}
	else {
		$("#email_textblank").css('display', 'none');
		$("#email_fail").css('display', 'inline-block');
		$(".input_wrap").css('border', '1px solid #FE2E2E');
	}
}
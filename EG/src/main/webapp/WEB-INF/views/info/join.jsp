<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/member_info.css" />
</head>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script> <!--validate-->
<script type="text/javascript">

var joinIdButtonCheck = false;

var joinUidSubmit = false;
var joinEmailSubmit = false;
var joinPasswordSubmit = false;
var joinTelSubmit = false;

$(document).ready(function(){
	

	  $("#joinBtn").on("click",function(){
		  
		  var uid = $("#join_uid").val();
		  var email = $("#join_email").val();
		  var pw = $("#join_rfpw").val();
		  var tel = $("#user_phone").val();		  
		  
		  
		  console.log("joinUidSubmit ->",joinUidSubmit);
		  console.log("joinEmailSubmit ->",joinEmailSubmit);
		  console.log("joinPasswordSubmit ->",joinPasswordSubmit);
		  console.log("joinTelSubmit ->",joinTelSubmit);
		  
		  if(uid == "" ||  email == "" || pw == "" || tel == "" || joinUidSubmit == false || joinEmailSubmit == false || joinPasswordSubmit == false || joinTelSubmit == false){
			  alert("회원가입 양식을 제대로 채워주세요!")
		  }else{
			  
				var formData = new FormData($('#join_form')[0]);
				
				$.ajax({
					type: "POST" ,
					url:  "/EG/joinInsert" ,
					enctype: 'multipart/form-data',
					data: formData,
					processData: false,
					contentType: false, 
					success: function(data){
						alert("회원가입 완료")
						location.href="/EG/main"
					}
				});	
		  }
		  
	  });
	
});

function checkJoinId(){
	
	var uidValue = $("#join_uid").val();
	
	
	if(uidValue != ""){
		
		$.ajax({
			type: "POST" ,
			url:  "/EG/joinIdCheck" ,
			data: {"uid":uidValue},
			success: function(data){
				console.log(data.resultData);
				if(data.resultData == "Success"){
					joinIdButtonCheck = true;
					joinUidSubmit = true;
					$("#uid_buttonCheckFail").hide();
					$("#uid_buttonCheckSuccess").show();
				}else{
					joinIdButtonCheck = false;
					joinUidSubmit = false;
					$("#uid_buttonCheckFail").show();
					$("#uid_buttonCheckSuccess").hide();
				}	
			}
		});	
		
	}else{
		alert("아이디를 입력해주세요");
	}

}

function checkIdCheckButton(id){
	
	if(!joinIdButtonCheck){
		$("#uid_buttonCheckFail").show();
		$("#uid_buttonCheckSuccess").hide();
		joinUidSubmit = false;
	}else{
		$("#uid_buttonCheckFail").hide();
		$("#uid_buttonCheckSuccess").show();
		joinUidSubmit = true;
	}
	
}

function checkEmailFormat(id){
	
	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	
	var email_address = $("#"+id).val();
	
	if(!email_regex.test(email_address)){ 
		$("#email_success").hide();
		$("#email_fail").show();
		joinEmailSubmit = false;
	}else{
		$("#email_fail").hide();
		$("#email_success").show();
		joinEmailSubmit = true;
	}
	
}

function checkEmptyValue(input){

	var id = input.id
	var value = input.value
	
	$("#uid_textblank").hide();
	$("#email_textblank").hide();
	$("#phone_textblank").hide();
	
	if(value.search(/\s/) != -1 || value == "") {
		 if(id == "join_uid"){
			 $("#uid_textblank").show();
			 joinUidSubmit = false;
		 }
		 else if(id == "join_email"){
			 $("#email_textblank").show();
			 joinEmailSubmit = false;
		 }
		 else if(id == "user_phone"){
			 $("#phone_textblank").show();
			 joinTelSubmit = false;
		 }
		 
		 joinSubmit = false;
	}else{
		
		if(id == "join_uid"){
			checkIdCheckButton(id);
		}else if(id == "join_email"){
			checkEmailFormat(id);
		}else if(id == "user_phone"){
			joinTelSubmit = true;
		}
		
	}
	
}

function checkConditionPwd(password){

	var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{8,20}$/;
		
    if(password.search(/\s/) != -1) { 
		$("#pw_good").hide();
		$("#pw_bad").hide();
    	$("#pw_textblank").show();
    	joinPasswordSubmit = false;
    } else { 
    	
    	$("#pw_textblank").hide();
    	
    	if (regex.test(password)) {
    		$("#pw_good").show();
    		$("#pw_bad").hide();
    		$('#join_rfpw').attr("disabled",false);
    		
    	} else {
    		$("#pw_good").hide();
    	  	$("#pw_bad").show();
    	  	$("#join_rfpw").val("");
    	  	$('#join_rfpw').attr("disabled",true);
    	  	joinPasswordSubmit = false;
    	}
    	
    }
}

function confirmSecondPwd(password){
	var firstPassword = $("#join_pw").val();
	var secondPassword = password
	$("#pw_chkSuccess").hide();
	$("#pw_chkFail").hide();
	
	if(firstPassword == secondPassword){
		$("#pw_chkSuccess").show();
		joinPasswordSubmit = true;
	}else{
		$("#pw_chkFail").show();
		joinPasswordSubmit = false;
	}
}
</script>
<body>
	<div id="join_wrapper">
		<div class="join_main">
			<strong class="join_title">회원가입</strong>
			<form action="" class="m_form" enctype="multipart/form-data" id="join_form">
				<div class="image-upload-wrap">
					<input class="file-upload-input" multiple="multiple" type="file"
						name="File1" onchange="readURL(this);" accept="image/*">
					<div class="drag-text">
						<h3>select add Profile</h3>
					</div>
				</div>
				<div class="file-upload-content">
					<img class="file-upload-image" src="#" alt="your profile">
					<div class="image-title-wrap">
						<button type="button" onclick="removeUpload()"
							class="remove-image">Remove</button>
					</div>
				</div>
				<span>아이디:</span>
				<div class="join_nickname">
					<input type="text" class="join_input" id="join_uid" name="uid" onblur="checkEmptyValue(this)">
						<button type="button" class="btn_etc" onclick="checkJoinId()">중복확인</button>
						<span id="uid_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="uid_buttonCheckFail" style="color: red; display: none;">중복확인 해야 합니다.</span>
						<span id="uid_buttonCheckSuccess" style="color: blue; display: none;">중복확인 완료 되었습니다.</span>
				</div>
				<span>이메일:</span>
				<div class="join_id">
					<input type="text" name="email" class="join_input" id="join_email" onblur="checkEmptyValue(this)">
						<span id="email_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="email_success" style="color: blue; display: none;">올바른 이메일</span>
						<span id="email_fail" style="color: red; display: none;">이메일 형식이 맞지 않습니다.</span>
				</div>
				<span>비밀번호:</span>
				<div class="join_pw">
					<input type="password" class="join_input" id="join_pw" maxlength="20" onblur="checkConditionPwd(this.value)">
						<span id="pw_textblank" style="color: red; display: none;">비밀번호에 공백이 들어가 있습니다.</span>
						<span id="pw_good" style="color: blue; display: none;">비밀번호 조건에 맞습니다.</span>
						<span id="pw_bad" style="color: red; display: none;">비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.</span>
				</div>
				<span>비밀번호 재확인:</span>
				<div class="join_rfpw">
					<input type="password" class="join_input" id="join_rfpw" name="pw" maxlength="20" onblur="confirmSecondPwd(this.value)" disabled>
						<span id="pw_chkSuccess" style="color: blue; display: none;">비밀번호가 일치합니다.</span>
						<span id="pw_chkFail" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
				</div>
				<span>휴대전화:</span>
				<div class="join_phone">
					<input type="text" class="join_input" id="user_phone" name="tel" maxlength="13" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" onblur="checkEmptyValue(this)">
						<span id="phone_textblank" style="color: red; display: none;">필수 정보입니다.</span>						
				</div>

				<button type="button"  id="joinBtn"
					class="join_btn"
					style="background-color: rgb(250, 250, 250); color: #fff; border: none;" >
					<b>가입하기</b>
				</button>
			</form>
		</div>
	</div>

	<script type="text/javascript"
		src="resources/controller/js/info/info_main.js"></script>
</body>
</html>

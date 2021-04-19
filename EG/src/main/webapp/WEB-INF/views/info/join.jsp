<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../../css/member_info.css" />
</head>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<body>
	<div id="join_wrapper">
		<div class="join_main">
			<strong class="join_title">회원가입</strong>
			<form action="" class="m_form" enctype="multipart/form-data">
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
				<span>이메일 아이디:</span>
				<div class="join_id">
					<input type="text" name="user_email" class="join_input" id="join_email">
						<span id="email_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="email_success" style="color: red; display: none;">올바른 이메일</span>
						<span id="email_fail" style="color: red; display: none;">이메일 형식이 맞지 않습니다.</span>
				</div>
				<span>비밀번호:</span>
				<div class="join_pw">
					<input type="password" class="join_input" id="join_pw" maxlength="20">
						<span id="pw_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="pw_text" style="color: red; display: none;">8자리 ~ 20자리 이내로 입력해주세요.</span>
						<span id="pw_blank" style="color: red; display: none;">비밀번호는 공백 없이 입력해주세요.</span>
						<span id="pw_special" style="color: red; display: none;">영문,숫자, 특수문자를 혼합하여 입력해주세요.</span>
				</div>
				<span>비밀번호 재확인:</span>
				<div class="join_rfpw">
					<input type="password" class="join_input" id="join_rfpw" maxlength="20">
						<span id="rfpw_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="pw_chk" style="color: red; display: none;">비밀번호가 일치합니다.</span>
						<span id="pw_chk1" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
				</div>
				<span>휴대전화:</span>
				<div class="join_phone">
					<input type="text" class="join_input" id="user_phone" maxlength="13">
						<span id="phone_textblank" style="color: red; display: none;">필수 정보입니다.</span>
						<span id="phone_fail" style="color: red; display: none;">휴대전화 형식이 맞지 않습니다.</span>
				</div>
				<span>닉네임</span>
				<div class="join_nickname">
					<input type="text" class="join_input" id="unick" name="unick">
						<button type="button" class="btn_etc">선택</button>
						<span id="nick_textblank" style="color: red; display: none;">필수 정보입니다.</span>
				</div>
				<button type="button" onclick="all_chk()" id="joinBtn"
					class="join_btn"
					style="background-color: rgb(250, 250, 250); color: #fff; border: none;">
					<b>가입하기</b>
				</button>
			</form>
		</div>
	</div>

	<script type="text/javascript"
		src="../../controller/js/info/info_main.js"></script>
</body>
</html>
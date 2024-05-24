<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="resources/css/member_info.css" />
</head>
<script type="text/javascript"
	src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	  $("body").on("keyup",function(key){
		  
		  if(key.keyCode==13) {
			  $("#loginBtn").trigger("click");        
		  }

	  });
	
	 

	  $("#loginBtn").on("click",function(){
			
		    var uid = $("#uid").val();
		    var password = $("#password").val();
		 
			if(uid.search(/\s/) != -1 || uid == "" || password.search(/\s/) != -1 || password== ""){
				  alert("로그인 양식에 공백이나 띄어쓰기를 하지마세요.")
				  return;
			}
					
			$.ajax({
						type: "POST" ,
						url:  "/EG/loginCheck" ,					
						data: {
							   "uid": uid,
							   "password" : password
							   },
						success: function(data){
							
							if(data.resultData == "noUid"){
								alert("존재하지 않는 아이디 입니다.");
							}else if(data.resultData == "noPwd"){
								alert("비밀번호가 틀렸습니다.");
							}else{
								alert("로그인 완료");
								location.href="/EG/main";
							}

						}
			});	
	  });

});


</script>	
	
	
</head>
<body>
	<div id="login_wrapper">
		<header>
		<div class="div_top">
			<div class="top_menu">
				<div id="logo">
					<div id="m_nav_btn">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-list" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"> <path
							fill-rule="evenodd"
							d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
						</svg>
					</div>
					<div id="m_nav_wrap">
						<div id="m_nav_btn_close">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg"> <path
								fill-rule="evenodd"
								d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
							</svg>
						</div>
						<div id="m_nav">
							<table id="m_user_info">
								<tr>
									<td>
										<div id="m_img_cut">
											<img src="resources/img/game_img/dodge.jpg">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<p>사용자 : 은경</p>
									</td>
								</tr>
								<tr>
									<td>
										<p>아이디 : a</p>
									</td>
								</tr>
								<tr>
									<td>
										<p>등급 : a</p>
									</td>
								</tr>
							</table>
							<ul>
								<li><a href="">홈으로</a></li>
								<li><a href="">로그인</a></li>
								<li><a href="">게시판</a></li>
								<li><a href="">무비누림</a></li>
							</ul>
						</div>
					</div>
					<h3>
						<a href="/EG/main"><img src="resources/img/main/logo.png"
							alt="EG"></a>
					</h3>
				</div>
			</div>
		</div>
		</header>
		<div class="login_main">
			<p class="space_or">
				<span>로그인</span>
			</p>
			<form class="m_form"  id="loginForm">
				<div class="login_id">
					<input type="text" placeholder="이메일" id="uid" name="uid" >
				</div>
				<div class="login_password">
					<input type="password" placeholder="비밀번호" id="password" name="password">
				</div>
				

			</form>
				<button class="btn_click" id="loginBtn">
					<span>로그인</span>
				</button>
			<div class="login_footer">
				<div class="pw_revise">
					<a href="/EG/resetPw"><span>비밀번호 재설정</span></a>
				</div>
				<div class="sign_up">
					<a href="/EG/join"><span>회원가입</span></a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/EG/resources/controller/js/main/home.js"></script>
	<script type="text/javascript" src="/EG/resources/controller/js/prefixfree.dynamic-dom.min.js"></script>
</body>
</html>
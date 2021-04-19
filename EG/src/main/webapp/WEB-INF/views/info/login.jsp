<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../../css/member_info.css" />
</head>
<script type="text/javascript"
	src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
											<img src="/img/game_img/dodge.jpg">
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
						<a href="../main/home.jsp"><img src="../../img/main/logo.png"
							alt="EG"></a>
					</h3>
				</div>
			</div>
		</div>
		</header>
		<div class="login_main">
			<p class="space_or">
				<span>또는</span>
			</p>
			<div class="login_id">
				<input type="text" placeholder="이메일">
			</div>
			<div class="login_password">
				<input type="password" placeholder="비밀번호">
			</div>
			<button class="btn_click">
				<span>로그인</span>
			</button>
			<div class="login_footer">
				<div class="pw_revise">
					<a href="reset_pw.jsp"><span>비밀번호 재설정</span></a>
				</div>
				<div class="sign_up">
					<a href="join.jsp"><span>회원가입</span></a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../../controller/js/main/home.js"></script>
	<script type="text/javascript" src="../../controller/js/prefixfree.dynamic-dom.min.js"></script>
</body>
</html>
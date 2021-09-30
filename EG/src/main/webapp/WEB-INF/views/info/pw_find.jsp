<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="resources/css/find.css" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<body>
	<form>
		<div class="popup_find2">
			<ul class="find2_tab">
				<li class="id"><a onclick="location.href='/EG/idFind'">EG ID찾기</a></li>
				<li class="password"><a class="on">비밀번호 찾기</a></li>
			</ul>
			<div class="contents">
				<p class="stit">비밀번호 찾기를 위한 EG ID를 입력해주세요.</p>
				<div class="find_pwsec">
					<dl class="find_pw_input">
						<dt>ID</dt>
						<dd>
							<div class="input_cnts">
								<div id="input_wrap" class="input_wrap">
									<p class="input_txtsec">
										<input type="text"
											id="txt_inputPw" class="inputTxt2 errorInput"
											placeholder="EG ID(이메일)">
									</p>
									<div class="input_alertsec">
										<p class="delBt" style="display: none;">
											<button type="button">
												<span class="hidden">입력삭제</span>
											</button>
										</p>
									</div>
								</div>
								<p id="errorMsg" class="errorMsg">
									<span id="email_textblank" style="color: red; display: none;">이메일(ID)를 입력하세요.</span>
									<span id="email_fail" style="color: red; display: none;">이메일(ID)형식이 맞지 않습니다.</span>
								</p>
							</div>
						</dd>
					</dl>
					<div class="btSec">
						<a id="ucInputLoginID_btnNext" class="bt3" onclick="Pw_find_chk()">다음</a>
						<!-- A021 -->
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
	<script type="text/javascript" src="resources/controller/js/main/find.js"></script>
</body>
</html>
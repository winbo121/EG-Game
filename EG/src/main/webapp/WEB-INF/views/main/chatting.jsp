<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
sessionStorage.setItem("uid", "${session.uid}"); //채팅할시 js파일에서 세션 아이디 가져올수 있는 방법
</script>
<div class="chat_wrap">
	<div class="header">CHAT
	<button class="chat_close"></button>
	</div>
	<div class="chat">
		<ul id="messageTextArea">
			<!-- 동적 생성 -->
		</ul>
	</div>
	<div class="input-div">
		<textarea  laceholder="Press Enter for send message." style="resize: none;"></textarea>
	</div>
	<div class="chat_click">
		<img src="resources/img/main/more.png" id="chat">
		<div class="hidden_desc">
			<p class="no_chat" id="no_chat">채팅 보지 않기</p>
			<p class="show_chat" id="show_chat">채팅 보기</p>
		</div>
	</div>

	<!-- format -->

	<div class="chat format">
		<ul>
			<li>
				<div class="sender">
					<span></span>
				</div>
				<div class="message">
					<span> </span>
				</div>
			</li>
		</ul>
	</div>
</div>
<div class="chat_user">
	<h2>User list</h2>
	<div class="user_list"></div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
<script type="text/javascript" src="resources/controller/js/main/chat.js"></script>
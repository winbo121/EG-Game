<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/game.css" />
<link rel="stylesheet" type="text/css" href="../../css/main.css" />
</head>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/phaser@3.11.0/dist/phaser.js"></script>
	<!-- 게임을 플레이 할 수 있게 해주는 파일 -->
	<script type="text/javascript" src="../../controller/js/game/star_eating/game.js"></script>
	<!-- 단순 game over 이미지를 출력해주며, 클릭시 다시 게임으로 진입한다.-->
	<script type="text/javascript" src="../../controller/js/game/star_eating/game_over.js"></script>
<body>
	<div id="g_header"></div>
	<div id="section">
		<div id="title">
			<h2>		
				게임명
			</h2>
			<p>남녀노소 즐길 수 있는 게임</p>
		</div>		

		<div id = "game_display">
			
		</div>

		<div class = "other_contents">
			<div class="comment_btn"><h3>댓글</h3></div>	
			<div id = "comment_contents">
				<!-- 글쓰기 div 시작 -->
				<div id = "comment_write">
					<textarea placeholder="입력하세요">						
					</textarea>
					<button>작성</button>
					<div class = "bottom"></div>
				</div>

				<!-- 댓글 리스트 시작 -->
				<div class = "list">
					<div class = "reply_img_cut">						
					</div>		
					<div class = "reply_contents">
						<div class = "reply_id">
							<h4><b>안형모</b></h4>
							<p> 내용 </p>
						</div>						
					</div>
					<div class = "bottom"></div>
				</div>
				<div class = "list">
					<div class = "reply_img_cut">						
					</div>		
					<div class = "reply_contents">
						<div class = "reply_id">
							<h4><b>안형모</b></h4>
							<p> 내용 </p>
						</div>						
					</div>
					<div class = "bottom"></div>
				</div>
				<div class = "list">
					<div class = "reply_img_cut">						
					</div>		
					<div class = "reply_contents">
						<div class = "reply_id">
							<h4><b>안형모</b></h4>
							<p> 내용 </p>
						</div>						
					</div>
					<div class = "bottom"></div>
				</div>
			</div>
			<div class="rank_contents">

				<h3>게임랭킹순위</h3>

				<!-- 결과 테이블 시작 -->
				<table>
					<tr>
						<th>순위</th>
						<th>유저</th>
						<th>점수</th>
						<th>갱신일</th>
					</tr>
					<tr>
						<td>1</td>
						<td>김은경</td>
						<td>33</td>
						<td>11:11:!1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>김은경</td>
						<td>33</td>
						<td>11:11:!1</td>
					</tr>				
				</table>
				<a id = "all_score" href="#">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
					  <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
					</svg>
				전체 스코어 보러가기</a>
			</div>
		</div>		
	</div>
	<footer class="footer"></footer>
	
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="../../controller/js/game/g_total.js"></script>
</body>
</html>
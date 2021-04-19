<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게임 순위</title>
<link rel="stylesheet" type="text/css" href="../../css/rank.css" />
<link rel="stylesheet" type="text/css" href="../../css/main.css" />
</head>
<body>
	<div id="header"></div>
	<div id="wrapper">
		<div class="nav_wrapper">
			<div class="rank_nav">
				<ul>
					<li id="sub_menu_li"><a href="#" title="total"><strong>전체</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="bricks"><strong>bricks</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="snake"><strong>snake</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="flappy_bird"><strong>flappy_bird</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="dodge"><strong>dodge</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="star_eating"><strong>star_eating</strong></a>
					</li>
					<li id="sub_menu_li"><a href="#" title="invaders"><strong>invaders</strong></a>
					</li>
				</ul>
			</div>
		</div>
		<div class="game_rankpage" id="total">
			<%@ include file="./total.jsp"%>
		</div>
		<div class="game_rankpage" id="bricks">
			<%@ include file="./bricks_rank.jsp"%>
		</div>
		<div class="game_rankpage" id="snake">
			<%@ include file="./snake_rank.jsp"%>
		</div>
		<div class="game_rankpage" id="flappy_bird">
			<%@ include file="./flappy_bird_rank.jsp"%>
		</div>
		<div class="game_rankpage" id="dodge">
			<%@ include file="./dodge_rank.jsp"%>
		</div>
		<div class="game_rankpage" id="star_eating">
			<%@ include file="./star_eating_rank.jsp"%>
		</div>
		<div class="game_rankpage" id="invaders">
			<%@ include file="./invaders_rank.jsp"%>
		</div>
	</div>

	<footer class="footer"></footer>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script type="text/javascript" src="../../controller/js/ranking/rank.js"></script> 
	<script type="text/javascript" src="../../controller/js/main/home.js"></script>
</body>
</html>
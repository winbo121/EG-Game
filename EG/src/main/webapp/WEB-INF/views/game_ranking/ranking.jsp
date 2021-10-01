<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게임 순위</title>
<link rel="stylesheet" type="text/css" href="resources/css/rank.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
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
			<jsp:include page="./total.jsp"/>
		</div>
		<div class="game_rankpage" id="bricks">
			<jsp:include page="./bricks_rank.jsp"/>
		</div>
		<div class="game_rankpage" id="snake">
			<jsp:include page="./snake_rank.jsp"/>
		</div>
		<div class="game_rankpage" id="flappy_bird">
			<jsp:include page="./flappy_bird_rank.jsp"/>
		</div>
		<div class="game_rankpage" id="dodge">
			<jsp:include page="./dodge_rank.jsp"/>
		</div>
		<div class="game_rankpage" id="star_eating">
			<jsp:include page="./star_eating_rank.jsp"/>
		</div>
		<div class="game_rankpage" id="invaders">
			<jsp:include page="./invaders_rank.jsp"/>
		</div>
	</div>

	<footer class="footer"></footer>

	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script type="text/javascript" src="resources/controller/js/ranking/rank.js"></script> 
</body>
</html>
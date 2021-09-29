<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홈</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/chat.css" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/css/swiper.min.css'>
<!-- 애니메이션 라이브러리 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
</head>
<body>
	<div id="header"></div>
	<!-- t내용t -->
	<section id="contents_wrapper">
		<div id="contents">
			<div class="myInfo">
				<div class="rank_title">
					<h2>랭킹 Top5</h2>
				</div>
				<div class="all_rank">
					<div id="rank_wrapper">
						<ul>
							<li>
								<span class="rank_img">
									<img src="resources/img/1.jpg" alt="">
								</span>
								<span class="rank_cate">
									<span class="recommend">1</span>
								</span>
								<span class="rank_name">닉네임</span>
							</li>
							<li>
								<span class="rank_img">
									<img src="resources/img/2.jpg" alt="">
								</span>
								<span class="rank_cate">
									<span class="recommend">2</span>
								</span>
								<span class="rank_name">닉네임</span>
							</li>
							<li>
								<span class="rank_img">
									<img src="resources/img/3.jpg" alt="">
								</span>
								<span class="rank_cate">
									<span class="recommend">3</span>
								</span>
								<span class="rank_name">닉네임</span>
							</li>
							<li>
								<span class="rank_img">
									<img src="resources/img/4.jpg" alt="">
								</span>
								<span class="rank_cate">
									<span class="recommend">4</span>
								</span>
								<span class="rank_name">닉네임</span>
							</li>
							<li>
								<span class="rank_img">
									<img src="resources/img/5.jpg" alt="">
								</span>
								<span class="rank_cate">
									<span class="recommend">5</span>
								</span>
								<span class="rank_name">닉네임</span>
							</li>
						</ul>
					</div>
					<span class="rank_viewmore"><a href="../game_ranking/ranking.jsp">더보기</a></span>
				</div>
			<div class="home_login">
					<div class="game_login">
						<a href="../info/login.jsp"><span>EG GAMES 로그인</span></a>
					</div>
					<div class="game_login_etc">
						<p>다른 계정 간편 로그인</p>
						<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <span
							class="kakao_icon"></span>
						</a>
					</div>
					<div class="home_find">
						<a href="#"
							onclick="window.open ('../info/id_find.jsp',
						'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=650, height=680');
						return false"
							onfocus='this.blur()'>EG ID찾기</a> <a href="#"
							onclick="window.open ('../info/pw_find.jsp',
						'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=650, height=680');
						return false"
							onfocus='this.blur()'>비밀번호 찾기</a>
					</div>
					<div class="home_join">
						<a href="../info/join.jsp">회원가입</a>
					</div>
				</div>
			</div>
			<div class="all_game" id="all_service">
				<div class="game_title">
					<h2>전체게임</h2>
				</div>
				<div id="game_wrapper">
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/bricks"> <img
								src="resources/img/game_img/bricks.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>블럭 깨기</h1>
							</div>
							<div class="game_synopsis">
								<span>막대처럼 생긴 유닛을 직접 컨트롤 해서 좌우로 움직인 후에 발사된 공이 아래쪽 빈공간에
									떨어지지 않도록 핑퐁거리면서 위쪽에 위치하고 있는 모든 블럭들을 부서트리면 승리하는 방식입니다.</span>
							</div>
						</div>
					</div>
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/snake"> <img
								src="resources/img/game_img/snake.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>스네이크</h1>
							</div>
							<div class="game_synopsis">
								<span>화면에 있는 뱀(처럼 생긴 길쭉한 막대)을 조작해서 상하좌우로 움직일 수 있으며, 뱀이 화면
									끝이나 장애물에 부딪히거나, 뱀 머리가 몸통에 닿으면 죽으면서 라이프를 잃는다.</span>
							</div>
						</div>
					</div>
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/flappyBird"> <img
								src="resources/img/game_img/flappy_bird.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>플래피버드</h1>
							</div>
							<div class="game_synopsis">
								<span>새의 낙하 속도 타이밍을 맞추어 높이를 조정해 가면서 파이프들 사이를 통과하는 게임으로,
									새가 곧장 땅바닥으로 떨어지거나 파이프에 박으면 죽는다.</span>
							</div>
						</div>
					</div>
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/dodge"> <img
								src="resources/img/game_img/dodge.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>닷지</h1>
							</div>
							<div class="game_synopsis">
								<span>플레이어를 키보드로 조작하여 사방에서 날아오는 장애물을 요리조리 빠르게 회피하는 게임으로,
									맞지 않고 오랫동안 버틸수록 높은 점수를 얻을 수 있다.</span>
							</div>
						</div>
					</div>
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/starEating"> <img
								src="resources/img/game_img/star_eating.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>별 모으기</h1>
							</div>
							<div class="game_synopsis">
								<span>플레이어를 키보드로 조작하여 지구로 떨어진 별을 모으는 게임으로, 각 스테이지마다 늘어나는
									장애물을 피해 오랫동안 별을 모을수록 높은 점수를 얻을 수 있다.</span>
							</div>
						</div>
					</div>
					<div class="game_box">
						<div class="game_imgbox">
							<a href="/EG/invaders"> <img
								src="resources/img/game_img/invaders.jpg" class="game_img">
							</a>
						</div>
						<div class="game_content">
							<div class="game_info">
								<h1>우주 침략자</h1>
							</div>
							<div class="game_synopsis">
								<span>지구를 침략하는 우주생물체를 우주선을 조작하여 무찌르는 게임으로, 각 스테이지마다 빨라지는
									속도에 맞게 빠르게 클리어할수록 높은 점수를 얻을 수 있다.</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 768px이하 게임 부분 -->
				<div class="game_wrapper two">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/bricks"> <img
										src="resources/img/game_img/bricks.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>블럭 깨기</h1>
									</div>
									<div class="game_synopsis">
										<span>막대처럼 생긴 유닛을 직접 컨트롤 해서 좌우로 움직인 후에 발사된 공이 아래쪽 빈공간에
											떨어지지 않도록 핑퐁거리면서 위쪽에 위치하고 있는 모든 블럭들을 부서트리면 승리하는 방식입니다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/snake"> <img
										src="resources/img/game_img/snake.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>스네이크</h1>
									</div>
									<div class="game_synopsis">
										<span>화면에 있는 뱀(처럼 생긴 길쭉한 막대)을 조작해서 상하좌우로 움직일 수 있으며, 뱀이
											화면 끝이나 장애물에 부딪히거나, 뱀 머리가 몸통에 닿으면 죽으면서 라이프를 잃는다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/flappyBird"> <img
										src="resources/img/game_img/flappy_bird.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>플래피버드</h1>
									</div>
									<div class="game_synopsis">
										<span>새의 낙하 속도 타이밍을 맞추어 높이를 조정해 가면서 파이프들 사이를 통과하는 게임으로,
											새가 곧장 땅바닥으로 떨어지거나 파이프에 박으면 죽는다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/dodge"> <img
										src="resources/img/game_img/dodge.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>닷지</h1>
									</div>
									<div class="game_synopsis">
										<span>플레이어를 키보드로 조작하여 사방에서 날아오는 장애물을 요리조리 빠르게 회피하는
											게임으로, 맞지 않고 오랫동안 버틸수록 높은 점수를 얻을 수 있다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/starEating"> <img
										src="resources/img/game_img/star_eating.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>별 모으기</h1>
									</div>
									<div class="game_synopsis">
										<span>플레이어를 키보드로 조작하여 지구로 떨어진 별을 모으는 게임으로, 각 스테이지마다
											늘어나는 장애물을 피해 오랫동안 별을 모을수록 높은 점수를 얻을 수 있다.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="game_box">
								<div class="game_imgbox">
									<a href="/EG/invaders"> <img
										src="resources/img/game_img/invaders.jpg" class="game_img">
									</a>
								</div>
								<div class="game_content">
									<div class="game_info">
										<h1>우주 침략자</h1>
									</div>
									<div class="game_synopsis">
										<span>지구를 침략하는 우주생물체를 우주선을 조작하여 무찌르는 게임으로, 각 스테이지마다
											빨라지는 속도에 맞게 빠르게 클리어할수록 높은 점수를 얻을 수 있다.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="myboard">
				<div class="board_title">
					<h2>소식</h2>
				</div>
				<div id="board_menu">
					<div class="board_menu_nav">
						<ul>
							<li id="sub_menu_li"><a href="#" title="free_board"><strong>자유게시판</strong></a>
							</li>
							<li id="sub_menu_li"><a href="#" title="help_board"><strong>고객센터</strong></a>
							</li>
							<li id="sub_menu_li"><a href="#" title="notice_board"><strong>공지사항</strong></a>
							</li>
						</ul>
					</div>
					<div class="all_board">
						<div id="board_wrapper">
							<div class="board_contents">
								<div class="board_Topcontent">
									<div class="board_content">
										<div class="board_page" id="free_board">
											<table border="1">
												<tr class="board_title">
													<th>작성자</th>
													<th>제목</th>
													<th>작성 날짜</th>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr style="border-bottom: none;">
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
											</table>
											<div class="board_viewmore">
												<span><a href="../sub/free_board.jsp">더보기</a></span>
											</div>
										</div>
										<div class="board_page" id="help_board">
											<table border="1">
												<tr class="board_title">
													<th>작성자</th>
													<th>제목</th>
													<th>작성 날짜</th>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr>
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
												<tr style="border-bottom: none;">
													<td>1</td>
													<td>2</td>
													<td>3</td>
												</tr>
											</table>
											<div class="board_viewmore">
												<span><a href="../sub/help.jsp">더보기</a></span>
											</div>
										</div>
										<div class="board_page" id="notice_board">
											<div class="bo_title">
												<span>공지사항</span>
											</div>
											<table border="1">
												<tr>
													<td style="width: 150px;">[공지]</td>
													<td>제목</td>
													<td>작성일</td>
												</tr>
												<tr>
													<td style="width: 150px;">[공지]</td>
													<td>제목</td>
													<td>작성일</td>
												</tr>
												<tr>
													<td style="width: 150px;">[공지]</td>
													<td>제목</td>
													<td>작성일</td>
												</tr>
												<tr>
													<td style="width: 150px;">[공지]</td>
													<td>제목</td>
													<td>작성일</td>
												</tr>
												<tr style="border-bottom: none;">
													<td style="width: 150px;">[공지]</td>
													<td>제목</td>
													<td>작성일</td>
												</tr>
											</table>
											<div class="board_viewmore">
												<span><a href="../sub/notice.jsp">더보기</a></span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="news_title">
					<h2>게임 뉴스</h2>
				</div>
				<div class="news_board">
					<div id="news_wrapper">
						<div class="news_contents">
							<div class="game_news"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="chat_menu"></div>
			<div class="chat_back"></div>
			<div class="chat_wrapper"></div>
			<div class="btn_div"></div>
		</div>
	</section>
	<!-- 푸터  -->
	<footer class="footer">
		
	</footer>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript"
		src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- Swiper JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>

	<script type="text/javascript" src="resources/controller/js/main/home.js"></script>
	<script type="text/javascript" src="resources/controller/js/info/login.js"></script>
	
</body>
</html>

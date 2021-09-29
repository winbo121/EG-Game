<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<header>
		<!-- 모바일 메뉴 -->
		<div class="div_top">
			<div class="top_menu">
				<div id="logo">
					<div id="m_nav_btn">
						<svg width="1em" height="1em" viewBox="0 0 16 16"
							class="bi bi-list" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"> <path
								fill-rule="evenodd"
								d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z">
						</path>
					</svg>
					</div>
					<div id="m_nav_wrap">
						<div id="m_nav_btn_close">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg"> <path
									fill-rule="evenodd"
									d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z">
							</path>
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
								<li><a href="../main/home.jsp">홈으로</a></li>
								<li><a href="../info/login.jsp">로그인</a></li>
								<li><a href="../game_ranking/ranking.jsp">게임순위</a></li>
								<li><a href="../sub/free_board.jsp">자유 게시판</a></li>
								<li><a href="../sub/help.jsp">고객센터</a></li>
								<li><a href="../sub/notice.jsp">공지사항</a></li>
							</ul>
						</div>
					</div>
					<!-- 로고 -->
					<h3>
						<a href="/EG/"><img src="resources/img/main/logo.png" alt="EG"></a>
					</h3>
					<!-- PC 메뉴 -->
					<ul class="menu_pc">
						<li><a href="../game_ranking/ranking.jsp"><span>게임순위</span></a></li>
						<li class="over">
							<button type="button">
								<span>더보기</span>
							</button>
							<ul class="list_sub">
								<li><a href="../sub/company.jsp">회사 소개</a></li>
								<li><a href="/EG/userBoardList">자유 게시판</a></li>
								<li><a href="/EG/centerBoardList">고객센터</a></li>
								<li><a href="../sub/notice.jsp">공지사항</a></li>
							</ul>
						</li>
						<li><a href="../info/login.jsp"><span>로그인</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- PC Swiper -->
		<div id="slider_box">
			<div class="swiper-container-pc">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="resources/img/swiper/img.jpg">
					</div>
					<div class="swiper-slide">
						<img src="resources/img/swiper/img2.jpg">
					</div>
					<div class="swiper-slide">
						<img src="resources/img/swiper/img3.jpg">
					</div>
					<div class="swiper-slide">
						<img src="resources/img/swiper/img4.jpg">
					</div>
					<div class="swiper-slide">
						<img src="resources/img/swiper/img5.jpg">
					</div>
					<div class="swiper-slide">
						<img src="resources/img/swiper/img6.jpg">
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination-pc"></div>
				<!-- Add Arrows -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
			</div>
			<!-- mobile Swiper -->
			<div class="swiper-container-mobile">
				<div class="swiper-wrapper">
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img2.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img3.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img4.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img5.jpg)"></div>
					<div class="swiper-slide"
						style="background-image: url(resources/img/swiper/img6.jpg)"></div>
				</div>
			</div>
		</div>
	</header>

	
	<script type="text/javascript" src="resources/controller/js/main/header.js"></script>
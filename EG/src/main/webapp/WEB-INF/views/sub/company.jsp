<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회사소개</title>
<link rel="stylesheet" type="text/css" href="resources/css/company.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
</head>
<body>
	<div id="company_header">
	</div>
	<div id="company_title">
		<div id="company_img_cut">
			<img src="/" onerror="this.src ='https://mblogthumb-phinf.pstatic.net/20150403_86/e2voo_14280514283502gas9_JPEG/kakako-00.jpg?type=w800'">
		</div>
		<div id="word">
			<h3>EG Company</h3><br>
			<p>은경컴퍼니</p><br>

			<p>은경소프트는 21세기를 선도하는 게임 종합 커뮤니티 사이트입니다</p><br>
			<p>2020년 설립되었으며 직원수 3명의 신생 기업입니다.</p>
		</div>
	</div>

	<div id="m_section">
		<div id="container" class="view_map">
			<div id="mapWrapper"
				style="width: 100%; height: 100%; position: relative;">
				<div id="map" style="width: 100%; height: 100%;"></div>
				<!-- 지도를 표시할 div 입니다 -->
				<input type="button" id="btnRoadview" onclick="toggleMap(false)"
					title="로드뷰 보기" value="로드뷰">
			</div>
			<div id="rvWrapper"
				style="width: 100%; height: 100%; position: absolute; top: 0; left: 0;">
				<div id="roadview" style="height: 100%;"></div>
				<!-- 로드뷰를 표시할 div 입니다 -->
				<input type="button" id="btnMap" onclick="toggleMap(true)"
					title="지도 보기" value="지도">
			</div>
		</div>
	</div>
	<div id="d_section">
		<div class="title">
			<h1>은경컴퍼니 개발자 소개</h1>
			<p>각 분야 개발자를 소개합니다</p>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>김은택</h3>
					<p>프론트엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 플랫폼레인 인턴</p>
				<p>- 주요 프로젝트 : 영화 추천 사이트, 여행지 추천 사이트</p>
			</div>

			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">http://</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>김재훈</h3>
					<p>백엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 서울쭈꾸미 녹번점 지점장</p>
				<p>- 주요 프로젝트 : 영화 추천 사이트, 여행지 추천 사이트, 하둡 프로젝트</p>
			</div>
			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">http://winbo121.cafe24.com/Movie_web/intro</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>

		<div class="dev">
			<div class="user_img_cut">
				<img src="" onerror="">
			</div>
			<div class="user_info">
				<div class="info_title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-person-lines-fill"
						viewBox="0 0 16 16">
				  <path
							d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z" />
				</svg>
					<h3>안형모</h3>
					<p>백엔드 개발자</p>
				</div>
				<p>
					<b>주요이력</b>
				</p>
				<p>- 한국성서대학교 졸업</p>
				<p>- 주식회사 맥서브 인턴</p>
				<p>- 더퍼스트인베서트먼트 재직</p>
				<p>- 주요 프로젝트 : 지문인식 IoT 사물함, 우리아이 커뮤니티 제작</p>
			</div>
			<div class="bottom">
				<div class="git">
					<p>
						<b>github : <a href="#">www.github.com</a></b>
					</p>
					<p>
						<b>project site : <a href="#">www.github.com</a></b>
					</p>
				</div>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-arrow-down-short"
				viewBox="0 0 16 16">
		  <path fill-rule="evenodd"
					d="M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z" />
		</svg>
		</div>
	</div>

	<!-- 푸터  -->
	<footer class="footer">
		
	</footer>


	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c267b95114595c226f7240c7eb15ed9e"></script>
	<script type="text/javascript" src="resources/controller/js/sub/company.js"></script>
	<!-- Swiper JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
</body>
</html>
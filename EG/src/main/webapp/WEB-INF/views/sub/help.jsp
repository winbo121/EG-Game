<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/footer_btn.css" />
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/css/swiper.min.css'>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
	<script>
$(document).ready(function(){
	
	$("#vo").submit(function() {
		$( this ).find( "#page" ).val("1");
	});
	
	$("#search_btn").click(function() {
		$("#vo").submit();
	});


	
});
</script>
</head>
<body>
	<div id="header"></div>
	<div id="wrapper">
		<div id="main">
			<div class="view_header">
				<div class="wrap">
					<div class="board_header">
						<div class="tit">
							<h1>고객센터</h1>
							<div class="desc">문의사항 접수중 입니다.</div>
							<div class="coach_area"></div>
						</div>
						<div class="coach_area">
							<div class="wrap">
								<div class="before_login">
									<p class="before_txt">
										로그인 하신 후<br>이용해 주세요.
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="customer_tabs">
						<ul>
							<li class="tab1"><strong>답변 중</strong> <em>+0개</em>의 문의가 답변중
								<a href="#"
								onclick="window.open ('/EG/centerBoardAnsweringList',
									'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=700, height=730');
										return false"
								onfocus='this.blur()' class="btn_link" id="answering">확인</a></li>

							<li class="tab2"><strong>답변 완료</strong> <em>+0개</em>의 문의가 답변
								완료 <a href="#"
								onclick="window.open ('/EG/centerBoardAnswerList',
									'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=700, height=730');
										return false"
								onfocus='this.blur()' class="btn_link" id="btn2">확인</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="wrap">
				<div class="notice_list">
					<div class="header">
						<div class="tit">
							<strong>※</strong> 중요 공지사항을 안내해드립니다.
						</div>
					</div>
					<div class="content">
						<div class="notice_swiper">
							<div class="ns_content">
								<div class="ns_wrapper swiper-wrapper">
									<div class="ns_item swiper-slide">
										<a href=""> 
											<span class="ns_thumb"> 
											<img src="resources/img/1.jpg" alt="">
										</span> <span class="tit">(예시)공지사항 제목입니다. 알겠습니까</span> 
										<span class="desc">요약 내용</span> <span class="etc"> <em class="date">어제</em> <em
												class="name"><span>운영자</span></em>
										</span>
										</a>
									</div>
									<div class="ns_item swiper-slide">
										<a href=""> 
											<span class="ns_thumb"> 
											<img src="resources/img/2.jpg" alt="">
										</span> <span class="tit">(예시)공지사항 제목입니다. 알겠습니까</span> 
										<span class="desc">요약 내용</span> <span class="etc"> <em class="date">어제</em> <em
												class="name"><span>운영자</span></em>
										</span>
										</a>
									</div>
									<div class="ns_item swiper-slide">
										<a href=""> 
											<span class="ns_thumb"> 
											<img src="resources/img/3.jpg" alt="">
										</span> <span class="tit">(예시)공지사항 제목입니다. 알겠습니까</span> 
										<span class="desc">요약 내용</span> <span class="etc"> <em class="date">어제</em> <em
												class="name"><span>운영자</span></em>
										</span>
										</a>
									</div>
									<div class="ns_item swiper-slide">
										<a href=""> 
											<span class="ns_thumb"> 
											<img src="resources/img/4.jpg" alt="">
										</span> <span class="tit">(예시)공지사항 제목입니다. 알겠습니까</span> 
										<span class="desc">요약 내용</span> <span class="etc"> <em class="date">어제</em> <em
												class="name"><span>운영자</span></em>
										</span>
										</a>
									</div>
									<div class="ns_item swiper-slide">
										<a href=""> 
											<span class="ns_thumb"> 
											<img src="resources/img/5.jpg" alt="">
										</span> <span class="tit">(예시)공지사항 제목입니다. 알겠습니까</span> 
										<span class="desc">요약 내용</span> <span class="etc"> <em class="date">어제</em> <em
												class="name"><span>운영자</span></em>
										</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="wrap">
				<div class="help_list">
					<div class="header">
					
				<form:form modelAttribute="vo" method="GET">
		
					<div class="search__container">
						<form:hidden path="page"/>
						<form:input path="search_text" placeholder="검색어를 입력하세요"  class="search__input"/>
						<input class="search__button" type="button">
					</div>
			
				</form:form>
					

					</div>
					<div class="help_content">
						<div class="list_wrap">
							<div class="thead">
								<div class="tr">
									<span class="th sort">아이디</span> <span class="th subject">제목</span>
									<span class="th date">작성일</span> <span class="th count">조회수</span>
								</div>
							</div>
							<div class="tbody">
										

			
								<div class="tr">
									<c:forEach var="list" items="${list }">
										<a href="#"
										onclick="window.open ('/EG/centerBoardRead',
											'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=700, height=730');
												return false"
										onfocus='this.blur()' class="btn_link" id="answering">
											<span class="td sort">${list.user_id }</span> <span class="td subject">${list.title }</span>
											<span class="td date">${list.created }</span> <span class="td count">${list.cnt }</span>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					
			<div id="paging">
		
				<c:if test="${vo.prev }">
				<a href="/EG/centerBoardList?page=${vo.startPage-1 }&search_text=${vo.search_text}"><-</a>
				</c:if>
				
				<c:forEach begin="${vo.startPage }" end="${vo.endPage }" var="idx">
				<a href="/EG/centerBoardList?page=${idx }&search_text=${vo.search_text}">${idx }</a>
				</c:forEach>
				
				<c:if test="${vo.next }">
				<a href="/EG/centerBoardList?page=${vo.endPage+1 }&search_text=${vo.search_text}">-></a>
				</c:if>
			
			</div>
					
					<div class="question">
						<a href="#"
								onclick="window.open ('/EG/centerBoardInsertPro',
									'cong_window' , 'toolbar=0, location=0, status=0, menubar=0, scrollbars=1, resizable=no, top=50, left=20, width=700, height=730');
										return false"
								onfocus='this.blur()' class="inquiry">
							1:1문의하기 <span class="icon">!</span>
							<div class="hidden_desc">
								<p class="desc">신속하게 답변 드리겠습니다.</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="btn_div">
				<ul class="flBtn-first">
			<li><a href="?pagefile=map.jsp" tooltip="map"><i
					class="fas fa-map-signs"></i></a></li>
			<li><a href="../game_ranking/ranking.jsp" tooltip="ranking"><i
					class="ranking"></i><span>랭킹</span></a></li>
			<li><a href="#all_service" tooltip="movie"><i class="games"></i><span>전체게임</span></a></li>
			<li><a class="up" href="#" tooltip="맨 위로"><i class="up_move"></i><span>TOP</span></a></li>

		</ul>
			</div>
		</div>
	</div>
	<!-- 푸터  -->
	<footer class="footer">
	
	</footer>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Swiper JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
</body>
</html>
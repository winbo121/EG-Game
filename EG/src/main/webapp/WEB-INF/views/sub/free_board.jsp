<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유 게시판</title>
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
</head>
<body>
	<div id="header"></div>
	<div id="free_title">
		<h2>커뮤니티 게시판</h2>
		<p>다양한 소통을 할 수 있습니다</p>
	</div>

	<div id="free_section">
		<div id="search_box">
			<label for="search"><b>검색어</b></label><input type="text"
				name="search" placeholder="검색어를 입력하세요">
			<button onclick="search();">검색</button>
		</div>
		<div id="select_div">
			<select name="cat" id="cat">
				<option value="자유게시판" selected>자유게시판</option>
				<option value="intro">자기소개</option>
				<option value="qna">Q&A</option>
			</select> <select name="sort" id="sort">
				<option value="최신순" selected>최신순</option>
				<option value="과거순">과거순</option>
			</select> <select name="option" id="option">
				<option value="이름" selected>이름</option>
				<option value="제목">제목</option>
				<option value="내용">내용</option>
				<option value="전체">전체</option>
			</select>
			<div class="bottom"></div>
		</div>

		<table>
			<tr>
				<th>글번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성시각</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.board_num }</td>
				<td>${list.cotegory }</td>
				<td><a href="#">${list.title }</a></td>
				<td>${list.user_id }</td>
				<td>${list.created }</td>
				<td>${list.cnt }</td>
			</tr>
			</c:forEach>
		</table>

		<div class="bottom"></div>

		<hr>
		<div id="paging">
		
			<c:if test="${vo.prev }">
			<a href="/EG/userBoardList?page=${vo.startPage-1 }"><-</a>
			</c:if>
			
			<c:forEach begin="${vo.startPage }" end="${vo.endPage }" var="idx">
			<a href="/EG/userBoardList?page=${idx }">${idx }</a>
			</c:forEach>
			
			<c:if test="${vo.next }">
			<a href="/EG/userBoardList?page=${vo.endPage+1 }">-></a>
			</c:if>
			
		</div>

		<button id="write_btn" onclick="javascript: location.href='/EG/userBoardInserPro'" id="write_btm">글쓰기</button>
	</div>
	<footer class="footer">
	
	</footer>
	<form:form modelAttribute="vo" method="GET">
	</form:form>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Swiper JS -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.js"></script>
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
</body>
</html>
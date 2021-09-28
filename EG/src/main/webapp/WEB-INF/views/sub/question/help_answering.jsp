<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EG 고객센터 문의</title>
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
</head>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<body>
	<div id="qa_wrapper" class="clfix">
		<div class="qa_nav">
			<ul>
				<li id="qa_menu_li"><a onclick="location.href='/EG/centerBoardInsertPro'"><strong>1대1문의</strong></a></li>
				<li id="qa_menu_li" class="qa_menu_on"><a class="qa_on"><strong>답변중</strong></a>
				</li>
				<li id="qa_menu_li"><a onclick="location.href='/EG/centerBoardAnswerList?user_id=winbo121'"><strong>답변완료</strong></a>
				</li>
			</ul>
		</div>
		<div class="qa_section">
			<div class="qa_page" id="question">

				<strong class="qa_tit">답변중</strong>
				<p class="qa_copy">접수하신 1:1문의내역 및 답변 내용을 확인하실 수 있습니다.</p>
				<p class="qa_copy2">※ 문의 내용 중 개인정보가 포함되었거나 중복된 문의인 경우 삭제될 수
					있습니다.</p>

				<div class="qa_tbl_content">
					<table>
						<caption>답변중</caption>
						<colgroup>
							<col style="width: 10%">
							<col style="width: 45%">
							<col style="width: 20%">
							<col style="width: 25%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">처리상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="answeringList" items="${answeringList }">
							<tr>
								<td>${answeringList.board_num}</td><td>${answeringList.title}</td><td>${answeringList.created}</td><td >${answeringList.process}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
	
</body>
</html>
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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script>
$(document).ready(function(){

	
	$("#search_btn").click(function() {
		$("#vo").find( "#page" ).val("1");
		$("#vo").submit();
	});

	
	$(".read_form").on("click",function(){
		
		/*
		var formData = new FormData($('#vo')[0]);
		formData.append("board_num",$( this ).children().eq(0).text())
		
		var form = $('<form></form>');
		form.attr('action', "/EG/userBoardRead");
		form.attr('method', "GET");
		
		
		for (var item of formData.entries()) {
		    console.log(item[0] + " : " + item[1]);
		    
	        var name = item[0];
	        var value = item[1];
			var field = $('<input></input>');
			field.attr("type", "hidden");
			field.attr("name", name);
			field.attr("value", value);
			form.append( field );
		}
		
		form.appendTo('body');
		form.submit();
		*/
		
		var field = $('<input></input>');
		field.attr("type", "hidden");
		field.attr("name", "board_num");
		field.attr("value", $( this ).children().eq(0).text());
		
		$("#vo").append(field)
		$("#vo").attr("action", "<c:url value='/userBoardRead'/>");
		$("#vo").submit();
		
	});
	
	
});

function pageSubmit(page){
	
	$("#page").val(page);
	$("#vo").submit();
}
</script>
</head>
<body>
	<div id="header"></div>
	<div id="free_title">
		<h2>커뮤니티 게시판</h2>
		<p>다양한 소통을 할 수 있습니다</p>
	</div>

	<div id="free_section">
		<form:form modelAttribute="vo" method="GET">
		
			<div id="search_box">
				<form:hidden path="page"/>
				<label for="search"><b>검색어</b></label>
				<form:input path="search_text" placeholder="검색어를 입력하세요" />
				<button id="search_btn">검색</button>
			</div>
		
			<div id="select_div">
				<form:select path="searchCategory">
					<form:option value="" selected="true" >전체</form:option>
					<c:forEach var="codeList" items="${codeList }">
						<form:option value="${codeList.code_cd }">${codeList.code_name }</form:option>
					</c:forEach>
				</form:select>
				<form:select path="searchSort">
					<form:option value="new" selected="true">최신순</form:option>
					<form:option value="order">과거순</form:option>
				</form:select> 
				<form:select path="searchOption" >
					<form:option value="name" >이름</form:option>
					<form:option value="title" selected="true">제목</form:option>
					<form:option value="content">내용</form:option>				
				</form:select>
	
				<div class="bottom"></div>
			</div>
			
		</form:form>
		
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
			<tr class="read_form">
				<td>${list.board_num }</td>
				<td>${list.cotegory }</td>
				<td>${list.title }</td>
				<td>${list.user_id }</td>
				<td>${list.created }</td>
				<td>${list.cnt }</td>
			</tr>
			</c:forEach>
		</table>

		<div class="bottom"></div>

		<hr>
		<div id="paging">
		
<%-- 			<c:if test="${vo.prev }"> --%>
<%-- 				<a href="/EG/userBoardList?page=${vo.startPage-1 }&search_text=${vo.search_text}"><-</a> --%>
<%-- 			</c:if> --%>
			
<%-- 			<c:forEach begin="${vo.startPage }" end="${vo.endPage }" var="idx"> --%>
<%-- 				<a href="/EG/userBoardList?page=${idx }&search_text=${vo.search_text}">${idx }</a> --%>
<%-- 			</c:forEach> --%>
			
<%-- 			<c:if test="${vo.next }"> --%>
<%-- 				<a href="/EG/userBoardList?page=${vo.endPage+1 }&search_text=${vo.search_text}">-></a> --%>
<%-- 			</c:if> --%>

				<c:if test="${vo.prev }">
					<a href="javascript:pageSubmit('${vo.startPage-1 }')"><-</a>
				</c:if>
				
				<c:forEach begin="${vo.startPage }" end="${vo.endPage }" var="idx">
					<a href="javascript:pageSubmit('${idx }')">${idx }</a>
				</c:forEach>
				
				<c:if test="${vo.next }">
					<a href="javascript:pageSubmit('${vo.endPage+1 }')">-></a>
				</c:if>
			
		</div>

		<button id="write_btn" onclick="javascript: location.href='/EG/userBoardInsertPro'" >글쓰기</button>
	</div>
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

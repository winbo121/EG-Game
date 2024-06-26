<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	

	
	$("#submitBtn").on("click",function(){
		
		
		var formData = new FormData($('#userBoard')[0]);
		
		for (var item of formData.entries()) {
		    console.log(item[0] + " : " + item[1]);
		}
	
		$.ajax({
			type: "POST" ,
			url:  "/EG/userBoardInsert" ,
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false, 
			success: function(data){
				location.href="/EG/userBoardList"
			}
		});	
		
	})
	
	$("#backBtn").on("click",function(){
		location.href="/EG/userBoardList";
	})
	
});

</script>
</head>
<body>
	<div id="w_section">
		<div>
			<div class = "title">
				<h1>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
					  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
					</svg>
					게시물 작성
				</h1>
				<p>&nbsp;&nbsp;커뮤니티 게시물을 작성할 수 있습니다</p>
			</div>
			
			<form id="userBoard" enctype="multipart/form-data">
				
				<table>
					<tr>
						<td>제목</td>
						<td><label for = "title"></label><input type="text" name="title" placeholder="제목" id="title"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="user_id"  id="user_id" value="${session.uid}" readonly></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select name = "cotegory">
								<c:forEach var="codeList" items="${codeList }">
									<option value="${codeList.code_cd }">${codeList.code_name }</option>
								</c:forEach>
							</select>
						</td>
					</tr>

					<tr>
						<td>내용</td>
						<td><textarea placeholder="내용을 입력하세요" name="contents" id="contents"></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="fileUpload" id="file"></td>
					</tr>
				</table><hr>
				<button type = "button" id="submitBtn">등록하기</button>
				<button type = "button" id="backBtn">뒤로가기</button>						
		</form>
		</div>
	</div>
	
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
</body>
</html>
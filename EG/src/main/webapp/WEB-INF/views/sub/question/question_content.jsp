<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="qa_content">
			<div class="qa_page" id="question">

				<strong class="qa_tit">문의입력</strong>

				<div class="qa_tbl_content help_tbl_style01">
					<table>
						<caption>상담 문의입력</caption>
						<colgroup>
							<col style="width: 18%">
							<col style="width: 37%">
							<col style="width: 45%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">문의유형</th>
								<td id="inquiry_name"></td>
								<th scope="row">닉네임</th>
								<td><span id="longinNickname"></span></td>
							</tr>
							<tr class="" id="sessionlogin">
								<th scope="row">ID</th>
								<td><span id="longinid"></span></td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3"><input type="text" style="width: 100%"
									class="input_st" id="inquiry_ctitle"></td>
							</tr>
							<tr id="inquirytrText">
								<th>내용</th>
								<td colspan="3"><textarea class="input_st"
										id="inquiry_receptionform"
										style="width: 95%; height: 150px; resize: none"></textarea></td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">
									<div class="file_del_list_new clfix">
										<div id="fileList" title="첨부파일 목록" class="list_add"></div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
	
</body>
</html>
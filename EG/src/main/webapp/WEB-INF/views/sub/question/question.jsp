<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EG 고객센터 문의</title>
<link rel="stylesheet" type="text/css" href="../../../css/board.css" />
</head>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<body>
	<div id="qa_wrapper" class="clfix">
		<div class="qa_nav">
			<ul>
				<li id="qa_menu_li" class="qa_menu_on"><a class="qa_on"><strong>1대1문의</strong></a></li>
				<li id="qa_menu_li"><a onclick="location.href='help_answering.jsp'"><strong>답변중</strong></a>
				</li>
				<li id="qa_menu_li"><a onclick="location.href='help_answer.jsp'"><strong>답변완료</strong></a>
				</li>
			</ul>
		</div>
		<div class="qa_section">
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
							<tr id="inquiry_addictional_mobile" class="nexon-hide">
								<th scope="row">휴대폰</th>
								<td colspan="3"><select id="inquiry_addictional_mobile1"
									title="휴대번호 앞자리를 선택해주세요" style="width: 100px" class="select_st">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select>&nbsp;-&nbsp; <input id="inquiry_addictional_mobile2"
									type="text" title="휴대전화 가운데자리 입력" style="width: 90px"
									class="input_st">&nbsp;-&nbsp; <input
									id="inquiry_addictional_mobile3" type="text"
									title="휴대전화 마지막 입력" style="width: 90px" class="input_st">
								</td>
							</tr>
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">
									<div class="file_sch">
										<input type="text" style="width: 300px" class="input_st">
										<input type="file" style="width: 100%" class="input_st"
											id="my_file" name="my_file" multiple="multiple"
											accept=".gif, .jpeg, .jpg, .png, .bmp, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .csv, .html, .htm, .7z, .zip, .pdf, .txt, .hwp"
											onchange="readURL(this);"> <img id="bt_fileImage"
											src="../../../img/board/btn_help_filesch.gif" alt="첨부파일 찾아보기"
											align="right">
									</div>
									<div class="file_del_list_new clfix">
										<div id="fileList" title="첨부파일 목록" class="list_add"></div>
										<a title="첨부파일 삭제" id="fileDelete" onclick="remove_file();">
											<img src="../../../img/board/btn_help_del.gif" alt="파일삭제"
											align="right">
										</a>

									</div>
									<p class="n_txt" style="padding-top: 10px;">
										<span>※</span> [1:1문의하기]의 첨부파일을 통해 개인정보 서류를 접수하지 않습니다. <br>
										첨부 파일은 게임관련 오류 및 신고 이미지만 접수 가능합니다.(<b id="filesize">0MB</b>/최대
										30MB)
									</p>
								</td>
							</tr>
							<tr id="inquiry_email" class="send-answer-notice">
								<th scope="row" rowspan="2" style="display: table-cell;">알림받기</th>
								<td colspan="3">
									<div class="n_txt" style="display: inline-block; width: 240px;">
										<span name="renameText" id="reWriteEmailText"> ※ 답변 등록
											시 이메일로 발송해 드립니다. </span>
									</div>
									<div class="alarm_bx">
										<span class="checkbox_st1"> <input type="checkbox"
											id="inquiry_email_send"> <label
											for="inquiry_email_send"> <span name="nameText"
												id="spEmail">(선택) 이메일 수집 및 이용 동의</span>
										</label>
										</span> <br> <br> <input type="text" title="이메일주소를 적어주세요"
											style="width: 120px" class="input_st" id="inquiry_email1">
										&nbsp;@ &nbsp; <input type="text" title="이메일 뒷자리를 선택해주세요"
											style="width: 140px; height: 32px; display: none;"
											class="input_st" id="inquiry_email2"> <select
											style="width: 140px" class="select_st" id="select_st">
											<option>선택하세요</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
										</select> <span class="checkbox_st cb_w02"> <input
											type="checkbox" id="inquiry_email_etc"> <label
											for="inquiry_email_etc">직접입력</label>
										</span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_zone">
					<a> 
						<img src="../../../img/board/bt_question.png">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../../../controller/js/board/board.js"></script>
	
</body>
</html>

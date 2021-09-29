<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EG 고객센터 문의</title>
<link rel="stylesheet" type="text/css" href="resources/css/board.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#submitBtn").on("click",function(){
		
		
		var formData = new FormData($('#centerBoard')[0]);
		var email= "";
		for (var item of formData.entries()) {

		   
		    if(item[0]=="email_first"){
		    	email = item[1] + "@"
		    }
		    
		    else if(item[0]=="email_end"){
		    	email = email + item[1] 
		    }
		}
		
		formData.append("email",email);
		
		for (var itemReal of formData.entries()) {
		    console.log(itemReal[0] + " : " + itemReal[1]);
		}
	
		$.ajax({
			type: "POST" ,
			url:  "/EG/centerBoardInsert" ,
			enctype: 'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false, 
			success: function(data){
				opener.parent.gotoBack();
				window.close();
			}
		});	
		
	})
});

</script>

</head>
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<body>
	<div id="qa_wrapper" class="clfix">
		<div class="qa_nav">
			<ul>
				<li id="qa_menu_li" class="qa_menu_on"><a class="qa_on"><strong>1대1문의</strong></a></li>
				<li id="qa_menu_li"><a onclick="location.href='/EG/centerBoardAnsweringList'"><strong>답변중</strong></a>
				</li>
				<li id="qa_menu_li"><a onclick="location.href='/EG/centerBoardAnswerList'"><strong>답변완료</strong></a>
				</li>
			</ul>
		</div>
		
		<div class="qa_section">
			<div class="qa_page" id="question">

				<strong class="qa_tit">문의입력</strong>

				<div class="qa_tbl_content help_tbl_style01">
				<form id="centerBoard" enctype="multipart/form-data">
					<table>
						<caption>상담 문의입력</caption>
						<colgroup>
							<col style="width: 17%">
							<col style="width: 33%">
							<col style="width: 16%">
							<col style="width: 34%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">문의유형</th>
								<td colspan="3">
									<select id="cotegory" required style="width: 250px" class="select_st" title="문의 유형을 선택하세요." name="cotegory">
										<option value="B0004">아이디정보/보안</option>
										<option value="B0005">게임문의</option>
										<option value="B0006">오류 및 복구</option>
									</select>
								</td>
							</tr>
							<tr class="" id="sessionlogin">
								<th scope="row">ID</th>
								<td><input type="text" style="width: 100%"
									class="input_st" id="user_id" name="user_id" value="winbo121" readonly></td>
<!-- 								<th scope="row">닉네임</th> -->
<!-- 								<td><span id="longinNickname"></span></td> -->
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3"><input type="text" style="width: 100%"
									class="input_st" id="title" name="title"></td>
							</tr>
							<tr id="inquirytrText">
								<th>내용</th>
								<td colspan="3"><textarea class="input_st"
										id="contents" name="contents"
										style="width: 95%; height: 150px; resize: none"></textarea></td>
							</tr>
<!-- 							<tr id="inquiry_addictional_mobile" class="nexon-hide"> -->
<!-- 								<th scope="row">휴대폰</th> -->
<!-- 								<td colspan="3"><select id="inquiry_addictional_mobile1" -->
<!-- 									title="휴대번호 앞자리를 선택해주세요" style="width: 100px" class="select_st"> -->
<!-- 										<option value="010">010</option> -->
<!-- 										<option value="011">011</option> -->
<!-- 										<option value="016">016</option> -->
<!-- 										<option value="017">017</option> -->
<!-- 										<option value="018">018</option> -->
<!-- 										<option value="019">019</option> -->
<!-- 								</select>&nbsp;-&nbsp; <input id="inquiry_addictional_mobile2" -->
<!-- 									type="text" title="휴대전화 가운데자리 입력" style="width: 90px" -->
<!-- 									class="input_st">&nbsp;-&nbsp; <input -->
<!-- 									id="inquiry_addictional_mobile3" type="text" -->
<!-- 									title="휴대전화 마지막 입력" style="width: 90px" class="input_st"> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<tr>
								<th scope="row">첨부파일</th>
								<td colspan="3">

										<input type="file"  name="fileUpload" >
<!-- 											 <img id="bt_fileImage" -->
<!-- 											src="resources/img/board/btn_help_filesch.gif" alt="첨부파일 찾아보기" -->
<!-- 											align="right"> -->

<!-- 									<div class="file_del_list_new clfix"> -->
<!-- 										<div id="fileList" title="첨부파일 목록" class="list_add"></div> -->
<!-- 										<a title="첨부파일 삭제" id="fileDelete" onclick="remove_file();"> -->
<!-- 											<img src="resources/img/board/btn_help_del.gif" alt="파일삭제" -->
<!-- 											align="right"> -->
<!-- 										</a> -->

<!-- 									</div> -->
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
<!-- 										<span class="checkbox_st1"> <input type="checkbox" -->
<!-- 											id="inquiry_email_send"> <label -->
<!-- 											for="inquiry_email_send"> <span name="nameText" -->
<!-- 												id="spEmail">(선택) 이메일 수집 및 이용 동의</span> -->
<!-- 										</label> -->
<!-- 										</span> <br> <br>  -->
										<input type="text" title="이메일주소를 적어주세요"
											style="width: 120px" class="input_st" id="email_first" name="email_first">
										&nbsp;@ &nbsp; <select
											style="width: 140px" class="select_st" id="email_end" name="email_end">
											<option>선택하세요</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="gmail.com">gmail.com</option>
										</select> 
<!-- 										<span class="checkbox_st cb_w02"> <input -->
<!-- 											type="checkbox" id="inquiry_email_etc"> <label -->
<!-- 											for="inquiry_email_etc">직접입력</label> -->
<!-- 										</span> -->
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				
				<div class="btn_zone">
					<a href="javascript:void(0);" id="submitBtn"> 
						<img src="resources/img/board/bt_question.png">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/controller/js/board/board.js"></script>
	
</body>
</html>

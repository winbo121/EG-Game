<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>공지사항</title>
<div id="wrapper">
	<div id="contents" class="notice">
		<h1>공지사항</h1>
		<div class="noticeList">
			<!-- summary 속성은 현재 테이블이 갖고 있는 내용을 요약한 부분으로 어떤 내용이 담겨있는지 간략하게 알려줄 수 있다 -->
			<table summary="EG공통공지 목록">
				<caption>EG공통공지</caption>
				<colgroup>
					<col class="cate">
					<col class="tit">
					<col class="date">
					<col class="count">
				</colgroup>
				<thead>
					<tr>
						<th class="cate">카테고리</th>
						<th class="tit">제목</th>
						<th class="date">등록일</th>
						<th class="count">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="cate">[공지]</td>
						<td class="tit"><a>정기점검 안내</a></td>
						<td class="date">등록일</td>
						<td class="count">조회수 <span class="icon"></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<a class="btFirst">
				<span class="icon"></span> 
				<span class="acchidden">첫 페이지</span></a> 
				<a href="#" class="btPrev">
				<span class="icon"></span> 
				<span class="acchidden">이전 페이지</span>
			</a> 
			<span class="paginationNum"><strong> 
				<span>1</span>
			</strong> 
				<a>2</a> 
			</span> 
			<a class="btNext"> 
				<span class="icon"></span>
				<span class="acchidden">다음 페이지</span>
			</a> 
			<a class="btEnd"> 
				<span class="icon"></span> 
				<span class="acchidden">끝 페이지</span>
			</a>
		</div>
	</div>
	<div class="footer">
		<p class="copyright">© EG games Corporation All Rights Reserved.</p>
	</div>
</div>

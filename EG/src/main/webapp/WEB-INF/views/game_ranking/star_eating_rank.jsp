<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<div id="wrapper">
	<div id="contents" class="ranking">
		<h1>Star eat</h1>
		<div class="rankList">
			<!-- summary 속성은 현재 테이블이 갖고 있는 내용을 요약한 부분으로 어떤 내용이 담겨있는지 간략하게 알려줄 수 있다 -->
			<table summary="EG 게임순위 목록">
				<caption>EG 게임순위</caption>
				<colgroup>
					<col class="rank">
					<col class="nickname">
					<col class="score">
					<col class="date">
				</colgroup>
				<thead>
					<tr>
						<th class="rank">순위</th>
						<th class="nickname">닉네임</th>
						<th class="score">점수</th>
						<th class="date">등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="rank">[순위]</td>
						<td class="nickname"><a>닉네임</a></td>
						<td class="score">점수</td>
						<td class="date">등록일 <span class="icon"></span>
						</td>
					</tr>
					<tr>
						<td class="rank">[순위]</td>
						<td class="nickname"><a>닉네임</a></td>
						<td class="score">점수</td>
						<td class="date">등록일 <span class="icon"></span>
						</td>
					</tr>
					<tr>
						<td class="rank">[순위]</td>
						<td class="nickname"><a>닉네임</a></td>
						<td class="score">점수</td>
						<td class="date">등록일 <span class="icon"></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
</div>
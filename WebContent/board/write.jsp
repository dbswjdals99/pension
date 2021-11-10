<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<style>
#section {
	width: 1000px;
	height: 700px;
	margin: auto;
}

	#content_text {
	position:relative;
	top:-380px;
	left:-600px;
	color:white;
	font-size:150px;
	text-shadow:4px 4px 0px gray;
	}
	
	#content {
	width: 2100;
	height: 400px;
	margin-bottom: 50px;
	position:relative;
	}

.table th, .table td {
	border: 1px solid silver;
	padding: 15px;
	border-right: none;
	border-left: none;
	color: gray;
}

.table td {
	text-align: center;
}

input[type=submit] {
	width: 412px;
	height: 52px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 18px;
	background: black;
	color: white;
	margin-bottom: 10px;
}

input[type=text] {
	width: 800px;
	height: 30px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
}

textarea {
	width: 800px;
	height: 100px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
}
</style>

<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Write </div>
</div>
<div id="section">
	<form method="post" action="write_ok.jsp">
		<table width="1000" align="center" class="table">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="80" rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="sung" value="0">남자 <input
					type="radio" name="sung" value="1">여자 <input type="radio"
					name="sung" value="2">선택안함</td>
			</tr>
			<tr>
				<td>생일</td>
				<td><select name="year">
						<c:forEach begin="0" end="100" var="i">
							<option value="${2021-i}">${2021-i}</option>
						</c:forEach>
				</select> <select name="month">
						<c:forEach begin="1" end="12" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select> <select name="day">
						<c:forEach begin="1" end="31" var="i">
							<option value="${i}">${i}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type="checkbox" name="hobby" value="0">낚시 <input
					type="checkbox" name="hobby" value="1">여행 <input
					type="checkbox" name="hobby" value="2">운동 <input
					type="checkbox" name="hobby" value="3">독서 <input
					type="checkbox" name="hobby" value="4">음악</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pwd" placeholder="비밀번호를 입력해주세요."></td>
			</tr>
			<tr>
				<td>비밀글</td>
				<td><input type="checkbox" name="bimil" value="1"> 비밀글일
					경우 체크하세요.</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글작성">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>
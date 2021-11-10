<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ page import="pension.board.BoardDao" %>
<%@ page import="pension.board.BoardDto" %>
<%
	// 하나의 레코드를 읽어와서 폼에 출력하기
	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.update(request);
	request.setAttribute("bdto", bdto);
	request.setAttribute("page", request.getParameter("page"));
%> 
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

	input[type=text],input[type=password]{
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
	
	.content_bold{
	font-weight:bold;
	background:#f2f2f2;
	}
	
</style>
<script>
	window.onload = function()
	{
		// radio
		document.pkc.sung[${bdto.sung}].checked="true";
		
		// checkbox -> 1,2,3, -> split(",") -> 배열
		var hobby = "${bdto.hobby}".split(",");
		
		for (i=0; i<hobby.length-1; i++)
		{
			document.pkc.hobby[hobby[i]].checked = true;		
		}
		
		// select -> selectedIndex , value
		var birth = "${bdto.birth}".split("-");
		
		document.pkc.year.value = birth[0];
		document.pkc.month.value = parseInt(birth[1]);
		document.pkc.day.value = parseInt(birth[2]);
		
		// 비밀글
		<c:if test="${bdto.bimil == 1}">
		document.pkc.bimil.checked = true;
		</c:if>
	}
</script>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Update </div>
</div>
<div id="section">
	<form name="pkc" method="post" action="update_ok.jsp">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="id" value="${bdto.id}">
		<table width="1000" align="center" class="table">
			<tr>
				<td class="content_bold">제목</td>
				<td><input type="text" name="title" value="${bdto.title}"></td>
			</tr>
			<tr>
				<td class="content_bold">작성자</td>
				<td><input type="text" name="name" value="${bdto.name}"></td>
			</tr>
			<tr>
				<td class="content_bold">내용</td>
				<td><textarea cols="80" rows="5" name="content">${bdto.content}</textarea></td>
			</tr>
			<tr>
				<td class="content_bold">성별</td>
				<td><input type="radio" name="sung" value="0">남자 <input
					type="radio" name="sung" value="1">여자 <input type="radio"
					name="sung" value="2">선택안함</td>
			</tr>
			<tr>
				<td class="content_bold" >생일</td>
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
				<td class="content_bold">취미</td>
				<td><input type="checkbox" name="hobby" value="0">낚시 <input
					type="checkbox" name="hobby" value="1">여행 <input
					type="checkbox" name="hobby" value="2">운동 <input
					type="checkbox" name="hobby" value="3">독서 <input
					type="checkbox" name="hobby" value="4">음악</td>
			</tr>
			<tr>
				<td class="content_bold">비밀글</td>
				<td><input type="checkbox" name="bimil" value="1"> 비밀글일
					경우 체크하세요.</td>
			</tr>
			<tr>
				<td class="content_bold">비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글수정하기">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>
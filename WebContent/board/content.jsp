<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pension.board.BoardDao"%>
<%@ page import="pension.board.BoardDto"%>
<%
	BoardDao bdao = new BoardDao();
	BoardDto bdto = bdao.content(request);
	request.setAttribute("bdto", bdto);
	request.setAttribute("page", request.getParameter("page"));
%>
<%@ include file="../top.jsp"%>
<style>
	#section {
	width: 1000px;
	height: 600px;
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

	.table a {
	text-decoration: none;
	cursor: pointer;
	color: gray;
	}

	.table a:hover {
	opacity: 0.4;
	color:tomato;
	}

	.table th {
	border-top: 2px solid silver;
	border-bottom: 2px solid silver;
	}
	
	.right{
	text-align:right;
	}
	
	td{
	text-align:center;
	}
	
	#border_top{
	border-top:none;
	font-size:18px;
	font-weight:bold;
	padding-bottom:50px;
	text-align:left;
	}
	
	.padding{
	text-align:left;
	padding:20px;
	}
	
	#del{
	visibility:hidden;
	position:absolute;
	background:white;
	width:270px;
	height:40px;
	padding-top:5px;
	border:1px solid silver;
	}
	
	#del > #deleted > input[type=password]{
	width:200px;
	height:30px;
	border:none;
	}
	
	#del > #deleted > input[type=submit]{
	width:50px;
	height:35px;
	border:none;
	background:black;
	color:white;
	font-weight:bold;
	cursor:pointer;
	}
	
	.content_bold{
	font-weight:bold;
	background:#f2f2f2;
	}
	
	
</style>
<script>
	function del(id)
	{
		document.deleted.id.value = id;
		document.getElementById("del").style.visibility="visible";
		
		var x = event.pageX;
		var y = event.pageY;
		
		document.getElementById("del").style.left = (x + 50) + "px";
		document.getElementById("del").style.top = (y + -22) + "px";
	}
</script>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Content </div>
</div>
<div id="section">
	<table width="1000" align="center" class="table">
		<tr>
			<td id="border_top" colspan="3">
				<a href="list.jsp?page=${page}" class="padding">목록가기</a> <a>|</a>
				<a href="update.jsp?page=${page}&id=${bdto.id}" class="padding">수정하기</a> <a>|</a>
				<a href="#" class="padding" onclick="del()">삭제하기</a>
			</td>
		</tr>
		<tr>
			<td class="content_bold">작성자</td>
			<td>${bdto.name}</td>
			<td class="right">작성일 : ${bdto.writeday}</td>
		</tr>
		<tr>
			<td class="content_bold">제목</td>
			<td>${bdto.title}</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="content_bold">내용</td>
			<td>${bdto.content}</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="content_bold">생일</td>
			<td>${bdto.birth}</td>
			<td class="right">조회수 : ${bdto.readnum}</td>
		</tr>
		<tr>
			<td class="content_bold">취미</td>
			<td>${bdto.hobby}</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</div>
<div id="del" align="center">
<form method="post" action="delete.jsp?id=${bdto.id}&page=${page}" name="deleted" id="deleted">
	<input type="password" name="pwd" placeholder="비밀번호">
	<input type="submit" value="확인">
</form>
</div>
<%@ include file="../bottom.jsp"%>
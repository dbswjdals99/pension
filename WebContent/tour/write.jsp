<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%
	if(session.getAttribute("userid") == null)
	{
		response.sendRedirect("../login/login.jsp");
	}
%>
<style>
	#section {
	width:1000px;
	height:600px;
	margin:auto;
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var size = 1;
	
	function add()
	{
		size++;
		var img = document.getElementById("image");
		var inner = "<p class='fname'><input type='file' name='fname"+size+"'></p>"
		img.innerHTML = img.innerHTML + inner;
	}
	
	function del()
	{	
		if (size > 1)
		{
		$(".fname").eq(size - 1).remove();
		size--;
		}
	}
</script>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Write </div>
</div>
<div id="section">
<form method="post" action="write_ok.jsp" enctype="multipart/form-data">
	<table width="1000" align="center" class="table">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="40" rows="7" name="content"></textarea></td>
		</tr>
		<tr>
			<td>사진</td>
			<td id="image">
				<input type="button" onclick="add()" value="사진추가">
				<input type="button" onclick="del()" value="사진삭제">
				<p class="fname"><input type="file" name="fname1"></p>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="저장하기"></td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>
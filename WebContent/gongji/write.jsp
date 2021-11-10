<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>

   	#section {width:1000px;height:600px;margin:auto;}
   	input[type=text]{width:400px;height:40px;border:1px solid silver;font-size:17px;color:black;padding:5px; margin-bottom:10px;}
	input[type=submit]{width:412px; height:52px; border:1px solid silver; cursor:pointer; font-size:18px; background:black; color:white; margin-bottom:10px;}
   	textarea{width:400px;height:200px;border:1px solid silver;font-size:17px;color:black;padding:5px; margin-bottom:10px;}
	h2{margin-top:150px;}
	
	.content_text {
	position:relative;
	top:-380px;
	left:-600px;
	color:white;
	font-size:150px;
	text-shadow:4px 4px 0px gray;
	}
	
	.content {
	width: 2100;
	height: 400px;
	margin-bottom: 50px;
	position:relative;
	}
	
</style>

<div class="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div class="content_text"> Notice </div>
</div>
<div id="section">
<div id="tt" align="center"><h2>공지사항</h2>
	<form method="post" action="write_ok.jsp">
		<input type="text" name="title" placeholder="제목을 입력하세요."><p>
		<textarea cols="40" rows="6" name="content" placeholder="내용을 입력하세요."></textarea> <p>
		<input type="submit" value="공지사항 저장">			
  	</form>
</div>
</div>
<%@ include file="../bottom.jsp"%>
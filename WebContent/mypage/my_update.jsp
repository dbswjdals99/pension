<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>  
<%@page import="pension.member.MemberDao" %>
<%@page import="pension.member.MemberDto" %>    
<%
     // 하나의 레코드를 읽어와서 폼태그에 넣기
     MemberDao mdao = new MemberDao();
     MemberDto mdto = mdao.mypage(session);
     
     request.setAttribute("mdto", mdto);
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
	background:#f2f2f2;
	font-weight:bold;
	}
	
	#pwd_chg{
	display:none;
	}
	
	.padding{
	font-weight:bold;
	font-size:18px;
	padding:20px;
	}
	
	#tdpadding{
	padding:20px;
	padding-bottom:50px;
	border-top:none;
	}
	
	input[type=submit] {
	width: 400px;
	height: 42px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 18px;
	background: black;
	color: white;
	margin-bottom: 10px;
	}

	input[type=text] {
	width: 400px;
	height: 30px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
	}
	
	#submit_right{
	text-align:center;
	border-bottom:none;
	}
	
	
	
</style>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Update </div>
</div>
<div id="section">
<form method="post" action="my_update_ok.jsp">
	<table class="table" align="center" width="700">
	<input type="hidden" name="id" value="${mdto.id}">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" value="${mdto.name}"></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userid" value="${mdto.userid}"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${mdto.email}"></td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><input type="text" name="phone" value="${mdto.phone}"></td>
		</tr>
		<tr>
			<td colspan="2" id="submit_right"><input type="submit" value="수정하기"></td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<%@ page import="pension.member.MemberDao" %>
<style>
	#section {
	width:1000px;
	height:450px;
	margin:auto;
	}
	
	#font{
	margin-top:200px;
	font-size:28px;
	}
	
	.pwd_gori{
	color:black;
	text-decoration:none;
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
</style>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Change </div>
</div>
<div id="section">
<div id="font" align="center">
  <h2> 비밀번호가 변경되었습니다! </h2>
  <div>로그인 하시겠습니까?</div>
  <br>
  <div><a href="../login/login.jsp" class="pwd_gori">예</a> <a class="pwd_gori">|</a> <a href="../main/index.jsp" class="pwd_gori">아니오</a></div>
</div>
</div>
<%@ include file="../bottom.jsp"%>
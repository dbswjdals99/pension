<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pension.gongji.GongjiDao"%>
<%@ page import="pension.gongji.GongjiDto"%>
<%
	GongjiDao gdao = new GongjiDao();
	GongjiDto gdto = gdao.content(request);

	request.setAttribute("gdto", gdto);
%>
<%@ include file="../top.jsp"%>
<style>
	#section {
	width: 1000px;
	height: 600px;
	margin: auto;
	}
	
	.table th, .table td {
	border: 1px solid silver;
	padding: 20px;
	border-right: none;
	border-left: none;
	color: gray;
	}
	
	.center {
	text-align: center;
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

	#left {
	text-align:left;
	font-weight:bold;
	}

	.right {
	text-align:right;
	}
</style>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Content </div>
</div>
<div id="section">
	<table width="1000" align="center" class="table">
		<tr>
			<td id="left">${gdto.title}</td>
			<td class="right">${gdto.writeday}</td>
			<td class="right">${gdto.readnum}명</td>
		</tr>
		<tr>
			<td colspan="3" id="center">${gdto.content}</td>
		</tr>
	</table>
</div>

<%@ include file="../bottom.jsp"%>
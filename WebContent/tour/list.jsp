<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="pension.tour.TourDao" %>
<%@ page import="pension.tour.TourDto" %>
<%
	TourDao tdao = new TourDao();
	ArrayList<TourDto> list = tdao.list();
	
	request.setAttribute("list", list);
%>
<%@ include file="../top.jsp"%>    
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

	.table a:hover {
	opacity: 0.4;
	}

	.table th {
	border-top: 2px solid silver;
	border-bottom: 2px solid silver;
	}
	
	.table td {
	text-align:center;
	}
	
	.table{
	margin-bottom:20px;
	}
	
	th{
	font-weight:bold;
	background:#f2f2f2;
	}
	
	.table a{
	color:gray;
	text-decoration:none;
	cursor:pointer;
	}
	
	.padding{
	padding:20px;
	border-top:none;
	font-weight:bold;
	font-size:18px;
	}
	
	.table .text_left{
	text-align:left;
	border:none;
	padding-bottom:50px;
	}
	
</style>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Review </div>
</div>
<div id="section">
	<table width="1000" align="center" class="table">
		<c:if test="${userid != null }">
		<tr>
			<td class="text_left"><a href="write.jsp" class="padding">글쓰기</a></td>
		</tr>
		</c:if>
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list}" var="tdto">
		<tr>
			<td>${tdto.name}</td>
			<td><a href="content.jsp?id=${tdto.id}">${tdto.title}</a></td>
			<td>${tdto.writeday}</td>
		</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
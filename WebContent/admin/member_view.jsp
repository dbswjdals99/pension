<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
	#section {
	width:1000px;
	height:600px;
	margin:auto;
	}
	
	.table th, .table td {
	border: 1px solid silver;
	padding: 15px;
	border-right: none;
	border-left: none;
	color: gray;
	}
	
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
	
	#section #mem{
	width:100px;
	height:20px;
	padding-bottom:2px;
	text-align:center;
	border:1px solid silver;
	display:inline-block;
	}
</style>
 <div class="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div class="content_text"> Admin </div>
</div>
<div id="section">
<%@ page import="pension.member.MemberDao" %>
<%
	MemberDao mdao = new MemberDao();
	request.setAttribute("list", mdao.getmember());
%>
	<table class="table" width="1000">
		<tr>
			<td>이름</td>
			<td>아이디</td>
			<td>email</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>상태</td>
		</tr>
		<c:forEach var="mdto" items="${list}">
		<tr>
			<td>${mdto.name}</td>
			<td>${mdto.userid}</td>
			<td>${mdto.email}</td>
			<td>${mdto.phone}</td>
			<td>${mdto.writeday}</td>
			<td>
				<c:if test="${mdto.status == 0}">
					<span id="mem">정상회원</span>
				</c:if>
				<c:if test="${mdto.status == 1}">
					<span id="mem" onclick="location='member_chg.jsp?id=${mdto.id}'" style="color:blue;">탈퇴신청회원</span>
				</c:if>
				<c:if test="${mdto.status == 2}">
					<span id="mem" style="color:tomato;">탈퇴회원</span>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
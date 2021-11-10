<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>  
<%@page import="pension.member.MemberDao" %>
<%@page import="pension.member.MemberDto" %>    
<%
     // 하나의 레코드를 읽어와서 폼태그에 넣기
     MemberDao mdao = new MemberDao();
     MemberDto mdto = mdao.mypage(session);
     
     request.setAttribute("chk", request.getParameter("chk"));
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
	width: 100px;
	height: 42px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 18px;
	background: black;
	color: white;
	margin-bottom: 10px;
	}

	input[type=text] {
	width: 250px;
	height: 30px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
	}
	
	#pwdfont{
	font-weight:bold;
	color:tomato;
	font-size:18px;
	}
	
	#pwdfont_td{
	border-bottom:none;
	}
	
	
</style>
<script>
	function pwd_change()
	{
		document.getElementById("pwd_chg").style.display="table-row";
	}
</script>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Mypage </div>
</div>
<div id="section">
	<table class="table" align="center" width="600">
		<tr>
			<td colspan="2" id="tdpadding"><a href="my_update.jsp" class="padding">정보수정</a>
			<a class="padding">|</a>
			<a href="javascript:pwd_change()" class="padding">비밀번호 변경</a></td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mdto.name}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${mdto.userid}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${mdto.email}</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td>${mdto.phone}</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>${mdto.writeday}</td>
		</tr>
		<tr>
			<td colspan="2" id="pwdfont_td">
				<c:if test="${chk == 1}">
					<div id="pwdfont"> 비밀번호가 기존과 동일합니다. 다시입력해주세요.</div>
				</c:if>
				<c:if test="${chk == 2}">
					<div id="pwdfont"> 비밀번호는 필수입력입니다. </div>
				</c:if>
			</td>
		</tr>
		<tr id="pwd_chg">
			<td colspan="2" align="center">
				<form method="post" action="pwd_change.jsp?id=${mdto.id}">
					<input type="text" name="pwd" placeholder="변경할 비밀번호를 입력해주세요."><br><br>
					<input type="submit" value="변경하기">
				</form>
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
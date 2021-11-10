<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.tour.TourDao" %>
<%@ page import="pension.tour.TourDto" %>
<%
	// 하나의 레코드를 읽어와서 출력
	TourDao tdao = new TourDao();
	TourDto tdto = tdao.content(request);
	
	request.setAttribute("tdto", tdto);
%>
<%@ include file="../top.jsp"%>    
<style>
	#section {
	width:1000px;
	height:1000px;
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
	
	.table th{
	background:#f2f2f2;
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
	
	#img_layer{
	position:absolute;
	left:1420px;
	top:470px;
	visibility:hidden;
	width:500px;
	height:350px;
	}
</style>
<script>
	function img_view(src)
	{
		// 클릭한 그림을 크게 보여준다 -> 레이어를 통해서
		document.getElementById("tour").src=src;
		document.getElementById("tour").style.visibility="visible";
	}
	
	function img_hide()
	{
		document.getElementById("tour").style.visibility="hidden";
	}
</script>
<div id="img_layer">
	<img id="tour" width="480" height="340" onclick="img_hide()">
</div>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Content </div>
</div>
<div id="section">
	<table width="1010" align="center" class="table">
		<tr>
			<td colspan="2" class="text_left">
				<a href="list.jsp" class="padding">목록가기</a>
				<!-- 현재 로그인한 사람과 글의 작성자가 같을 경우 -->
				<c:if test="${userid == tdto.userid}">
					<a> |</a>
					<a href="update.jsp?id=${tdto.id}" class="padding">수정하기</a><a> |</a>
					<a href="delete.jsp?id=${tdto.id}" class="padding">삭제하기</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${tdto.title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${tdto.content}</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				<c:forEach items="${tdto.fname2}" var="fname">
					<c:if test="${fname != ''}">
						<img src="img/${fname}" width="300" height="300" onclick="img_view(this.src)">
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${tdto.writeday}</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
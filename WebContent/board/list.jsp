<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ page import="pension.board.BoardDao" %>
<%@ page import="pension.board.BoardDto" %>
<%@ page import="pension.board.Number" %>
<%@ page import="java.util.ArrayList" %>
<!-- page, pstart, pend, chong, list -->
<%
	BoardDao bdao=new BoardDao();
	ArrayList<BoardDto> list = bdao.list(request);
	Number num = bdao.getnumber(request);
	
	request.setAttribute("list", list);
	request.setAttribute("num", num);
%>    
<style>
	#section{
	width:1000px;
	height:850px;
	margin:auto;
	}
	
	#content_text {
	position:relative;
	top:-380px;
	left:-500px;
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
	
	.page_color {
	color:gray; 
	padding:15px; 
	text-decoration:none;
	}
	
	.page_color:hover {
	opacity:0.4;
	}
	
	#readnum {
	text-decoration:none;
	color:gray;
	}
	
	#bimil_content {
	text-decoration:none;
	color:tomato;
	}
	
	#readnum:hover {
	color:tomato;
	opacity:0.4;
	}
	
	#bimil_pwd{
	visibility:hidden;
	position:absolute;
	background:white;
	width:270px;
	height:40px;
	padding-top:5px;
	border:1px solid silver;
	}
	
	#bimil_pwd > #bimil > input[type=password]{
	width:200px;
	height:30px;
	border:none;
	}
	
	#bimil_pwd > #bimil > input[type=submit]{
	width:50px;
	height:35px;
	border:none;
	background:black;
	color:white;
	font-weight:bold;
	cursor:pointer;
	}
	
	#border_top{
	border-top:none;
	font-size:18px;
	font-weight:bold;
	padding-bottom:50px;
	text-align:left;
	}
	
	#list_padding_top{
	padding-top:50px;
	}
	
	th{
	font-weight:bold;
	background:#f2f2f2;
	}
	
	input:focus {outline:none;}
	
</style>
<script>
	function bimil_open(id)
	{
		document.bimil.id.value = id;
		document.getElementById("bimil_pwd").style.visibility="visible";
		
		// 사용자가 클릭한 위치에 가까운 곳으로 이동
		var x = event.pageX;
		var y = event.pageY;
		
		document.getElementById("bimil_pwd").style.left = (x + 50) + "px";
		document.getElementById("bimil_pwd").style.top = (y + -22) + "px";
	}
</script>
<div id="bimil_pwd" align="center">
<form method="post" action="bimil_check.jsp" name="bimil" id="bimil">
	<input type="hidden" name="id">
	<input type="hidden" name="page" value="${num.page}">
	<input type="password" name="pwd" placeholder="비밀번호">
	<input type="submit" value="확인">
</form>
</div>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Community </div>
</div>
<div id="section">
	<table width="1000" align="center" class="table">
		<tr>
			<td id="border_top"><a class="page_color" href="write.jsp"> 게시판 글쓰기 </a></td>
		</tr>
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list}" var="bdto">
			<tr>
				<td>
					<c:if test="${bdto.bimil == 0}">
						<a href="readnum.jsp?id=${bdto.id}&page=${num.page}" id="readnum">${bdto.title}</a>
					</c:if>
					<c:if test="${bdto.bimil == 1}">
						<a href="#" onclick="bimil_open(${bdto.id})" id="bimil_content">${bdto.title}</a>
					</c:if>
				</td>
				<td>${bdto.name}</td>
				<td>${bdto.readnum}명</td>
				<td>${bdto.writeday}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center" id="list_padding_top">
			<!-- 처음페이지로 이동 -->
				<a class="page_color" href="list.jsp">First</a>
		
			<!-- 10페이지 이전 -->
				<c:if test="${num.pstart != 1}">
					<a class="page_color" href="list.jsp?page=${num.pstart-1}">◀◀</a>
				</c:if>
				<c:if test="${num.pstart == 1}">
					<a class="page_color">◀◀</a>
				</c:if>
	
			<!-- 현제페이지 이전 -->
				<c:if test="${num.page != 1}">
					<a class="page_color" href="list.jsp?page=${num.page-1}">◀</a>
				</c:if>
				<c:if test="${num.page == 1}">
					<a class="page_color">◀</a>
				</c:if>
		
			<!-- 현제페이지 -->	
     			<c:forEach begin="${num.pstart}" end="${num.pend}" var="i">
					
			<!-- 현재페이지와 출력되는페이지인 i와 비교 -->
			        <c:set var="str" value=""/>
			        <c:if test="${num.page == i}">
			        	<c:set var="str" value="style='color:tomato'"/>   
			        </c:if>
			        <a class="page_color" href="list.jsp?page=${i}" ${str}> ${i} </a>
				</c:forEach>
		
			<!-- 현제페이지 다음 -->
				<c:if test="${num.page != num.chong}">
					<a class="page_color" href="list.jsp?page=${num.page+1}">▶</a>
				</c:if>
				<c:if test="${num.page == num.chong}">
					<a class="page_color">▶</a>
				</c:if>
		
		
		
			<!-- 10페이지 다음 -->
				<c:if test="${num.chong != num.pend }">
					<a class="page_color" href="list.jsp?page=${num.pend+1}">▶▶</a>
				</c:if>
				<c:if test="${num.chong == num.pend }">
					<a class="page_color">▶▶</a>
				</c:if>
				
		
		
			<!-- 마지막페이지로 이동 -->
				<a class="page_color" href="list.jsp?page=${num.chong}">Last</a>
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp"%>
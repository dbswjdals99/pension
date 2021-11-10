<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ page import="pension.gongji.GongjiDao"%>
<%@ page import="pension.gongji.GongjiDto"%>
<%@ page import="pension.board.BoardDao" %>
<%@ page import="pension.board.BoardDto" %>
<%@ page import="pension.tour.TourDao" %>
<%@ page import="pension.tour.TourDto" %>
<%@ page import="pension.board.Number" %>
<%@ page import="java.util.ArrayList"%>
<%
	GongjiDao gdao = new GongjiDao();
	ArrayList<GongjiDto> list = gdao.list_index();
	request.setAttribute("list", list);
	
	BoardDao bdao = new BoardDao();
	ArrayList<BoardDto> list2 = bdao.list_index2();
	request.setAttribute("list2", list2);
	
	TourDao tdao = new TourDao();
	ArrayList<TourDto> list3 = tdao.list_index3();
	request.setAttribute("list3", list3);
%>
<style>

	#first_floor {
	width: 2000px;
	height: 1000px;
	background: white;
	margin: auto;
	position: relative;
	z-index: 1;
	}

	#second_floor {
	width: 1000px;
	height: 200px;
	background: white;
	margin: auto;
	}
	
	#third_floor {
	width:1500px;
	height:700px;
	margin:auto;
	}
	
	#fourth_head {
	width: 1000px;
	height: 200px;
	background: white;
	margin: auto;
	}
	
	#fourth_floor{
	width:1800px;
	height:700px;
	margin:auto;
	padding-left:100px;
	}

	#outer {
	width: 2000px;
	height: 1000px;
	overflow: hidden;
	}

	#inner {
	width: 4010px;
	heigth: 1000px;
	}
	
	.best{
	width:300px;
	height:300px;
	border:1px solid silver;
	display:inline-block;
	margin:20px;
	}
	
	.best_img{
	width:300px;
	height:250px;
	}
	
	.best_head{
	margin-top:10px;
	font-weight:bold;
	font-size:20px;
	display:inline-block;
	}
	
	.table_index{
	width:500px;
	height:300px;
	float:left;
	margin-right:80px;
	border-collapse:collapse;
	cursor:pointer;
	}
	
	.table_index_bold{
	border-top:2px solid silver;
	border-bottom:2px solid silver;
	background:#f2f2f2;
	}
	
	.table_index td,th{
	border:1px solid silver;
	text-align:center;
	border-right:none;
	border-left:none;
	}
	
	
	.table_index_top {
	border-top:none;
	font-size:22px;
	}
	
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		stop = setInterval(function() {
			$("#inner").animate({
				marginLeft : "-2000px"
			}, 2000, function() {
				$("img").eq(0).insertAfter($("img").eq(5));
				$("#inner").css("margin-left", "0px");
			});
		}, 6000);
	});
	
	function view_gongji()
	{
		location = "../gongji/list.jsp";
	}
	
	function view_board()
	{
		location = "../board/list.jsp";
	}
	
	function view_tour()
	{
		location = "../tour/list.jsp";
	}
</script>

<div id="first_floor">
	<div id="outer">
		<div id="inner">
			<img src="../img/main1.jpg" width="2000" height="1000"><img
				src="../img/main2.jpg" width="2000" height="1000"><img
				src="../img/main3.jpg" width="2000" height="1000"><img
				src="../img/main4.jpg" width="2000" height="1000"><img
				src="../img/main5.jpg" width="2000" height="1000"><img
				src="../img/main6.jpg" width="2000" height="1000">
		</div>
	</div>
</div>
<div id="second_floor">
	<div align="center" class="side_div">
		<span class="side"> FOR YOUR HOLYDAY</span>
	</div>
</div>
<div id="third_floor" align="center">
	<div class="best">
		<div class="best_img"><img src="../img/best1.jpg" width="300" height="250"></div>
		<span class="best_head"> 힐링방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best2.jpg" width="300" height="250"></div>
		<span class="best_head"> 인연방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best3.jpg" width="300" height="250"></div>
		<span class="best_head"> 우정방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best4.jpg" width="300" height="250"></div>
		<span class="best_head"> 사랑방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best5.jpg" width="300" height="250"></div>
		<span class="best_head"> 행복방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best6.jpg" width="300" height="250"></div>
		<span class="best_head"> 추억방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best7.jpg" width="300" height="250"></div>
		<span class="best_head"> 감성방 </span>
	</div>
	<div class="best">
		<div class="best_img"><img src="../img/best8.jpg" width="300" height="250"></div>
		<span class="best_head"> 불금방 </span>
	</div>
</div>
<div id="fourth_head">
	<div align="center" class="side_div">
		<span class="side"> COMMUNITY </span>
	</div>
</div>
<div id="fourth_floor" align="center">
<div align="center">
	<table class="table_index" onclick="view_gongji()">
		<tr>
			<th colspan="4" class="table_index_top">공지사항</th>
		</tr>
		<tr>
			<th class="table_index_bold">번호</th>
			<th class="table_index_bold">제목</th>
			<th class="table_index_bold">작성일</th>
			<th class="table_index_bold">조회</th>
		</tr>
		<c:forEach items="${list}" var="gdto">
		<tr>
			<td>${gdto.id}</td>
			<td>${gdto.title}</td>
			<td>${gdto.writeday}</td>
			<td>${gdto.readnum}</td>
		</tr>
		</c:forEach>
	</table>
	<table class="table_index" onclick="view_board()">
		<tr>
			<th colspan="4" class="table_index_top">자유게시판</th>
		</tr>
		<tr>
			<th class="table_index_bold">제목</th>
			<th class="table_index_bold">작성자</th>
			<th class="table_index_bold">조회수</th>
			<th class="table_index_bold">작성일</th>
		</tr>
		<c:forEach items="${list2}" var="bdto">
		<tr>
			<td>${bdto.title}</td>
			<td>${bdto.name}</td>
			<td>${bdto.readnum}</td>
			<td>${bdto.writeday}</td>
		</tr>
		</c:forEach>
	</table>
	<table class="table_index" onclick="view_tour()">
		<tr>
			<th colspan="4" class="table_index_top">여행후기</th>
		</tr>
		<tr>
			<th class="table_index_bold">작성자</th>
			<th class="table_index_bold">제목</th>
			<th class="table_index_bold">작성일</th>
		</tr>
		<c:forEach items="${list3}" var="tdto">
		<tr>
			<td>${tdto.name}</td>
			<td>${tdto.title}</td>
			<td>${tdto.writeday}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</div>
<%@ include file="../bottom.jsp"%>
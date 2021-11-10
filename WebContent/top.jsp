<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
	}

	#second {
	width: auto;
	height: 70px;
	margin: auto;
	}

	#main {
	margin: 0px;
	font-weight: bold;
	background:black;
	height: 70px;
	}

	#second #main li {
	list-style: none;
	display: inline-block;
	width: 300px;
	padding-top: 23px;
	color: white;
	font-size: 16px;
	}

	#second #main li>last-child {
	height: 44px;
	}

	#second #main>li {
	position: relative;
	}

	#second #main>li>.sub {
	position: absolute;
	padding-left: 0px;
	background: black;
	z-index: 10;
	visibility: hidden;
	height: auto;
	padding-top: 20px;
	padding-bottom: 20px;
	width: 300px;
	}

	#my {
	display: inline-block;
	position: relative;
	}

	.gori {
	text-decoration: none;
	color: white;
	}

	.gori:hover {
	opacity: 0.4;
	}

	.gori_a {
	text-decoration: none;
	color: white;
	}

	#fifth {
	width: auto;
	height: 350px;
	background: #2c4162;
	margin: auto;
	}

	.head {
	color: white;
	font-size: 20px;
	font-weight: bolder;
	border-bottom: 1px solid white;
	}

	#logo {
	color: white;
	font-size: 32px;
	font-weight: bolder;
	}

	#bottom td {
	color: white;
	padding: 15px;
	padding-left:20px;
	font-size: 18px;
	}

	table {
	border-collapse: collapse;
	margin-top: 20px;
	}

	#logo_padding {
	padding-top: 20px;
	padding-left: 20px;
	}

	.side {
	font-size: 60px;
	font-weight: bolder;
	}

	.side_div {
	padding-top: 65px;
	}
</style>
<script>
	function view(n) 
	{
		document.getElementsByClassName("sub")[n].style.visibility = "visible";
		document.getElementsByClassName("sub")[n].style.opacity = "0.5";
	}

	function hide(n) 
	{
		document.getElementsByClassName("sub")[n].style.visibility = "hidden";
	}
	
	function member_out()
	{
		if(confirm("정말 탈퇴하시겠습니까?"))
		{
			location="../member/member_out.jsp";
		}
	}
</script>
</head>
<body>
	<div id="second">
		<ul id="main" align="center">
			<li><a href="../main/index.jsp" class="gori"> Minny </a></li>
			<li onmouseover="view(0)" onmouseout="hide(0)">
			<a href="#" class="gori"> 펜션소개 </a>
				<ul class="sub">
					<li><a href="../introduce/insa.jsp" class="gori_a">인사말</a></li>
					<li style="width: 100px;">오는길</li>
				</ul>
			</li>
			<li onmouseover="view(1)" onmouseout="hide(1)"><a href="#"
				class="gori"> 주변관광지 </a>
				<ul class="sub">
					<li><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%ED%95%9C%EB%9D%BC%EC%82%B0" class="gori_a">한라산</a></li>
					<li><a href="https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%EB%B0%B1%EB%91%90%EC%82%B0&oquery=%ED%95%9C%EB%9D%BC%EC%82%B0&tqi=hU4eRdp0JywssccgSkCssssssSV-359772&acq=%EB%B0%B1%EB%91%90&acr=10&qdt=0" class="gori_a">백두산</a></li>
					<li><a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B1%B0%EB%AC%B8%EB%8F%84&oquery=%EB%B0%B1%EB%91%90%EC%82%B0&tqi=hU4ellp0YiRssFAFSoGssssstjl-293851" class="gori_a">거문도</a></li>
					<li><a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80&oquery=%EA%B1%B0%EB%AC%B8%EB%8F%84&tqi=hU4eCdp0J14ssF3RD%2FZssssssdh-186944" class="gori_a">해운대</a></li>
				</ul>
			</li>
			<li onmouseover="view(2)" onmouseout="hide(2)">
			<a href="#" class="gori"> 예약관련 </a>
				<ul class="sub">
					<li>예약안내</li>
					<li><a href="../reserve/reserve.jsp" class="gori_a">실시간예약</a></li>
				</ul>
			</li>
			<li onmouseover="view(3)" onmouseout="hide(3)">
			<a href="#" class="gori"> 커뮤니티 </a>
				<ul class="sub">
					<li><a href="../gongji/list.jsp" class="gori_a">공지사항</a></li>
					<li><a href="../board/list.jsp" class="gori_a">자유게시판</a></li>
					<li><a href="../tour/list.jsp" class="gori_a">여행후기</a></li>
				</ul>
			</li>
			<li onmouseover="view(4)" onmouseout="hide(4)">
				<!-- 로그인을 하지 않았을 경우 --> 
				<c:if test="${userid==null}">
					<a href="../login/login.jsp" class="gori">로그인</a> |
					<a href="../member/member_input.jsp" class="gori">회원가입</a>
					
				</c:if> <!-- 로그인을 한 경우 이지만 관리자가 아닐경우-->
			 	<c:if test="${userid!=null && userid != 'admin'}">
					<a> ${name} 님</a> |
					<a href="../login/logout.jsp" class="gori">로그아웃</a> |
				<div id="my">
					<a href="#" class="gori_a">마이페이지</a>
				</div>
					<ul class="sub">
						<li><a href="../mypage/mypage.jsp" class="gori_a">회원정보</a></li>
						<li><a href="../reserve/user_reserve_view.jsp?userid=${userid}" class="gori_a">예약정보</a></li>
						<li><a href="javascript:member_out()" class="gori_a">회원탈퇴</a></li>
					</ul>
				</li>
				<li onmouseover="view(4)" onmouseout="hide(4)">
				</c:if>
				<!-- 로그인을 하였고 관리자인 경우 -->
		         <c:if test="${userid != null && userid == 'admin'}">
		                       관리자!!	|
		         <a href="../login/logout.jsp" class="gori_a"> 로그아웃 </a> |
		         <a href="#" class="gori_a">관리페이지</a>
		            <ul class="sub">
		              <li> <a href="../admin/member_view.jsp" class="gori_a"> 회원관리 </a> </li>
		              <li> <a href="../admin/reserve_view.jsp" class="gori_a"> 예약관리 </a> </li>
		            </ul>
		         </c:if>
			<li>
		</ul>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.tour.TourDao" %>
<%@ page import="pension.tour.TourDto" %>
<%
	TourDao tdao = new TourDao();
	TourDto tdto = tdao.update(request);
	
	request.setAttribute("tdto", tdto);
%>
<%@ include file="../top.jsp"%>    
<c:if test="${userid == null}">
  <c:redirect url="../login/login.jsp"/>
</c:if>
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

	.table td {
	text-align: center;
	}
	
	input[type=submit] {
	width: 412px;
	height: 52px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 18px;
	background: black;
	color: white;
	margin-bottom: 10px;
	}

	input[type=text] {
	width: 800px;
	height: 30px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
	}

	textarea {
	width: 800px;
	height: 100px;
	border: 1px solid silver;
	font-size: 17px;
	color: black;
	padding: 5px;
	}
	
	.chk{
	display:none;
	}
	
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var size = 1;
	
	function add()
	{
		size++;
		var img = document.getElementById("image");
		var inner = "<p class='fname'><input type='file' name='fname"+size+"'></p>"
		img.innerHTML = img.innerHTML + inner;
	}
	
	function delimg()
	{	
		if (size > 1)
		{
		$(".fname").eq(size - 1).remove();
		size--;
		}
	}
	
	function check(form)
	{
		var chk = document.getElementsByClassName("chk");
		var str=""; // 체크가 안된 그림 파일명 만 저장
		var del="";
		for (i=0; i<chk.length; i++)
		{
			if(!chk[i].checked)
			{
				str=str+chk[i].value+",";
			}
			else
			{
				del=del+chk[i].value+",";
			}
		}
		form.imsi.value=str;
		form.del.value=del;
		return true;
	}
	
	function hideimg(tt,n)
	{
		if(tt.checked)
		{
			document.getElementsByClassName("img")[n].style.opacity="0.3";
		}
		else
		{
			document.getElementsByClassName("img")[n].style.opacity="1";
		}
	}


</script>
<div id="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div id="content_text"> Update </div>
</div>
<div id="section"> 
<form onsubmit="return check(this)" method="post" action="update_ok.jsp" enctype="multipart/form-data">
<input type="hidden" name="id" value="${tdto.id}"> 
<input type="hidden" name="imsi">
<input type="hidden" name="del">
	<table width="1000" align="center" class="table">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${tdto.title}"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="40" rows="7" name="content">${tdto.content}</textarea></td>
		</tr>
		<tr>
			<td>사진</td>
			<td>
			<!-- 기존 사진 출력 -->
			<c:set var="i" value="0"></c:set>
			<c:forEach items="${tdto.fname2}" var="fname">
				<c:if test="${fname != ''}">
				<label for="check${i}"><img src="img/${fname}" width="100" height="100" class="img">
				<input type="checkbox" onclick="hideimg(this,${i})" name="chk" value="${fname}" class="chk" id="check${i}">
				 </label>
				</c:if>
				<c:set var="i" value="${i+1}"></c:set>
			</c:forEach>
				<div id="image">
					<input type="button" onclick="add()" value="사진추가">
					<input type="button" onclick="delimg()" value="사진삭제">
					<p class="fname"><input type="file" name="fname1"></p>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정하기"></td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../bottom.jsp"%>
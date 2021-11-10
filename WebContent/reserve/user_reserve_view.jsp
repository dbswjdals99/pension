<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>   
<%@ page import="pension.reserve.ReserveDao" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	ReserveDao rdao = new ReserveDao();
	request.setAttribute("list", rdao.user_reserve_view(request));
%> 
<style>

	#section {
	width:1000px;
	height:600px;
	margin:auto;
	}
	
	.content_text {
	position:relative;
	top:-380px;
	left:-200px;
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
	
	.table th, .table td {
	border: 1px solid silver;
	padding: 15px;
	border-right: none;
	border-left: none;
	color: gray;
	text-align:center;
	}
	
	#reserve_font{
	text-align:center;
	font-weight:bold;
	font-size:32px;
	}
	
</style>
<div class="content" align="center">
	<img src="../img/backimg.jpg" width="2000" height="400" id="img1">
	<div class="content_text"> Reservation Confirm </div>
</div>
<div id="section">
	<c:if test="${list.size() == 0}">
		<div align="center" id="reserve_font">예약된 방이 없습니다!!!</div>
	</c:if>
	<c:if test="${list.size() != 0}">
	<table class="table" align="center">
		<tr>
		    <th> 입실일 </th>
		    <th> 퇴실일 </th>
		    <th> 인원수 </th>
		    <th> 방 </th>
		    <th> 숯불세트 </th>
		    <th> bbq세트 </th>
		    <th> 총결제금액 </th>
	   </tr>
	   <c:forEach items="${list}" var="rdto">
	   <tr>
		    <td> ${rdto.inday} </td>
		    <td> ${rdto.outday} </td>
		    <td> ${rdto.inwon}명 </td>
		    <td> ${rdto.bang} </td>
		    <td> ${rdto.charcoal} </td>
		    <td> ${rdto.bbq} </td>
		    <td> <fmt:formatNumber value="${rdto.total}"/>원 </td>
	   </tr>
  	   </c:forEach>
	</table>
	</c:if>
</div>
<%@ include file="../bottom.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.tour.TourDao" %>
<%
	if(session.getAttribute("userid") == null)
	{
		response.sendRedirect("../login/login.jsp");
	}
%>
<%
	// 파일을 업로드하고 수정을 한 후 -> content로 이동
	TourDao tdao = new TourDao();
	tdao.update_ok(request, response);
%>
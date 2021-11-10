<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pension.tour.TourDao" %>
<%
	// 하나의 레코드를 읽어와서 출력
	TourDao tdao = new TourDao();
	tdao.delete(request, response);
%>
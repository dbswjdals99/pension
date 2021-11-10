<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>
<%
     // 하나의 레코드를 읽어와서 폼태그에 넣기
     MemberDao mdao = new MemberDao();
     mdao.pwd_change(request,response,session);
%>  
<%@page import="good.GoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");
out.println("idx="+ idx);
GoodDAO dao = new GoodDAO();
int result = dao.updateGoodCount(idx);
if(result==1)
	out.println("성공");
else
	out.println("실패");
%>
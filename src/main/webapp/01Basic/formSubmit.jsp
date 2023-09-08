<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String good = request.getParameter("good");
out.println("전송된폼값 : "+ good);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
<%
	String url = (String)request.getAttribute("url");
	String message = (String)request.getAttribute("message");
%>
</head>
<body>
<h1>관리자에게 문의해 주세요 : <%=message%></h1>
<a href="<%=url%>">처음페이지로 이동</a>
</body>
</html>
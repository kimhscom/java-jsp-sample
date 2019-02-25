<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더페이지</title>
<style type="text/css">
	header{
		background-color: green;
		height: 50px;
		color: white;
		font-size: 36px;
	}
	
	footer{
		background-color: green;
		height:50px; 
		text-align: center;
		line-height: 50px;
	}
	
	table{
		border: 3px solid black;
		border-collapse: collapse;
	}
	
	th, td{
		border: 1px solid gray;
		border-collapse: collapse;
	}
	
	th{
		background-color: yellow;
	}
	
	#container{
	height: 500px;
	}
	
	a{
		text-decoration: none;		
	}
</style>
</head>
<header>
	<a href="./boardController.jsp?command=boardlist">
		게시판구현
	</a>
</header>
</html>
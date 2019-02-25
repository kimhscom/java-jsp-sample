<%@page import="java.util.Date"%>
<%@page import="com.happy.board.dto.AnswerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글작성</title>
</head>
<%
	AnswerBoardDTO dto =
	(AnswerBoardDTO)request.getAttribute("dto");
%>
<script type="text/javascript" src="./js/answerboard.js"></script>
<body>
<%@include file="./Header.jsp" %>
<div id="container">
	<div><a href="javascript:history.back(-1)">뒤로가기</a></div>
	<form action="./boardController.jsp" method="post">
		<input type="hidden" name="command" value="write">
		<table>
			<tr>
				<td style="background-color: lime; font-weight: bold">아이디</td>
				<td style="background-color: lime; font-weight: bold">제목</td>
				<td style="background-color: lime; font-weight: bold">내용</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="id" maxlength="20" required="required">
				</td>
				<td>
					<input type="text" name="title" maxlength="50" required="required">
				</td>
				<td>
					<textarea rows="10" cols="50" name="content"></textarea>
				</td>								
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">
					<input type="submit" value="새글입력">
					<input type="reset" value="새글초기화">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@include file="./Footer.jsp" %>
</body>
</html>
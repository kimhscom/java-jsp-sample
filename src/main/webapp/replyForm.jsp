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
<title>답글 작성</title>
</head>
<%
	AnswerBoardDTO dto =
	(AnswerBoardDTO)request.getAttribute("dto");
%>
<script type="text/javascript" src="./js/answerboard.js"></script>
<body>
<%@include file="./Header.jsp" %>
<div id="container">
	<form action="./boardController.jsp" method="post">
		<input type="hidden" name="command" value="reply">
		<!-- 부모의 seq -->
		<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
		<table>
			<tr>
				<td>아이디:</td>
				<td>
					<input type="text" name="id" required="required">
				</td>
			</tr>
			<tr>
				<td>제목:</td>
				<td>
					<input type="text" name="title" required="required">
				</td>
			</tr>
			<tr>
				<td id="conTxt">내용(원본)</td>
				<td>
					<input type="hidden" id="hidecontent" value="<%=dto.getContent()%>">
					<textarea id="txtArea" name="content" required="required" rows="10" cols="50" onclick="contentChk()">원본글&gt;<%=dto.getContent()%></textarea>
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=new Date()%></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답글입력">
					<input type="reset" value="답글초기화">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@include file="./Footer.jsp" %>
</body>
</html>
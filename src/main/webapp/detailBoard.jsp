<%@page import="com.happy.board.dto.AnswerBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<%
	AnswerBoardDTO dto = (AnswerBoardDTO)request.getAttribute("dto");
%>
<script type="text/javascript" src="./js/answerboard.js"></script>
<body>
<%@ include file="./Header.jsp" %>
<div id="container">
	<table>
		<col width="200px"><col width="700px">
		<tr>
			<th>아이디</th><td><%=dto.getId()%></td>
		</tr>	
		<tr>
			<th>제목</th><td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>내용</th><td><textarea readonly="readonly" rows="10" cols="50"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center">
				<%=dto.getRegdate()%>
			</th>
		</tr>
	</table>
	
	<form action="./boardController.jsp" method="post">
		<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
		<div>
			<input type="button" value="완전삭제" onclick="del()">
			<input type="button" value="글수정" onclick="modify()">
			<input type="button" value="답글작성" onclick="reply()">
		</div>	
	</form>
		
</div>
<%@ include file="./Footer.jsp" %>
</body>
</html>
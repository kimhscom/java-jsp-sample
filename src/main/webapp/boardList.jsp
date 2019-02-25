<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.happy.board.dto.AnswerBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 조회 화면</title>
<link type="text/css" rel="stylesheet" href="./css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="./css/bootstrap-theme.css">
</head>
<%!
	public String photo(int depth) {
	String result = "";
	String pic = "<img alt=\"답글\" src=\"./img/reply.png\">";
	String blank = "&nbsp;&nbsp;&nbsp;&nbsp;";
	if(depth>0){
		for(int i = 0; i < depth; i++){
			result += blank;
		}
		result += pic;
	}
	
	return result;
} // photo
	
	public String dateChange(String date){
	// Date date
	// SimpleDateFormat simple = new SimpleDateFormat("YYYY-MM-DD");
	// String dateToString = simple.format(date);
	return date.substring(0, date.indexOf(" "));
}
	
%>
<%
	List<AnswerBoardDTO> lists = 
			(List<AnswerBoardDTO>)request.getAttribute("lists");
%>
<script type="text/javascript" src="./js/answerboard.js"></script>
<script type="text/javascript" src="./js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<body>
	<%@ include file="./Header.jsp" %>
	<div id="container">
	<form action="./boardController.jsp" method="post" onsubmit="return chsConfirm()">
		<input type="hidden" name="command" value="multidel">
		<table>
			<tr>
				<th><input type="checkbox" onclick="checkAll(this.checked)"></th>
				<th>SEQ</th><th>ID</th><th>TITLE</th>
				<th>REFER</th><th>STEP</th><th>DEPTH</th><th>READCOUNT</th>
				<th>DELFLAG</th><th>REGDATE</th>
			</tr>
			<%
				for(AnswerBoardDTO dto : lists){
					%>
					<tr>
					<td><input type="checkbox" name="ch" value="<%=dto.getSeq()%>"></td>
					<td><%=dto.getSeq()%></td>
					<td><%=dto.getId()%></td>					

					<%
					if(dto.getDelflag().trim().compareToIgnoreCase("Y")==0){
						%>
							<td style="color:red; font-size: 0.5em">관리자에 의해 삭제</td>
						<%
					}else{	
						%>
							<td>
								<%=photo(dto.getDepth())%>
								<a href="./boardController.jsp?command=detailBoard&seq=<%=dto.getSeq()%>">
								<%=dto.getTitle()%>
								</a>
							</td>
						<%
					}
					
					%>
					<td><%=dto.getRefer()%></td>
					<td><%=dto.getStep()%></td>
					<td><%=dto.getDepth()%></td>
					<td><%=dto.getReadcount()%></td>
					<td><%=dto.getDelflag()%></td>
					<td><%=dateChange(dto.getRegdate())%></td>
					</tr>
					<%	
				}
			%>
		</table>
		<div style="text-align: center;">
			<input class="btn btn-primary" type="submit" value="다중삭제">
			<input class="btn btn-success" type="button" value="새글작성" onclick="location.href='boardController.jsp?command=writeForm'">
		</div>
	</form>
	</div>
	<%@ include file="./Footer.jsp" %>
</body>
</html>
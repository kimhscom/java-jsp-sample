<%@page import="com.happy.board.dto.AnswerBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.happy.board.dao.Answerboard_Impl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러</title>
</head>
<body>
<%!
	public String cmdCheck(String command) {
	String cmd = null;
	if(command == null){
		cmd = "";
	}else{
		cmd = command.trim();
	}
	
	return cmd;
}
%>
<%
	String cmd = request.getParameter("command");
	System.out.println("분기 요청값 command = "+cmd);
	
	Answerboard_Impl dao = new Answerboard_Impl();
	
	if(cmdCheck(cmd).equalsIgnoreCase("boardList")){
		System.out.println("전체조회 페이지 이동");
		
		List<AnswerBoardDTO> lists = dao.selectAllBoard();
		request.setAttribute("lists", lists);
		pageContext.forward("./boardList.jsp");
		
	}else if(cmdCheck(cmd).equalsIgnoreCase("")){
		request.setAttribute("url", "./index.jsp");
		request.setAttribute("message", "시스템 오류");
		pageContext.forward("./error.jsp");
	}else if(cmdCheck(cmd).equalsIgnoreCase("multidel")){
		String[] seqs = request.getParameterValues("ch");
		boolean isc = dao.multiDelete(seqs);
		if(isc){
			response.sendRedirect("boardController.jsp?command=boardList");
		}else{
			request.setAttribute("url", "./index.jsp");
			request.setAttribute("message", "삭제 오류");
			pageContext.forward("./error.jsp");
		}
	}else if(cmdCheck(cmd).equalsIgnoreCase("detailBoard")){
		String seq = request.getParameter("seq");
		AnswerBoardDTO dto = dao.selectDetailBoard(seq);
		request.setAttribute("dto", dto);
		pageContext.forward("./detailBoard.jsp");
	}else if(cmdCheck(cmd).equalsIgnoreCase("del")){
		String seq = request.getParameter("seq");
		boolean isc = dao.deleteBoardReal(seq);
		if(isc){
			response.sendRedirect("boardController.jsp?command=boardList");
		}else{
			request.setAttribute("url", "./index.jsp");
			request.setAttribute("message", "삭제 오류");
			pageContext.forward("./error.jsp");
		}
	}else if(cmdCheck(cmd).equalsIgnoreCase("modifyForm")){
		String seq = request.getParameter("seq");
		AnswerBoardDTO dto = dao.selectDetailBoard(seq);
		System.out.println(seq+":"+dto);
		request.setAttribute("dto", dto);
		pageContext.forward("./modifyForm.jsp");
	}else if(cmdCheck(cmd).equalsIgnoreCase("modify")){
		String seq = request.getParameter("seq");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(seq+":"+title+":"+content);
		AnswerBoardDTO dto = new AnswerBoardDTO(Integer.parseInt(seq),"",title,content);
		boolean isc = dao.modifyBoard(dto);
		if(isc){
			response.sendRedirect("./boardController.jsp?command=detailBoard&seq="+seq);
		}else{
			request.setAttribute("url", "./index.jsp");
			request.setAttribute("message", "삭제 오류");
			pageContext.forward("./error.jsp");
		}
	}else if(cmdCheck(cmd).equalsIgnoreCase("replyForm")){
		String seq = request.getParameter("seq");
		AnswerBoardDTO dto =
			dao.selectDetailBoard(seq);
		request.setAttribute("dto", dto);
		pageContext.forward("./replyForm.jsp");
	}else if(cmdCheck(cmd).equalsIgnoreCase("reply")){
		String seq = request.getParameter("seq");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(seq+":"+id+":"+title+":"+content);
		AnswerBoardDTO dto = new AnswerBoardDTO(Integer.parseInt(seq),id,title,content);
		boolean isc = dao.reply(dto);
		if(isc){
			response.sendRedirect("./boardController.jsp?command=boardList");
		}else{
			request.setAttribute("url", "./index.jsp");
			request.setAttribute("message", "답글 오류");
			pageContext.forward("./error.jsp");
		}
	}else if(cmdCheck(cmd).equalsIgnoreCase("writeForm")){
		response.sendRedirect("./writeForm.jsp");
	}else if(cmdCheck(cmd).equalsIgnoreCase("write")){
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(id+":"+title+":"+content);
		AnswerBoardDTO dto = new AnswerBoardDTO(0, id, title, content);
		boolean isc = dao.insertBoard(dto);
		if(isc){
			response.sendRedirect("./boardController.jsp?command=boardList");
		}else{
			request.setAttribute("url", "./index.jsp");
			request.setAttribute("message", "새글 오류");
			pageContext.forward("./error.jsp");
		}
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../config/config.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%	
	myBoard.DBOpen();	
    
	String user_id = request.getParameter("userId");
    String user_pw = request.getParameter("userPw");
	String sql     = "";
	
	sql = "SELECT * FROM user WHERE id='" + user_id + "' AND pw='" + user_pw + "'";
		
	myBoard.OpenQuery(sql);
	if(myBoard.ResultNext())
	{
		String user_photo = myBoard.getString("photo");
		String boardPw    = myBoard.getString("pw");			

		session.setAttribute("s_id", user_id); 
		session.setAttribute("s_pw", user_pw);
		session.setAttribute("s_photo", user_photo);
		/*
		로그아웃했던 페이지로 돌아감
		(기존에 로그아웃하면 index.jsp로 돌아가던 문제 해결)
		*/			
		response.sendRedirect( m_BaseURL + "/index.jsp");
	}else
	{
		%> 
		<script> 
			alert("로그인에 실패 했습니다.\n아이디 또는 비밀번호를 확인해주세요!"); 
			document.location = "<%= m_BaseURL %>/index.jsp";
		</script> 
		<%
	}	
	
	myBoard.CloseQuery();
	myBoard.DBClose();
%>


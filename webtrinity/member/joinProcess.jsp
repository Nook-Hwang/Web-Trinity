<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../config/config.jsp" %>
<%@ page import="java.sql.*" %>
<%
	String mID    = request.getParameter("userId");
	String mPW    = request.getParameter("userPw");
	String mPhoto = request.getParameter("photo");
	String mSQL = "";

	request.setCharacterEncoding("UTF-8");
	myBoard.DBOpen();	

	mSQL = "select id from user where id = '" + mID + "' ";
	//동일한 ID 가입 여부 확인
	myBoard.OpenQuery(mSQL);
	if(	myBoard.ResultNext() == true)
	{
		out.print("DUPLICATE");
		myBoard.CloseQuery();
		myBoard.DBClose();
		return;
	}
	myBoard.CloseQuery();

	if(myBoard.Execute("insert into user(id, pw, photo) values('" + mID + "','" + mPW + "','" + mPhoto + "') "))
	{
		//out.print("회원가입을 완료하였습니다.");
		out.print("SUCCESS");	
	}
	else
	{
		//out.print("회원가입시 데이터베이스 처리에 오류가 발생합니다.");	
		out.print("FAIL");
	}
	myBoard.DBClose();
%>


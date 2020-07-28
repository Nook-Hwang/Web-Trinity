<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../config/config.jsp" %>
<%@ page import="java.sql.*" %>
<%
	String s_id = (String)session.getAttribute("s_id");	
	String s_pw = (String)session.getAttribute("s_pw");	
	String s_photo = (String)session.getAttribute("s_photo");	

	String mOldPw = request.getParameter("oldPw");
	String mNewPw = request.getParameter("newPw");
	String mPhoto = request.getParameter("photo");
	String mSQL = "";

	request.setCharacterEncoding("UTF-8");

	if(!s_pw.equals(mOldPw))
	{
		%>
		<script language="javascript">
			
			alert("비밀번호가 일치하지 않습니다.");
			document.location = "<%= m_BaseURL %>/index.jsp";

		</script>
		<%
		return;
	}

	myBoard.DBOpen();

	mSQL = "update user set pw = '" + mNewPw + "',photo='" + mPhoto + "' where id = '" + s_id + "' ";
	out.print(mSQL);
	if(myBoard.Execute(mSQL))
	{
		%>
		<script language="javascript">
			
			alert("비밀번호를 변경하였습니다.");
			document.location = "<%= m_BaseURL %>/index.jsp";

		</script>
		<%

		session.setAttribute("s_pw",mNewPw);
		session.setAttribute("s_photo",mPhoto);
	}
	else
	{
		%>
		<script language="javascript">
			
			alert("비밀번호 변경 오류가 발생하였습니다.");
			document.location = "<%= m_BaseURL %>/index.jsp";

		</script>
		<%
	}
	myBoard.DBClose();
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../config/config.jsp" %>
<%	
session.invalidate();
%>
<script> 
	document.location = "<%= m_BaseURL %>/index.jsp";
</script> 

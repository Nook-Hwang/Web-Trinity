<%@ page contentType="text/html; charset=UTF-8" %>
<div class="leftSide" style="z-index:1;background-color: white;">
	<!--좌측 최상단 로고 시작-->	
	<a href="<%= m_BaseURL %>/index.jsp?menu=about">
		<img src="<%= m_BaseURL %>/images/webTrinity_logo.jpg" id="logo" alt="Web Trinity" title="클릭하면 Web Trinity에 대한 설명으로 이동합니다."/>
	</a>
	<!--좌측 최상단 로고 끝-->
	<%@ include file="login.jsp" %>
	<%@ include file="menu.jsp" %>
</div>

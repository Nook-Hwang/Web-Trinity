<%@ page contentType="text/html; charset=UTF-8" %>
<!--드롭다운 메뉴 시작-->
	<div class="dropdown">
		<a href="#web_trinity">
			<button class="dropbtn" id="about" 
			style="cursor: pointer;" onclick="<%= m_BaseURL %>/index.jsp?menu=about#web_trinity">ABOUT
			</button>
		</a>
	</div>
	<div class="dropdown">
		<button class="dropbtn" id="htmlMenu" onMouseOver="this.innerHTML='HTML&nbsp;&nbsp;△'" 
		onMouseOut="this.innerHTML='HTML&nbsp;&nbsp;▼'">HTML&nbsp;&nbsp;▼</button>
		<div class="dropdown-content">
			<a href="<%= m_BaseURL %>/index.jsp?menu=hs" id="htmlMenu">
				<p class="study">STUDY</p>
			</a>
			<a href="<%= m_BaseURL %>/index.jsp?menu=hq" id="htmlMenu">
				<p class="qna">Q&amp;A</p>
			</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn" id="cssMenu" onMouseOver="this.innerHTML='CSS&nbsp;&nbsp;△'" 
		onMouseOut="this.innerHTML='CSS&nbsp;&nbsp;▼'">CSS&nbsp;&nbsp;▼</button>
		<div class="dropdown-content">
			<a href="<%= m_BaseURL %>/index.jsp?menu=cs" id="cssMenu">
				<p class="study">STUDY</p>
			</a>
			<a href="<%= m_BaseURL %>/index.jsp?menu=cq" id="cssMenu">
				<p class="qna">Q&amp;A</p>
			</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn" id="jsMenu" onMouseOver="this.innerHTML='JAVASCRIPT&nbsp;&nbsp;△'" 
		onMouseOut="this.innerHTML='JAVASCRIPT&nbsp;&nbsp;▼'">JAVASCRIPT&nbsp;&nbsp;▼</button>
		<div class="dropdown-content">
			<a href="<%= m_BaseURL %>/index.jsp?menu=js" id="jsMenu">
				<p class="study">STUDY</p>
			</a>
			<a href="<%= m_BaseURL %>/index.jsp?menu=jq" id="jsMenu">
				<p class="qna">Q&amp;A</p>
			</a>
		</div>
	</div>
<!--드롭다운 메뉴 끝-->
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/login.css">
<script type="text/javascript" src="<%= m_BaseURL %>/scrypt/login.js"></script>
<%
request.setCharacterEncoding("UTF-8");
String s_id = (String)session.getAttribute("s_id");	
String s_pw = (String)session.getAttribute("s_pw");	
String s_photo = (String)session.getAttribute("s_photo");	
		
if(s_id == null) 
{
	//세션에 저장된 s_id 값이 없는 경우 로그인 하지 않은 것으로 간주한다.
	%>
	<table border="0" cellpadding="0" cellspacing="0" class="none">
		<tr id="trLogin" name="trLogin" class="none">
			<td class="none">
				<div class="login">	
					<form id="loginForm" name="loginForm" method="post" onsubmit="return loginChk()" action="<%= m_BaseURL %>/member/loginProcess.jsp">			
						<input type="text" id="userId" name="userId" placeholder="ID">
						<input type="password" id="userPw" name="userPw" 
							autocomplete="off" placeholder="PASSWORD">
						<br>
						<input type="submit" id="login" name="login" value="로그인">
						<input type="button" id="join" name="join" value="회원가입" onclick="javascript:viewJoin();">
					</form>
				</div>
			</td>
		</tr>
		<tr id="trJoin" name="trJoin" style="display:none" class="none">
			<td class="none">
				<div class="join">
					<form id="joinForm" name="joinForm" method="post" onSubmit="return joinCheck();" action="#">
						<div>
							<input type="hidden" name='photo' id="photo" value="type_a.png">
							<img src="<%= m_BaseURL %>/images/type_a.png" id="photo_img" name="photo_img" onclick="javascript:newPopup('<%= m_BaseURL %>/member/select.jsp');" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0; cursor:pointer;" 
					title="사진을 누르면 프로필 사진을 변경 할 수 있어요!!"/>
						</div>

						<input type="text" id="joinId" name="userId" placeholder="ID" title="아이디를 입력해주세요." value="jhjeong">
						<input type="password" id="joinPw" name="userPw" autocomplete="off"  placeholder="PASSWORD" title="비번을 입력해주세요." value="11">
						<input type="password" id="joinPwCheck" name="userPwCheck" autocomplete="off"  placeholder="PASSWORD CHECK" title="다시확인~" value="11">
						<br>
						<input type="submit" id="joinGo" name="joinGo" value="가입하기" title="여길 누르면 가입하는거에요">
						<input type="button" class="goBack" id="goBack" name="goBack" value="돌아가기" onclick="javascript:viewLogin();" title="취소하고 전화면으로 갈 수 있어요.">
					</form>
				</div>
			</td>
		</tr>
	</table>
	<%
} 
else 
{
	int    countPost = 0;
	String selectSql = "";

	//로그인 계정에 대한 포스팅 갯수를 얻는다.
	selectSql = "select count(*) as countpost from board where id='" + s_id + "'";

	myBoard.DBOpen();
	myBoard.OpenQuery(selectSql);
	myBoard.ResultNext();
	countPost = myBoard.getInt("countpost");
	myBoard.DBClose();
	%>
	<table border="0" cellpadding="0" cellspacing="0" class="none">
		<tr id="trUser" name="trUser" class="none">
			<td class="none">
				<div class="userInfo">
					<!--로그인/회원가입했을 때 사진이 보이는 영역-->
					<div style="display:flex; margin-left:30px;">
						<img src="<%= m_BaseURL %>/images/<%= s_photo %>"
							style="width: 110px; height:110px; padding-top:0px; margin:0 20px 20px 0; border-radius:100%;"/>
						<p style="margin-top:30px; ">
							<strong><%= s_id%></strong>님<br>환영합니다.
						</p>
					</div>
					<div style="margin-bottom: 25px" id="about">
						<a href="<%= m_BaseURL %>/index.jsp?menu=my">
						<span>MY POSTING<!-- &nbsp;&#47;-->&nbsp;<span style="color: red;"><%=countPost%></span>건
						</span>
						</a>
					</div>
					<input type="submit" id="modify" name="modify" onclick="javascript:viewModi();" value="정보수정">
					<input type="button" id="logout" name="logout" value="로그아웃">
				</div>
			</td>
		</tr>
		<tr id="trModi" name="trModi" style="display:none" class="none">
			<td class="none">
				<div class="modify">
					<form id="modifyForm" name="modifyForm" method="post" onsubmit="return modiChk();" action="<%= m_BaseURL %>/member/modiProcess.jsp">
						<div>
							<input type="hidden" name='photo' id="photo" value="<%= s_photo %>">
							<img src="<%= m_BaseURL %>/images/<%= s_photo %>" id="m_photo_img" name="m_photo_img" onclick="javascript:newPopup('<%= m_BaseURL %>/member/select.jsp?img=<%= s_photo %>');" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0; cursor:pointer;" 
					title="사진을 누르면 프로필 사진을 변경 할 수 있어요!!"/>
						</div>

						<input type="text" id="oldPw" name="oldPw" placeholder="현재 비밀번호" title="현재 비밀번호를 입력해주세요.">
						<input type="password" id="newPw" name="newPw" 
							autocomplete="off"  placeholder="바꿀 비밀번호" title="바꿀 비번을 입력해주세요.">
						<input type="password" id="newPwChk" name="newPwChk" 
							autocomplete="off"  placeholder="비밀번호 확인" title="입력한 비번이 맞는지 다시확인~">
						<br>
						<input type="submit" id="modiGo" name="modiGo" value="확인" title="여길 누르면 수정됩니다.">
						<input type="button" class="goBack" id="goBack" name="goBack" value="돌아가기" onclick="javascript:viewUser();" title="취소하고 전화면으로 갈 수 있어요.">
					</form>
				</div>
			</td>
		</tr>
	</table>
	<%
}
%>
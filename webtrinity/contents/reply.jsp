<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String pNo        = request.getParameter("no");	        //게시물 번호
%>
<script language="javascript">	
	/****댓글 작성을 누르면 호출되는 함수****/
	function reFormChk()
	{
		
		if(replyForm.replyText.value == "")
		{
			alert("내용을 입력하세요.");
			replyForm.replyText.focus();
			
			return false;
		}
		replyForm.submit();
	}
</script>
<%
//========게시판 구분에 따른 댓글칸 색상 
if(pMenu.equals("hs")||pMenu.equals("hq"))
{
	%>
	<div class="html_replyWrite">
	<%
}else if(pMenu.equals("cs")||pMenu.equals("cq"))
{
	%>
	<div class="css_replyWrite">
	<%
}else if(pMenu.equals("js")||pMenu.equals("jq"))
{
	%>
	<div class="js_replyWrite">
	<%
}
%>	
		<form id="replyForm" name="replyForm" method="post" 
			action="<%= m_BaseURL %>/contents/reply_proc.jsp">
			<textarea id="replyText" name="replyText">reply test</textarea>
			<input type="hidden" id="menu" name="menu" value="<%= pMenu %>">
			<input type="hidden" id="category" name="category" value="<%= pCategory %>">
			<input type="hidden" id="searchKey" name="searchKey" value="<%= pSearchKey %>">
			<input type="hidden" id="pageno" name="pageno" value="<%= pPageno %>">
			<input type="hidden" id="no" name="no" value="<%= pNo%>">
			<input type="hidden" id="pIsReply" name="pIsReply" value="Y">
			<input type="button" id="replySubmit" name="replySubmit" value="댓글 등록" onclick="javascript:reFormChk();">
		</form>
	</div>
<%
	//====등록된 댓글 조회
	myBoard.DBOpen();

	String mReViewSQL = "";

	mReViewSQL += "select id, recont, rewdate, remdate ";
	mReViewSQL += "from reply where bdno = '" + pNo + "' ";
	mReViewSQL += "order by rewdate asc ";

	System.out.println("reply view sql : " + mReViewSQL);
	
	myBoard.OpenQuery(mReViewSQL);

	while(myBoard.ResultNext())
	{
		String bd_reID    = myBoard.getString("id");
		String bd_reCont  = myBoard.getString("recont");
		String bd_rewdate = myBoard.getString("rewdate");
		String bd_remdate = myBoard.getString("remdate");		

		bd_reCont = bd_reCont.replaceAll("<","&lt;");
		bd_reCont = bd_reCont.replaceAll(">","&gt;");
		bd_reCont = bd_reCont.replaceAll("\r\n","<br>");		
		
		bd_rewdate = bd_rewdate.substring(2,10);
		bd_rewdate = bd_rewdate.replaceAll("-", ".");		
	%>
		<div class="replyView">
			<table>					
				<tr style="border-bottom: 1px solid #FEE9C6;">
					<td>
						<div class="replyContent"><%= bd_reCont %>		
							<span style="color: gray; font-size: 12px;"><%= bd_rewdate %></span>
						</div>
					</td>
					<td>
						
					<%
					if (s_id != null && s_id.equals(bd_reID))
					{
						%>
						<div class="replyWriter">
							<span>
								<a href="#" style="color:#3A70C0; font-weight: bold;">수정</a> | <a href="#" style="color:#3A70C0; font-weight: bold;">삭제</a>
							<span>
						</div>
						<%
					}else
					{
						%>
						<div class="replyWriter">
							<!--<span>
								<a href="#" style="color:#3A70C0; font-weight: bold;">수정</a> | <a href="#" style="color:#3A70C0; font-weight: bold;">삭제</a>
							<span>-->
						</div>
						<%
					}
					%>						
					</td>
				</tr>
			</table>
		</div>
	<%
	}
myBoard.CloseQuery();
myBoard.DBClose();
%>
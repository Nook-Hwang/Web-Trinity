<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
//=========================== 파라메터 분석 영역 [ 시작 ]
String pCategory  = request.getParameter("category");	//검색 범위 
String pSearchKey = request.getParameter("searchKey");	//검색어
String pPageno    = request.getParameter("pageno");	    //페이지 수
String pNo        = request.getParameter("no");	        //게시물 번호
String pYourID    = request.getParameter("id");	        //아이디
String pIsReply   = request.getParameter("isreply");	//댓글
//=========================== 파라메터 분석 영역 [ 종료 ]

//=========================== 페이징 처리를 위한 변수 선언 영역 [ 시작 ]
String mPageParam  = "";//페이징 처리용 파라메터
String mSQL        = "";
//=========================== 페이징 처리를 위한 변수 선언 영역 [ 종료 ]

//=========================== 파라메터를 검증 및 처리한다. [ 시작 ]
if(pCategory == null)
{
	pCategory = "";
}
if(pSearchKey == null)
{
	pSearchKey = "";
}
if(pPageno == null)
{
	pPageno = "0";
}
if(pIsReply == null || pIsReply.equals(""))
{
	pIsReply = "N";
}

mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey + "&pageno=" + pPageno + "&id=" + pYourID;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]
%>


<!--본문 영역-->
<div class="article" style="height: auto;">
	<%@ include file="../include/head.jsp" %>
	<%
	//==================== [ 출력해야 할 게시물 정보를 선언한 구간 - 시작 ]
	String bd_no       = "";
	String bd_id       = "";
	String bd_title    = "조회된 게시물이 없습니다.";
	String bd_contents = "조회된 게시물이 없습니다.";
	String bd_wdate    = "";
	String bd_mdate    = "";
	String bd_hit      = "";
	String bd_like     = "";
	//==================== [ 출력해야 할 게시물 정보를 선언한 구간 - 종료 ]

	//======================= 게시물 정보 가져오기 [ 시작 ]
	myBoard.DBOpen();

	mSQL += "select bdno, id, title, contents, wdate, mdate, type, hit, bdlike ";
	mSQL += "from board ";
	mSQL += "where bdno= '" + pNo + "'";
	myBoard.OpenQuery(mSQL);
	if( myBoard.ResultNext() == true)
	{
		bd_no       = myBoard.getString("bdno");
		bd_id       = myBoard.getString("id");
		bd_title    = myBoard.getString("title");
		bd_contents = myBoard.getString("contents");
		bd_wdate    = myBoard.getString("wdate");
		bd_mdate    = myBoard.getString("mdate");
		pMenu       = myBoard.getString("type");
		bd_hit      = myBoard.getString("hit");
		bd_like     = myBoard.getString("bdlike");

		//DB에 저장된 YYYY-MM-DD HH:mm:ss에서 YY-MM-DD까지 자르고
		//연월일 사이의 -를 .으로 바꿈

		bd_wdate = bd_wdate.substring(2,10);
		bd_wdate = bd_wdate.replaceAll("-", ".");

		bd_contents = bd_contents.replaceAll("<","&lt;");
		bd_contents = bd_contents.replaceAll(">","&gt;");
		bd_contents = bd_contents.replaceAll("\r\n","<br>");		
	}
	myBoard.CloseQuery();

	//조회수를 증가시킨다.
	mSQL = "update board set hit = hit + 1 where bdno = '" + pNo + "'";
	myBoard.Execute(mSQL);	
	//======================= 게시물 정보 가져오기 [ 종료 ]
	%>
	<table class="board">
		<%
		if(pMenu.equals("hs")||pMenu.equals("hq"))
		{
			%>
			<tr style="border: 1px solid #FDDDD3;">
				<td style="background-color:  #FDDDD3;">
					<div class="html_boardTitle"><%= bd_title %></div>
				</td>
			</tr>
			<%
		}else if(pMenu.equals("cs")||pMenu.equals("cq"))
		{
			%>
			<tr style="border: 1px solid #B9E4FF;">
				<td style="background-color:  #B9E4FF;">
					<div class="css_boardTitle"><%= bd_title %></div>
				</td>
			</tr>
			<%
		}else if(pMenu.equals("js")||pMenu.equals("jq"))
		{
			%>
			<tr style="border: 1px solid #FEE9C6;">
				<td style="background-color:  #FEE9C6;">
					<div class="js_boardTitle"><%= bd_title %></div>
				</td>
			</tr>
			<%
		}
		%>
		<tr>
			<td style="height: 20px; border-bottom: 2px solid #F2F2F2">
				<table>
					<tr>
						<td>
							<div class="boardNo" style="width:60px"><%= bd_no %></div>
						</td>
						<td>				
							<div class="boardNo" style="width:160px">최초등록 (<%= bd_wdate %>)</div>
						</td>							
						<td>
						<%
						if (s_id != null && s_id.equals(bd_id))
						{
							%>
							<div class="boardOption" style="font-weight: bold;">
								<form id="boardModify" name="boardModify" method="get" action="#">
									<a href="modify.jsp?no=<%=bd_no%>&<%=mPageParam%>" style="color:#3A70C0;">수정</a> | <a href="<%= m_BaseURL %>/contents/delete.jsp?no=<%=bd_no%>&<%=mPageParam%>" style="color:#ff6600;">삭제</a>	 
								</form> 								
							</div>
							<%
						} else 
						{
							%>
							<div class="boardOption" style="color:#3A70C0; font-weight: bold;"></div>
							<%
						}					
						%>
						</td>
						<td>
							<div class="boardHit"><%= bd_hit %></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="border-bottom: 2px solid #f2f2f2;" >
				<div class="boardContent" style="text-align:left"><%= bd_contents %></div>
			</td>
		</tr>
		<tr>
			<td>
				<script language="javascript">	

					function AddLike()
					{
						var param = "no=<%= pNo %>";
						$.ajax({
						  url: '<%= m_BaseURL %>/contents/like.jsp',
						  type: 'get',
						  data: param,
						  dataType: 'html',
						  success: function(response) 
						  {
							// 성공 시 동작
							response = response.trim();
							alert(response);
							location.reload();
						  },
						  fail: function(error) 
						  {
							// 실패 시 동작
						  },
						  always: function(response) 
						  {
							// 성공하든 실패하든 항상 할 동작
						  }
						});
					}

				</script>
				<div class="boardlike" style="text-align: center; margin-top: 40px;">
					<button type="button" style="width: 100px; height: 30px; background-color: #C3D69B; margin-bottom: 20px; border: 0px;" onclick="javascript:AddLike();">추천 <%= bd_like %></button>&nbsp;&nbsp;
                    <button type="button" style="width: 100px; height: 30px; margin-bottom: 20px; border: 0px;">
						<a href="index.jsp?<%= mPageParam %>">목록으로</a>
					</button>
				</div>
				<%
				if(bd_mdate == null || bd_mdate.equals(""))
				{
					%>
					<div class="boardlike" style="float: right; margin-bottom: 20px; margin-right: 40px;"></div>
					<%
				} else 
				{
					bd_mdate = bd_mdate.substring(2,10);
					bd_mdate = bd_mdate.replaceAll("-", ".");
					%>
					<div class="boardlike" style="float: right; margin-bottom: 20px; margin-right: 40px;"> 수정일자 <%= bd_mdate %></div>
					<%
				}
				%>					
			</td>
		</tr>
	</table>	
	<%
	String mClass= "";
	//========게시판 구분에 따른 댓글칸 색상 
	if(pMenu.equals("hs")||pMenu.equals("hq"))
	{
		mClass = "html_replyWrite";
	}else if(pMenu.equals("cs")||pMenu.equals("cq"))
	{
		mClass = "css_replyWrite";
	}else if(pMenu.equals("js")||pMenu.equals("jq"))
	{
		mClass = "js_replyWrite";
	}
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
	<div class="<%= mClass %>">
		<form id="replyForm" name="replyForm" method="post" 
			action="<%= m_BaseURL %>/contents/reply_proc.jsp">
			<textarea id="replyText" name="replyText">reply test</textarea>
			<input type="hidden" id="menu" name="menu" value="<%= pMenu %>">
			<input type="hidden" id="category" name="category" value="<%= pCategory %>">
			<input type="hidden" id="searchKey" name="searchKey" value="<%= pSearchKey %>">
			<input type="hidden" id="id" name="id" value="<%= pYourID %>">
			<input type="hidden" id="pageno" name="pageno" value="<%= pPageno %>">
			<input type="hidden" id="no" name="no" value="<%= pNo%>">
			<input type="button" id="replySubmit" name="replySubmit" value="댓글 등록" onclick="javascript:reFormChk();">
		</form>
	</div>
	<div class="replyView">
		<table>
		<%
		//댓글 목록을 표시한다.
		mSQL  = "select reno,id,recont,rewdate ";
		mSQL += "from reply ";
		mSQL += "where bdno= '" + pNo + "'";
		mSQL += "order by rewdate desc ";

		myBoard.OpenQuery(mSQL);
		while( myBoard.ResultNext())
		{
			String re_no      = myBoard.getString("reno");
			String re_id      = myBoard.getString("id");
			String re_recont  = myBoard.getString("recont");
			String re_rewdate = myBoard.getString("rewdate");

			re_rewdate = re_rewdate.substring(2,10);
			re_rewdate = re_rewdate.replaceAll("-", ".");

			re_recont = re_recont.replaceAll("<","&lt;");
			re_recont = re_recont.replaceAll(">","&gt;");
			re_recont = re_recont.replaceAll("\r\n","<br>");	
			%>
			<tr style="border-bottom: 1px solid #FEE9C6;">
				<td>
					<div class="replyContent"><%= re_recont %><span style="color: gray; font-size: 12px;">(<%= re_rewdate %>)</span></div>
				</td>
				<td>
					<div class="replyWriter"><%= re_id %></div>
				</td>
				<td>
					<div class="replyWriter">
					<%
					if(s_id != null && s_id.equals(re_id))
					{
						%>
						<span>
							<a href="<%= m_BaseURL %>/contents/reply_del.jsp?reno=<%= re_no %>&no=<%=bd_no%>&<%=mPageParam%>" style="color:#3A70C0; font-weight: bold;">삭제</a>
						<span>
						<%
					}
					%>
					</div>
				</td>
			</tr>
			<%
		}
		myBoard.CloseQuery();

		myBoard.DBClose();
		%>
		</table>
	</div>
</div>	

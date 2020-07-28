<%@ page contentType="text/html; charset=UTF-8" %>
<%
//=========================== 파라메터 분석 영역 [ 시작 ]
String pCategory  = request.getParameter("category");	//검색 범위 
String pSearchKey = request.getParameter("searchKey");	//검색어
String pPageno    = request.getParameter("pageno");	    //페이지 수
String pYourID    = request.getParameter("id");	    //페이지 수
//=========================== 파라메터 분석 영역 [ 종료 ]

//=========================== 페이징 처리를 위한 변수 선언 영역 [ 시작 ]
String mSQL   = "";
String mWhere = "";
int    mTotalCount = 0; //전체 검색된 게시물 갯수
int    mSeqNo      = 0;
int    mPageNo     = 0; //페이지 번호
int    mPerPage    = 10; //페이당 목록 갯수
int    mStartPage  = 0; //시작페이번호
int    mEndPage    = 0; //종료페이지번호
int    mMaxPage    = 0; //전체 페이지 갯수
String mPageParam  = "";//페이징 처리용 파라메터
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
mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey + "&id=" + pYourID;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]

//페이지 번호를 얻는다.
try
{
	mPageNo = Integer.parseInt(pPageno);
}catch(Exception e)
{
	mPageNo = 0;
}


myBoard.DBOpen();
%>
<!--본문 영역-->
<div class="article" style="height: auto;">
	<%@ include file="../include/head.jsp" %>
	<%
	//검색 조건에 따라 Where 구문을 만든다.
	if(pMenu.equals("my"))
	{
		mWhere = "id = '" + s_id + "' ";
	}else if(pMenu.equals("your"))
	{
		mWhere = "id = '" + pYourID + "' ";
	}else
	{
		mWhere = "type = '" + pMenu + "' ";		
	}
	if(!pSearchKey.equals(""))
	{
		switch(pCategory)
		{
			case "0":
				mWhere += " and ( title like '%" + pSearchKey + "%' ";
				mWhere += " or contents like '%" + pSearchKey + "%' ";
				mWhere += " or id like '%" + pSearchKey + "%' ) ";
				break;
			case "1":
				mWhere += " and title like '%" + pSearchKey + "%' ";
				break;
			case "2":
				mWhere += " and contents like '%" + pSearchKey + "%' ";
				break;
			case "3":
				mWhere += " and id like '%" + pSearchKey + "%' ";
				break;
		}
	}

	//게시물의 총 건수를 얻는다.
	mSQL  = "select count(bdno) as totalrow ";
	mSQL += "from board ";
	if(!mWhere.equals(""))
	{
		mSQL += "where " + mWhere;
	}
	myBoard.OpenQuery(mSQL);
	myBoard.ResultNext();
	mTotalCount = myBoard.getInt("totalrow");
	myBoard.CloseQuery();

	//게시물의 목록을 얻는다.
	mSQL  = "select bdno, id, title, wdate, type, hit, ";
	mSQL += "(select count(reno) from reply where bdno = board.bdno) as reno ";
	mSQL += "from board ";
	if(!mWhere.equals(""))
	{
		mSQL += "where " + mWhere + " ";
	}
	mSQL += "order by bdno desc ";
	mSQL += "limit " + (mPageNo * mPerPage) + "," + mPerPage;
	//out.print(mSQL);

	myBoard.OpenQuery(mSQL);
	%>	
		<p style="text-align: right;  height:30px; width: 1400px;">※ 총 <%= mTotalCount %>건의 자료가 조회되었습니다.</p>
	<table>
		<tr>
			<td class="boardMenu" style="width: 70px;">번호</td>
			<td class="boardMenu" style="width: 100px;">분류</td>
			<td class="boardMenu">제목</td>
			<td class="boardMenu" style="width: 120px;">글쓴이</td>
			<td class="boardMenu" style="width: 70px;">댓글</td>
			<td class="boardMenu" style="width: 70px;">날짜</td>
			<td class="boardMenu" style="width: 80px;">조회</td>
		</tr>
		<%
		mSeqNo = mTotalCount - (mPerPage * mPageNo);
		while(myBoard.ResultNext())
		{
			String bdno  =  myBoard.getString("bdno");
			String id    =  myBoard.getString("id");
			String title =  myBoard.getString("title");
			String wdate =  myBoard.getString("wdate");				
			String hit   =  myBoard.getString("hit");
			String reno  =  myBoard.getString("reno");
			String type  =  myBoard.getString("type");
			
			//============= 게시물의 데이터 가공 영역 [ 시작 ]
			title = title.replaceAll("<","&lt;");
			title = title.replaceAll(">","&gt;");

			wdate = wdate.substring(2,10);
			wdate = wdate.replaceAll("-", ".");

			if(type.equals("hs"))
			{
				type = "<font color=#ff6600>HTML</font>/STUDY";
			}
			if(type.equals("hq"))
			{
				type = "<font color=#ff6600>HTML</font>/Q&amp;A";
			}
			if(type.equals("cs"))
			{
				type = "<font color=#ff6600>CSS</font>/STUDY";
			}
			if(type.equals("cq"))
			{
				type = "<font color=#ff6600>CSS</font>/Q&amp;A";
			}
			
			if(type.equals("js"))
			{
				type = "<font color=#ff6600>JS</font>/STUDY";
			}
			if(type.equals("jq"))
			{
				type = "<font color=#ff6600>JS</font>/Q&amp;A";
			}
			//=============  게시물의 데이터 가공 영역 [ 종료 ]
			%>
			<tr>
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; font-size: 13px;"><%= mSeqNo %></td>
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; font-size: 13px;">[ <%= type %> ]</td>
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; text-align:left; padding-left: 15px;">
					<a href="view.jsp?<%= mPageParam %>&pageno=<%= mPageNo %>&no=<%= bdno %>"><%= title %></a>
				</td>				
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2;">
					<a href="index.jsp?menu=your&category=<%= pCategory %>&searchKey=<%= pSearchKey %>&id=<%= id %>"><%= id %></a></td>
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; font-size: 13px;"><%= reno %></td>
				<td style="border-right: 1px solid #ffffff; border-bottom: 1px solid #F2F2F2; font-size: 13px;"><%= wdate %></td>
				<td style="border-bottom: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; font-size: 13px;"><%= hit %></td>
			</tr>
			<%
			mSeqNo--;
		}
		if(mTotalCount <= 0)
		{
			%>
			<tr>
				<td style="border-right: 1px solid #FFFFFF; border-bottom: 1px solid #F2F2F2; height:100px;" colspan="10">
					조회된 게시물이 없습니다.
				</td>
			</tr>
			<%
		}
		%>
	</table>

	<!--검색 폼-->
	<script language="javascript">
	
		//검색 함수
		function doSearch()
		{
			//검색어가 빈 상태에서 검색 버튼을 누르면
			if (searchForm.searchKey.value == "")
			{
				alert("검색어를 입력해야 해요!");
				return;
			}else
			{
				document.searchForm.submit();
			}
		}

	</script>
	<span class="searchForm">		
		<form id="searchForm" name="searchForm" method="get" action="index.jsp">
			<input type="hidden" id="menu" name="menu" value="<%= pMenu %>">
			<input type="hidden" id="id" name="id" value="<%= pYourID %>">
			<select id="category" name="category" style="height: 32px;">
				<option value="0" <% if(pCategory.equals("0")) out.print("selected"); %>>전체</option>
				<option value="1" <% if(pCategory.equals("1")) out.print("selected"); %>>제목</option>
				<option value="2" <% if(pCategory.equals("2")) out.print("selected"); %>>내용</option>
				<option value="3" <% if(pCategory.equals("3")) out.print("selected"); %>>글쓴이</option>
			</select>
			<input type="text" class="searchKey" id="searchKey" name="searchKey" size="50" value="<%= pSearchKey %>" placeholder="여기에 검색어를 입력하세요.">
			<input type="button" class="searchButton" value="검색" onclick="javascript:doSearch();">
		</form>
	</span>

	<span>
		<form id="mCtg" name="mCtg" style="display:inline; " method="post" action="#">
			<%
			if(!pMenu.equals("my") && !pMenu.equals("your"))
			{
				if(s_id == null) 
				{
					%>
					<button class="write" onclick="alert('글을 쓰려면 로그인을 해주세요!');return false;">글쓰기</button>
					<%
				}else
				{
					%>
					<button class="write" onclick="location.href='write.jsp?<%= mPageParam %>';return false;">글쓰기</button>
					<%
				}
			}
			%>
		</form>				
	</span>	
	<%
	//========================== 페이징 처리  [ 시작 ] ===
	//최대 페이지 번호 계산
	mMaxPage = mTotalCount / mPerPage;
	if(  (mTotalCount % mPerPage) != 0)
	{
		mMaxPage = mMaxPage + 1;
	}

	//페이징 시작 블럭 계산
	mStartPage = (mPageNo / mPerPage) * mPerPage;
	//페이징 종료 블럭 계산
	mEndPage  = mStartPage + mPerPage;
	if(mEndPage > mMaxPage)
	{
		mEndPage = mMaxPage;
	}
	%>
	<div class="pageNumber">
	<%
	if( mStartPage > (mPerPage-1))
	{
		%>
		<a href="index.jsp?<%= mPageParam %>&pageno=<%= mStartPage - 1 %>">◀</a>
		<%
	}
	for(int i=mStartPage;i<mEndPage;i++)
	{
		if(i == mPageNo)
		{
			%><a href="index.jsp?<%= mPageParam %>&pageno=<%= i %>"><strong><font color="#ff6600"><%= i + 1 %></strong></font></a> <%
		}else
		{
			%><a href="index.jsp?<%= mPageParam %>&pageno=<%= i %>"><%= i + 1 %></a> <%
		}
	}
	if( mMaxPage > mEndPage )
	{
		%>
		<a href="index.jsp?<%= mPageParam %>&pageno=<%= mEndPage %>">▶</a>
		<%
	}
	//========================== 페이징 처리  [ 종료 ] ===
	%>
	</div>
	<%
	myBoard.CloseQuery();
	%>	
</div>	
<%
myBoard.DBClose();
%>
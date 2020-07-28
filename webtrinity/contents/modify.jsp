<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
//=========================== 파라메터 분석 영역 [ 시작 ]
String pCategory  = request.getParameter("category");	//검색 범위 
String pSearchKey = request.getParameter("searchKey");	//검색어
String pPageno    = request.getParameter("pageno");	    //페이지 수
String pNo        = request.getParameter("no");	        //게시물 번호
String pYourID    = request.getParameter("id");           //다른 사람의 게시물 작성 ID
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
mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey + "&pageno=" + pPageno + "&no=" + pNo;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]
request.setCharacterEncoding("UTF-8");
%>

<script language="javascript">

	/****취소 버튼 클릭시 발생하는 이벤트****/
	$(document).ready(function()
	{
		$('#cancel').click(function()
		{
			var result = confirm('글수정을 취소하면 이전 페이지로 이동합니다.\n글수정을 취소하시겠습니까?');
			if(result) 
			{
				document.location = "view.jsp?<%= mPageParam %>";
			}else 
			{
				return false;
			} 
		}); 
	});

	function formCheck()
	{
		
		if(writeForm.title.value == "")
		{
			alert("제목을 입력하세요.");
			writeForm.title.focus();
			return;
		}
		if(writeForm.content.value == "")
		{
			alert("내용을 입력하세요.");
			writeForm.content.focus();
			return;
		}
		writeForm.submit();
	}
</script>

<!--본문 영역-->
<div class="article" style="height: auto;">
	<%@ include file="../include/head.jsp" %>
	<%
	//==================== [ 출력해야 할 게시물 정보를 선언한 구간 - 시작 ]
	String bd_no       = "";
	String bd_id       = "";
	String bd_type     = "";
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
		bd_type     = myBoard.getString("type");
		bd_hit      = myBoard.getString("hit");
		bd_like     = myBoard.getString("bdlike");

		//DB에 저장된 YYYY-MM-DD HH:mm:ss에서 YY-MM-DD까지 자르고
		//연월일 사이의 -를 .으로 바꿈

		bd_wdate = bd_wdate.substring(2,10);
		bd_wdate = bd_wdate.replaceAll("-", ".");
	}
	myBoard.DBClose();
	//======================= 게시물 정보 가져오기 [ 종료 ]
	%>

	<div class="writeArea">
		<form id="writeForm" name="writeForm" action="<%= m_BaseURL %>/contents/modify_proc.jsp" method="post">
			<input type="hidden" id="menu" name="menu" value="<%= pMenu %>">
			<input type="hidden" id="category" name="category" value="<%= pCategory %>">
			<input type="hidden" id="searchKey" name="searchKey" value="<%= pSearchKey %>">
			<input type="hidden" id="pageno" name="pageno" value="<%= pPageno %>">
			<input type="hidden" id="no" name="no" value="<%= bd_no %>">
			<div class="writeTitle">
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요." value="<%= bd_title %>"/>	
			</div>
			<div class="writeContent">
				<textarea id="content" name="content" rows="30" style="height:300px" placeholder="내용을 입력하세요."><%= bd_contents %></textarea>
			</div>
			<div style="text-align: right; margin-right: 282px;">
				<input type="button" id="write" name="write" value="저장하기" onclick="javascript:formCheck();">
				<input type="button" id="cancel" name="cancel" value="취소">
			</div>
		</form>
	</div>	
</div>	

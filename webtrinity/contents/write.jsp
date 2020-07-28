<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");
//=========================== 파라메터 분석 영역 [ 시작 ]
String pCategory  = request.getParameter("category");	//검색 범위 
String pSearchKey = request.getParameter("searchKey");	//검색어
String pPageno    = request.getParameter("pageno");	    //페이지 수
String pYourID    = request.getParameter("id");	        //게시물 번호
//=========================== 파라메터 분석 영역 [ 종료 ]

//=========================== 페이징 처리를 위한 변수 선언 영역 [ 시작 ]
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
if(pPageno == null)
{
	pPageno = "0";
}
mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]

%>
<script language="javascript">

	/****취소 버튼 클릭시 발생하는 이벤트****/
	$(document).ready(function()
	{
		$('#cancel').click(function()
		{
			var result = confirm('글쓰기를 취소하면 이전 페이지로 이동합니다.\n글쓰기를 취소하시겠습니까?');
			if(result) 
			{
				document.location = "index.jsp?<%= mPageParam %>";
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

	<div class="writeArea">
		<form id="writeForm" name="writeForm" action="<%= m_BaseURL %>/contents/write_proc.jsp" method="post">
			<input type="hidden" id="menu" name="menu" value="<%= pMenu %>">
			<input type="hidden" id="category" name="category" value="<%= pCategory %>">
			<input type="hidden" id="searchKey" name="searchKey" value="<%= pSearchKey %>">
			<input type="hidden" id="pageno" name="pageno" value="<%= pPageno %>">
			<div class="writeTitle">
				<input type="text" id="title" name="title" placeholder="제목을 입력하세요." value="title test input."  maxlength="50"/>	
			</div>
			<div class="writeContent">
				<textarea id="content" name="content" rows="30" style="height:300px" placeholder="내용을 입력하세요.">contents test input.</textarea>
			</div>
			<div style="text-align: right; margin-right: 282px;">
				<input type="button" id="write" name="write" value="등록" onclick="javascript:formCheck();">
				<input type="button" id="cancel" name="cancel" value="취소">
			</div>
		</form>
	</div>	
</div>	

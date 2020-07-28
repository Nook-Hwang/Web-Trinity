<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../config/config.jsp" %>
<%@ page import="java.util.*, java.text.*" %>
<%
request.setCharacterEncoding("UTF-8");
//=========================== 파라메터 분석 영역 [ 시작 ]
String pMenu      = request.getParameter("menu");	      //게시판 구분 
String pCategory  = request.getParameter("category");	  //검색 범위 
String pSearchKey = request.getParameter("searchKey");    //검색어
String pPageno    = request.getParameter("pageno");	      //페이지 수
String pTitle     = request.getParameter("title");	      //제목
String pContent   = request.getParameter("content");      //내용
String pID        = (String)session.getAttribute("s_id"); //아이디	
String pNO        = "";                                   //게시물 번호
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
mPageParam = "menu=" + pMenu + "&category=" + pCategory + "&searchKey=" + pSearchKey;
//=========================== 파라메터를 검증 및 처리한다. [ 종료 ]

myBoard.DBOpen();

//=========================== 게시물을 등록한다.
mSQL += "insert into board (id, title, contents, type) ";
mSQL += "values ('" + pID + "','" + pTitle + "','" + pContent + "','" + pMenu + "')";
myBoard.Execute(mSQL);

//=========================== 등록된 게시물을 얻는다.
mSQL = "select last_insert_id() as bdno ";
myBoard.OpenQuery(mSQL);
myBoard.ResultNext();
pNO =  myBoard.getString("bdno");

myBoard.DBClose();

%>
<script language="javascript">
	
	alert("게시물을 등록하였습니다.");
	document.location = "<%= m_BaseURL %>/view.jsp?no=<%= pNO %>&<%= mPageParam %>";
</script>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../config/config.jsp" %>
<%
//=========================== 파라메터 분석 영역 [ 시작 ]
String pNo        = request.getParameter("no");	        //게시물 번호
//=========================== 파라메터 분석 영역 [ 종료 ]

//=========================== 페이징 처리를 위한 변수 선언 영역 [ 시작 ]
String mSQL        = "";
//=========================== 페이징 처리를 위한 변수 선언 영역 [ 종료 ]

request.setCharacterEncoding("UTF-8");

myBoard.DBOpen();

//=========================== 게시물을 등록한다.
mSQL += "update board ";
mSQL += "set ";
mSQL += "bdlike = bdlike + 1 ";
mSQL += "where bdno = '" + pNo + "' ";

myBoard.Execute(mSQL);

myBoard.DBClose();

%>
추천하였습니다.
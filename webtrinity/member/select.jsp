<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../config/config.jsp" %>
<%
String mSelectedImg   = request.getParameter("img");
if(mSelectedImg == null)
{
	mSelectedImg = "";
}
%>
<script language="javascript">
	
	function SelectDone()
	{
		if(SelectForm.select.value == null || SelectForm.select.value == "")
		{
			alert("프로필 사진을 선택하세요.");
			return;
		}
		<%
		if(mSelectedImg.equals(""))
		{
			%>
			opener.joinForm.photo.value = SelectForm.select.value;
			opener.photo_img.src = "<%= m_BaseURL %>/images/" + SelectForm.select.value;
			<%
		}else
		{
			%>
			opener.modifyForm.photo.value = SelectForm.select.value;
			opener.m_photo_img.src = "<%= m_BaseURL %>/images/" + SelectForm.select.value;
			<%
		}
		%>
		window.close();		
	}

</script>

<form id="SelectForm" name="SelectForm">
	<table border="1">
		<tr>
			<td><img src="<%= m_BaseURL %>/images/type_a.png" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_b.png" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_c.png" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0;"></td>
			<td><img src="<%= m_BaseURL %>/images/type_d.png" style="width:130px; height:130px; padding-top:0px; margin:19px 0 10px 0;"></td>
		</tr>
		<tr>
			<td><input type="radio" id="select" name="select" value="type_a.png" <% if(mSelectedImg.equals("type_a.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_b.png" <% if(mSelectedImg.equals("type_b.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_c.png" <% if(mSelectedImg.equals("type_c.png")) out.print("checked"); %>></td>
			<td><input type="radio" id="select" name="select" value="type_d.png" <% if(mSelectedImg.equals("type_d.png")) out.print("checked"); %>></td>
		</tr>
	</table>
	<a href="javascript:SelectDone();">선택완료</a>
</form>

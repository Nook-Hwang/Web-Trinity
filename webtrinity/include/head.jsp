<%@ page contentType="text/html; charset=UTF-8" %>
<%
if(pMenu.equals("my"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/posting.css">
	<div class="title">
		<p class="title" style="margin-bottom: 30px;">&lt;<%= s_id%>_POSTING&#47;&gt;</p>
	</div>
	<div class="mypostlogo">
		<img src="<%= m_BaseURL %>/images/<%= s_photo %>" style="width: 206px; height: 206px; margin: 20px 0 20px 0; border-radius: 100%;">
	</div>
	<%
}
if(pMenu.equals("your"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/posting.css">
	<div class="title">
		<p class="title" style="margin-bottom: 30px;">&lt;<%= pYourID %>_POSTING&#47;&gt;</p>
	</div>
	<div class="mypostlogo">
		<img src="<%= m_BaseURL %>/images/%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84.jpg" style="width: 192px; height: 192px; margin: 20px 0 20px 0; border-radius: 100%;">
	</div>
	<%
}
if(pMenu.equals("hs"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/html.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;HTML&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">
		<!--<span class="titleSub">&lt;STUDY&#47;&gt;</span>-->
		<div class="intro">
			<p class="intro">
			HTML은 Hyper Text Markup Language 약어로 HyperText(웹 페이지에서 다른 페이지로 이동할 수 있도록 하는 것) 기능을 가진 문서를 만드는 언어입니다.
			<br>
			다시 말해, 구조를 설계할 때 사용되는 언어로 hyper link 시스템을 가지고 있으며, 흔히 말하는 웹 페이지를 위한 마크업 언어라고 할 수 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;STUDY&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 HTML에 관하여 자신이 학습한 내용을 공유하는 곳입니다.</p>
	</div>
	<%
}
if(pMenu.equals("hq"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/html.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;HTML&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">
		<!--<span class="titleSub">&lt;STUDY&#47;&gt;</span>-->
		<div class="intro">
			<p class="intro">
			HTML은 Hyper Text Markup Language 약어로 HyperText(웹 페이지에서 다른 페이지로 이동할 수 있도록 하는 것) 기능을 가진 문서를 만드는 언어입니다.
			<br>
			다시 말해, 구조를 설계할 때 사용되는 언어로 hyper link 시스템을 가지고 있으며, 흔히 말하는 웹 페이지를 위한 마크업 언어라고 할 수 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;Q&amp;A&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 HTML에 관한 궁금증을 해결할 수 있는 곳입니다.</p>
	</div>
	<%
}
if(pMenu.equals("cq"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/css.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;CSS&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">		
		<div class="intro">
			<p class="intro">
			CSS란 ‘Cascading Style Sheet’로 HTML로 만들어진 문서의 텍스트 색상이나 크기, 이미지 크기나 위치, 표의 색상, 배치방법 등 웹 문서의 디자인 요소를 담당하는 언어입니다. 이는 HTML이 문서의 구조의 역할이라면, CSS는 문서의 디자인 및 배치의 역할을 한다고 생각하시면 편합니다. 이러한 CSS는 기술방식에 따라 ‘내부 CSS’와 ‘외부 CSS’로 나눠질 수 있으며, 다양한 방식이 연구되고 있는 요즘 CSS는 더욱 더 화려하고 유여한 디자인을 추구하는 형태로 발전해 가고 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;Q&amp;A&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 CSS에 관한 궁금증을 해결할 수 있는 곳입니다.</p>
	</div>
	<%
}
if(pMenu.equals("cs"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/css.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;CSS&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">
		<!--<span class="titleSub">&lt;STUDY&#47;&gt;</span>-->
		<div class="intro">
			<p class="intro">
			CSS란 ‘Cascading Style Sheet’로 HTML로 만들어진 문서의 텍스트 색상이나 크기, 이미지 크기나 위치, 표의 색상, 배치방법 등 웹 문서의 디자인 요소를 담당하는 언어입니다. 이는 HTML이 문서의 구조의 역할이라면, CSS는 문서의 디자인 및 배치의 역할을 한다고 생각하시면 편합니다. 이러한 CSS는 기술방식에 따라 ‘내부 CSS’와 ‘외부 CSS’로 나눠질 수 있으며, 다양한 방식이 연구되고 있는 요즘 CSS는 더욱 더 화려하고 유여한 디자인을 추구하는 형태로 발전해 가고 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;STUDY&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 CSS에 관하여 자신이 학습한 내용을 공유하는 곳입니다.</p>
	</div>
	<%
}
if(pMenu.equals("js"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/js.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;JAVASCRIPT&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">
		<!--<span class="titleSub">&lt;STUDY&#47;&gt;</span>-->
		<div class="intro">
			<p class="intro">
			자바스크립트는 ‘웹페이지에 생동감을 불어넣기 위해’ 만들어진 프로그래밍 언어입니다.
			자바스크립트로 작성한 프로그램을 스크립트(script) 라고 부릅니다. 스크립트는 웹페이지의 HTML 안에 작성할 수 있는데, 웹페이지를 불러올 때 스크립트가 자동으로 실행됩니다.
			스크립트는 특별한 준비나 컴파일 없이 보통의 문자 형태로 작성할 수 있고, 실행도 할 수 있습니다.
			이런 관점에서 보면 자바스크립트는 자바(Java)와는 매우 다른 언어라고 할 수 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;STUDY&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 JAVASCRIPT에 관하여 자신이 학습한 내용을 공유하는 곳입니다.</p>
	</div>
	<%
}
if(pMenu.equals("jq"))
{
	%>
	<link rel="stylesheet" type="text/css" href="<%= m_BaseURL %>/style/js.css">
	<div class="title">
		<p class="title" style="margin-bottom: 25px;">&lt;JAVASCRIPT&#47;&gt;</p>
	</div>	
	<div class="contents" style="margin-top:25px;">
		<!--<span class="titleSub">&lt;STUDY&#47;&gt;</span>-->
		<div class="intro">
			<p class="intro">
			자바스크립트는 ‘웹페이지에 생동감을 불어넣기 위해’ 만들어진 프로그래밍 언어입니다.
			자바스크립트로 작성한 프로그램을 스크립트(script) 라고 부릅니다. 스크립트는 웹페이지의 HTML 안에 작성할 수 있는데, 웹페이지를 불러올 때 스크립트가 자동으로 실행됩니다.
			스크립트는 특별한 준비나 컴파일 없이 보통의 문자 형태로 작성할 수 있고, 실행도 할 수 있습니다.
			이런 관점에서 보면 자바스크립트는 자바(Java)와는 매우 다른 언어라고 할 수 있습니다.
			</p>				
		</div>		
	</div>	
	<br>
	<div class="title">
		<p class="titleSub">&lt;Q&amp;A&#47;&gt;</p>
		<p class="titleSubIntro">이 곳은 JAVASCRIPT에 관하여 궁금한 내용을 공유하는 곳입니다.</p>
	</div>
	<%
}
%>	

<%@ page contentType="text/html; charset=UTF-8" %>
	<!--본문 영역-->
<div class="article">
	<!--제목-->
	<div class="title">
		<p class="title">&lt;Hello World/&gt;</p>
	</div>
	<div class="logo_article" style="text-align:center;">
		<img src="<%= m_BaseURL %>/images/pngflow.com.png" style="width: 192px;
			margin-top: 20px; margin-bottom: 20px;" alt="Cute Chick" title="코딩의 세계에 오신걸 '환 to the 영' 해요!!"/>
	</div>
	<div class="contents">
		<span>&lt;welcome&gt;</span>
			<div class="intro">				
				CODING의 세계에 오신 당신, 환영합니다!
				<br>
				<br>
				WEB TRINITY는 모든 코딩의 기본인 HTML, CSS, JAVASCRIPT를 학습하는				
				<br>
				무료 사이트입니다.
				<br>
				이 곳에서 당신의 기발한 코딩 문법과 공부 방법을 공유해 주세요.
				<br>
				당신이 IT업계 어느 분야에 위치해 있든 당신의 노하우는 이 곳,
				<br>
				WEB TRINITY에서 CODING 여행자들에게 사막의 오아시스가 될 것입니다!
				<br>
				<br>
				우리는 당신의 무궁한 발전을 기원합니다.
			</div>
		<span>&lt;/welcome&gt;</span>
	</div>

	<a name="web_trinity"></a>
	<div class="title" >
		<p class="title">&lt;Web Trinity/&gt;</p>
	</div>
	<div class="logo_article" style="text-align:center;">
		<img src="<%= m_BaseURL %>/images/webTrinity_logo_type.jpg" style="width:384px;" alt="Web Trinity" title="로고이쁘죠;ㅜ 제가 만들었어요;ㅜ"/>
	</div>
	<div class="contents">
		우리 WEB TRINITY는 간단한 HTML, CSS, JAVASCRIPT의 소개와<br>
		실습을 매일매일 올리는 <span id="selfstudy">능동학습형</span> 게시판입니다.
		<br>
		<br>
		매일 학습한 것을 올리시면서 다른 분들과 소스코드를 공유하여 실력발전을 도모합니다.
		<br>
		소스코드를 공유하면 내가 짠 코드보다 더 좋은 방법이 있는지 알아볼 수 있고,
		<br>
		다른 사용자의 코드를 리뷰하면서 코드리딩 능력을 키울 수 있습니다.
		<br>
		<br>
		우리의 로고는 각 색깔이 모여 흰색을 이루는 삼원색에서 따왔으며, 각각의 색 의미는
		<br>
		<span id="cherryred">다홍</span>(HTML), <span id="yellow">노랑</span>(JAVASCRIPT), <span id="blue">파랑</span>(CSS), <span style="color:lightgray; font-weight:bold;">흰색</span>(WEB)을 뜻합니다.
		<br>
		<br>
		이 색채가 뚜렷한 세 가지의 언어들이 모여 모든 웹을 이루는 것과 결이 같음을 표현했습니다.
		<br>
	</div>
	<!--trinity 세 이미지-->
	<!--
		div class trinity에 height 속성이 없어서 
		아래 p태그 내 글씨가 이 영역을 침범함
		따라서 height를 지정하고 margin bottom에도 값 추가
	-->
	<div class="trinity">
		<div id="htmlLogo">
			<img src="<%= m_BaseURL %>/images/html.png" class="trinityLogo" alt="HTML"/>
		</div>
		<div id="cssLogo">
			<img src="<%= m_BaseURL %>/images/css.png" class="trinityLogo" 
				style="padding-left: 20px;" alt="CSS"/>
		</div>
		<div id="jsLogo">
			<img src="<%= m_BaseURL %>/images/js.png" class="trinityLogo" alt="JAVASCRIPT"/>				
		</div>
		
	</div>
	<p id="webtrinity_kr">웹 삼총사!!!</p>	
</div>	
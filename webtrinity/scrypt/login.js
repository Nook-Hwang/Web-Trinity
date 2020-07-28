//------------------------------------버튼 클릭시 이벤트------------------------------
$(document).ready(function(){

	//로그아웃 클릭시
	$('#logout').click(function(){
		var result = confirm('로그아웃 하시겠습니까?');
		if(result) 
			{
				location.href='/webtrinity/member/logout.jsp';
			}else 
			{
				out.print("로그아웃실패");
				return false;
			} 
	}); 
	
	//돌아가기 클릭시
	$('#goBack').click(function()
	{
		$('.login').load('/webtrinity/index.jsp');
		return;
	});
});
//-------------------------------------로그인 클릭시 변수 이벤트------------------------
function loginChk()
{
	//아이디가 빈 값일 경우
	if($("#userId").val()=="")
	{
		alert("아이디를 입력하세요.");
		$("#userId").focus();
		
		return false;
	}
	//비밀번호가 빈 값일 경우
	if($("#userPw").val()=="")
	{
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		
		return false;
	}
	//아이디와 비밀번호를 같은 값으로 입력했는지 체크
	if ($("#userId").val()==($("#userPw").val()))
	{
		alert("비밀번호는 아이디와 동일할 수 없습니다.");
		$("#userPw").val("");
		$("#userPw").focus();
		
		return false;
	}	
}


//----------------------------------------------가입하기 클릭시 변수 이벤트--------------------
function joinCheck()
{
	//아이디가 빈 값일 경우
	if($("#joinId").val()=="")
	{
		alert("아이디를 입력하세요.");
		$("#joinId").focus();
		
		return false;
	}
	//비밀번호가 빈 값일 경우
	if($("#joinPw").val()=="")
	{
		alert("비밀번호를 입력하세요.");
		$("#joinPw").focus();
		
		return false;
	}
	//비밀번호 재입력칸이 빈 값일 경우
	if($("#joinPwCheck").val()=="")
	{
		alert("비밀번호를 한 번 더 입력하세요.");
		$("#joinPwCheck").focus();
		
		return false;
	}
	//비밀번호 재입력칸에 같은 비밀번호를 입력했는지 체크
	if($("#joinPw").val() != ($("#joinPwCheck").val()))
	{		
		alert("같은 비밀번호를 입력하세요.");
		$("#joinPw").val("");
		$("#joinPwCheck").val("");
		$("#joinPw").focus();
		
		return false;
	}
	//아이디와 비밀번호를 같은 값으로 입력했는지 체크
	if ($("#joinId").val()==($("#joinPw").val()))
	{
		alert("비밀번호는 아이디와 동일할 수 없습니다.");
		$("#joinPw").val("");
		$("#joinPw").focus();
		
		return false;
	}
	else
	{
		if(confirm("회원가입을 진행하시겠습니까?") != 1)
		{
			alert("회원가입이 취소되었습니다.");
			return false;
		}else
		{
			//Ajax를 이용하여 회원가입 데이터를 전송한다.
			var param = "";
			param  = "userId=" + $("#joinId").val();
			param += "&";
			param += "userPw=" + $("#joinPw").val();
			param += "&";
			param += "photo=" + $("#photo").val();
			
			$.ajax({
				type : "GET",
				data : param,
				url: "./member/joinProcess.jsp",
				dataType: "HTML",
				success : function(data) 
				{
					data = data.trim();
					if(data == "SUCCESS")
					{
						alert("회원가입을 완료하였습니다.\n\n메인화면으로 이동합니다.");
						document.location = "index.jsp";
					}else if(data == "DUPLICATE")
					{
						alert("이미 등록된 회원아이디입니다.");
					}else
					{
						alert("회원가입시 데이터베이스 오류가 발생하였습니다.");
					}
				},
				complete : function(data) 
				{
					
				},
				error : function(xhr, status, error) 
				{
					
				}
			});
			return false;
		}
		/*
		alert("성공적으로 가입되었습니다!\n 이제, 로그인 가능합니다!");

		$('#joinGo').click(function()
		{
			joinForm.submit();
			//$('.join').load('login.jsp');			
			return false;
		});
		*/
	}	
	return false;
}

//-----------------------------------------정보수정 클릭시 변수 이벤트---------------------------
//확인 버튼 클릭시 이벤트
function modiChk()
{
	 var oldPw = document.getElementById('oldPw').value;
	 var newPw = document.getElementById('newPw').value;
	 var newPwChk = document.getElementById('newPwChk').value;

	//현재비밀번호가 빈 값일 경우
	if($("#oldPw").val()=="")
	{
		alert("현재 비밀번호를 입력하세요.");
		$("#oldPw").focus();
		
		return false;
	}
	//새로운 비밀번호 입력칸이 빈 값일 경우
	if($("#newPw").val()=="")
	{
		alert("새로운 비밀번호를 입력하세요.");
		$("#newPw").focus();
		
		return false;
	}
	//새로운 비밀번호 확인칸이 빈 값일 경우
	if($("#newPwChk").val()=="")
	{
		alert("새로운 비밀번호를 한 번 더 입력하세요.");
		$("#newPwChk").focus();
		
		return false;
	}
	//비밀번호 재입력칸에 같은 비밀번호를 입력했는지 체크
	if($("#newPw").val() != ($("#newPwChk").val()))
	{		
		alert("같은 비밀번호를 입력하세요.");
		$("#newPw").val("");
		$("#newPwChk").val("");
		$("#newPwChk").focus();
		
		return false;
	}
	//아이디와 비밀번호를 같은 값으로 입력했는지 체크
	if ($("#oldPw").val()==($("#newPw").val()))
	{
		alert("비밀번호는 이전과 동일할 수 없습니다.");
		$("#newPw").val("");
		$("#newPw").focus();
		
		return false;
	}
	else
	{
		$('#modiGo').click(function()
		{
			modifyForm.submit();
			$('.modify').load('login.jsp');
			
			return;
		});
	}	
	return true;
}


//--------------------------------------------로그인,회원가입,정보수정 보여주기 변환---------------------
function viewJoin()
{
	trLogin.style.display = "none";
	trJoin.style.display  = "block";
}

function viewLogin()
{
	trLogin.style.display = "block";
	trJoin.style.display  = "none";
}

	function viewUser()
{
	trModi.style.display = "none";
	trUser.style.display  = "block";
}

function viewModi()
{
	trModi.style.display = "block";
	trUser.style.display  = "none";
}

function newPopup(url) 
{
	popupWindow = window.open(url,'popUpWindow','height=500,width=700,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/IGOProject/css/main.css" rel="stylesheet" type="text/css">
<link href="/IGOProject/css/common.css" rel="stylesheet" type="text/css">
<link href="/IGOProject/css/core.css" rel="stylesheet" type="text/css">
<link href="/IGOProject/css/search.css" rel="stylesheet" type="text/css">
<link href="/IGOProject/css/subCom.css" rel="stylesheet" type="text/css">
<link href="/IGOProject/css/swiper1.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
<link href="https://unpkg.com/ionicons@4.4.6/dist/css/ionicons.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="/IGOProject/img/favicon2.ico"
	type="image/x-icon">
<link rel="icon" href="/IGOProject/img/favicon2.ico" type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat|Nanum+Gothic"
	rel="stylesheet">
<script src="/IGOProject/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="/IGOProject/js/common.js" type="text/javascript"></script>
<script src="/IGOProject/js/main.js" type="text/javascript"></script>
<script src="/IGOProject/js/swiper.min.js" type="text/javascript"></script>
 <script type="text/javascript">
	$().ready(function(){
		$("#sbtn").click(function(){
			$.post("/IGOProject/memberlogin", 
					$(`#logF`).serialize()
					, function(response) {
				    if (response == "loginFail") {
				    	alert("로그인에 실패하였습니다.");
				    }
				    else if (response == "loginSuccess"){
						alert("로그인에 성공하였습니다.");
						location.href="/IGOProject/index";
				    } 
				    else if (response == "block") {
				    	alert("Password 3회이상 실패하여 1시간 동안 계정이 잠겼습니다. ");
				    }
		    //alert(response.message);
		 		});    
		});
	});
</script>
</head>
<body>
	<header id="header">
		<div id="top">
			<i id="ham" class="ion-ios-menu"></i>
			<div class="search-wrapper">
				<div class="input-holder">
					<input type="text" name="search" class="search-input"
						placeholder="Type to search">
					<button class="search-icon" onclick="searchToggle(this, event);">
						<span></span>
					</button>
				</div>
				<span class="close" onclick="searchToggle(this, event);"></span> <a
					href="search.html"><div class="result-container"></div></a>
			</div>
			<a href="#" id="logo"></a>
		</div>


		<div class="nav_wrapperM">
			<nav id="navM" class="menuM">
				<ul class="active">
					<li class="tmenu" id="loginClick"><a href="#" title="LOGIN"><i
							class="fa fa-sign-in MLIco"></i>LOGIN</a></li>
					<li class="tmenu"><a href="#" title="메뉴1"> <i
							class="icon ion-md-business MLIco"></i>회원가입
					</a></li>
					<li class="tmenu"><a href="#" title="메뉴2"> <i
							class="icon ion-ios-business MLIco"></i>공지사항
					</a></li>

					<li class="tmenu"><a href="#" title="이벤트"><i
							class="far fa-flag MLIco"></i>Q & A</a></li>
				</ul>
			</nav>
		</div>
	</header>


	<!-- 모달창 -->
	<div class="modal">
		<section id="login">
			<div class="meminfo">
				<form id="logF" method="post" action="/IGOProject/memberlogin">
					<div class="memWrap">
						<div class="minput">
							<!--아이디-->
							<label for="mid">아이디</label> <input type="email" id="email"
								name="email" maxlength="40" placeholder="이메일을 입력하세요" value="${memberVO.email}"/>
						</div>
						<div class="minput">
							<!--비번-->
							<label for="mpw">비밀번호</label> <input type="password" id="password"
								name="password" maxlength="20" placeholder="비밀번호를 입력하세요" value="${memberVO.password}"/>
						</div>
						<input type="button" id="sbtn" value="LOGIN"> <span
							class="checkWrap"> <input type="checkbox" id="chkbox"/>
							아이디 저장
						</span>
					</div>
					<!--버튼2개박스-->
					<div class="btnWrap">
						<ul>
							<li class="joinBtn"><a href="/IGOProject/member/regist" class="on">회원가입</a></li>
							<li class="joinBtn joinBtn2"><a href="idpw.jsp">ID/PW 찾기</a></li>
						</ul>
					</div>
				</form>
			</div>
		</section>
		<div class="modal_x">닫기</div>
	</div>
	<!-- 백그라운드 -->
	<div class="modal_back"></div>

</body>
</html>
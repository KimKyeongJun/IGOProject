<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/IGOProject/css/main.css" rel="stylesheet" type="text/css">
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
				<form id="logF" method="post" action="loginSet.jsp">
					<div class="memWrap">
						<div class="minput">
							<!--아이디-->
							<label for="mid">아이디</label> <input type="text" id="memail"
								name="memail" maxlength="40" placeholder="이메일을 입력하세요">
						</div>
						<div class="minput">
							<!--비번-->
							<label for="mpw">비밀번호</label> <input type="password" id="mpw"
								name="mpw" maxlength="20" placeholder="비밀번호를 입력하세요">
						</div>
						<input type="submit" id="sbtn" value="LOGIN"> <span
							class="checkWrap"> <input type="checkbox" id="chkbox">
							아이디 저장
						</span>
					</div>
					<!--버튼2개박스-->
					<div class="btnWrap">
						<ul>
							<li class="joinBtn"><a href="member.jsp" class="on">회원가입</a></li>
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



	<section id="banner">
		<h2 class="bld">.</h2>

		<div class="swiper-container swiper-container-horizontal">
			<ul id="slider" class="swiper-wrapper">
				<li class="opaView swiper-slide slider1 swiper-slide-active"><span
					class="bld">지하철고장</span>
					<p class="mainTxt">
						<a href="#"><span>고장난 지하철</span><b></b>이대로 지각인가..</a>
					</p></li>
				<li class="swiper-slide slider2 swiper-slide-next"><span
					class="bld">아이고</span>
					<p class="mainTxt">
						<a href="#"><span>아이고</span><b></b>집에 언제가</a>
					</p></li>
				<li class="swiper-slide slider3"><span class="bld">길이
						막혀</span>
					<p class="mainTxt">
						<a href="#"><span>길이막혀</span><b></b>어디든 다 막혀</a>
					</p></li>
			</ul>

			<div class="inbox">
				<a href="#" class="abtn ab1"><i class="fas fa-arrow-circle-left"></i></a>
				<a href="#" class="abtn ab2"><i
					class="fas fa-arrow-circle-right"></i></a>

				<aside class="bulletBox">
					<a href="#"><span>#</span>지하철고장</a> <a href="#"><span>#</span>교통지옥</a>
					<a href="#"><span>#</span>어디로가나</a>
				</aside>
			</div>
		</div>
	</section>



	<section id="searchWrap">
		<h2>실시간 검색 하기</h2>
		<h3>많이 검색 해 주세요!</h3>
		<div class="searchBox">
			<input type="text" class="searchBar" /> <a href="#searchList"><i
				class="ion-md-search"></i></a>
		</div>
		<div class="searchList">
			<ul>
				<li><a href="#">2호선 종합운동장역</a></li>
				<li><a href="#">7호선 어린이대공원역</a></li>
				<li><a href="#">우이신설경전철 4.19민주묘지역</a></li>
				<li><a href="#">7호선 신대방삼거리역</a></li>
				<li><a href="#">인천2호선 서부여성회관역</a></li>
				<li><a href="#">공항철도 공항화물청사역</a></li>
				<li><a href="#">인천2호선 가정중앙시장역</a></li>
				<li><a href="#">인천1호선 경인교대입구역</a></li>
				<li><a href="#">의정부경전철 경기도북부청사역</a></li>
				<li><a href="#">우이신설경전철 북한산보국문역</a></li>
			</ul>
		</div>
	</section>

	<footer id="info">
		<button type="button" id="top_btn">
			<i class="fa fa-arrow-up" aria-hidden="true"></i><span
				class="sound_only">상단으로</span>
		</button>
		<div class="fMenu">
			<ul class="imenu">
				<li><a href="terms.html">이용약관</a></li>
				<li><a href="privacy.html">개인정보취급방침</a></li>

				<li><a href="contact.html">고객센터</a></li>
			</ul>
		</div>
		<div class="fTop">
			<a href="#"><div id="fLogo"></div></a>
		</div>
		<div class="fMtxt">
			<address>
				서울특별시 서초구 효령로 176 KTDS 2층, 대표번호 : 02-1234-6875
				<p>COPYRIGHT 2018 © I GO. ALL RIGHT RESERVED.</p>
			</address>
		</div>
	</footer>
</body>
</html>
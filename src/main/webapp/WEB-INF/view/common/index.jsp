<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script src="/IGOProject/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#searchBtn").click(function() {			
			var url = "<c:url value='/search/naver/' /> " + $("#searchKeyword").val();
			location.href = url;
		});
	});
</script>
<body>
	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>

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
			<input type="text" class="searchBar" id="searchKeyword" /> <a id="searchBtn"><i
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
	
	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script>
	$().ready(function() {
		var keyword = "${searchKeyword}";
		setInterval(function() {
			$.post("<c:url value='/search/twitter'/>",
					{searchKeyword: keyword},
					function(response) {
						for(var i in response) {
							console.log(response[i]);
						}
					});
		}, 10000);
	});
</script>
	
	<div class="sub_common">
		<div class="headImg subHeadSerch">
			<h2>검색결과</h2>
		</div>
		<div class="headBox">
			<div class="heading">
				<h2 class="headTxt">검색결과</h2>
			</div>
			<div class="resultTxt">
				<span class="rt1">#</span>
				<p>${searchKeyword}</p>
			</div>
		</div>
	</div>

	<div class="searchBox">
		<input type="text" class="searchBar" /> <a href="#searchList"><i
			class="ion-md-search"></i></a>
	</div>

	<section id="searchSns">
		<div class="snsList">
			<ul class="tabs">
				<li class="active" data-link="tab1"></li>
				<li data-link="tab2"></li>
			</ul>
			<!-- .tab_container -->
			<div class="tab_container">

			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"></jsp:include>


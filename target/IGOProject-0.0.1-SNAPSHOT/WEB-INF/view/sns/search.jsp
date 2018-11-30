<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script>

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
				<p>검색결과(텍스트양에따라 width달라짐)</p>
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
				<!-- #tab1 -->
				<div id="tab1" class="tab_content">
					<a class="twitter-timeline"
						href="https://twitter.com/Starbucks?ref_src=twsrc%5Etfw"
						data-width="100%" data-height="500"></a>
					<script async src="https://platform.twitter.com/widgets.js"
						charset="utf-8"></script>
				</div>

				<!-- #tab2 -->
				<div id="tab2" class="tab_content">
					<div id="fb-root"></div>
					<script>
						(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id))
								return;
							js = d.createElement(s);
							js.id = id;
							js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.2';
							fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					</script>



					<div class="fb-page" data-width="500"
						data-href="https://www.facebook.com/facebook" data-tabs="timeline"
						data-small-header="false" data-adapt-container-width="true"
						data-hide-cover="false" data-show-facepile="true">
						<blockquote cite="https://www.facebook.com/facebook"
							class="fb-xfbml-parse-ignore">
							<a href="https://www.facebook.com/facebook">Facebook</a>
						</blockquote>
					</div>

				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"></jsp:include>


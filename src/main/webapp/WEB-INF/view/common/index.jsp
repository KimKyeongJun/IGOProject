<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/IGOProject/js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="/IGOProject/js/main.js" type="text/javascript"></script>
<script src="/IGOProject/js/swiper.min.js" type="text/javascript"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$("#searchBtn").click(function() {		
			if($("#searchKeyword").val() == '') {
				alert("검색어를 입력해주세요.");
				$("#searchKeyword").focus();
				return;
			}
			var url = "<c:url value='/sns/search?searchKeyword='/>"+$("#searchKeyword").val();
			location.href = url;
		});
		
		var data = [];
		$.get("<c:url value='/transport/read' />"
			  , function(response) {
					$.each(response, function( index, value ) {
					  	$.each(value, function( i ) {
						  	data.push({'category': index, 'label': value[i]});
						});
					});
					console.log(data); 
			  }
		);
		
		$.widget( "custom.catcomplete", $.ui.autocomplete, {
		      _create: function() {
		        this._super();
		        this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
		      },
		      _renderMenu: function( ul, items ) {
		        var that = this,
		          currentCategory = "";
		        $.each( items, function( index, item ) {
		          var li;
		          if ( item.category != currentCategory ) {
		            ul.append( "<li class='ui-autocomplete-category "+item.category+"'>" + item.category + "</li>" );
		            currentCategory = item.category;
		          }
		          li = that._renderItemData( ul, item );
		          if ( item.category ) {
		            li.attr( "aria-label", item.category + " : " + item.label );
		          }
		        });
		      }
		    });
		 
		    $( "#searchKeyword" ).catcomplete({
		      delay: 0,
		      source: data ,
		      open: function() {
			        $("ul.ui-menu").width( $(this).width() );
			    } 
		    });
		
	});
</script>

	<section id="banner">
	<h2 class="bld">.</h2>
		
	<div class="swiper-container">
		<ul id="slider" class="swiper-wrapper">
			<li class="opaView swiper-slide slider1" ><span class="bld">지하철고장</span>
				<p class="mainTxt"><a href="#"><span>고장난 지하철</span><b></b>이대로 지각인가..</a></p>
			</li>
			<li class="swiper-slide slider2" ><span class="bld">길이막혀</span>
				<p class="mainTxt"><a href="#"><span>길이막혀</span><b></b>어디든 다 막혀</a></p>
			</li>
			<li class="swiper-slide slider3" ><span class="bld">아이고</span>
				<p class="mainTxt"><a href="#"><span>아이고</span><b></b>집에 언제가</a></p>			
			</li>							
		</ul>	
		
		<div class="inbox">
			<a href="#" class="abtn ab1"><i class="fas fa-arrow-circle-left"></i></a>
			<a href="#" class="abtn ab2"><i class="fas fa-arrow-circle-right"></i></a>
			
			<aside class="bulletBox"></aside>					
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

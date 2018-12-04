<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/IGOProject/css/search.css" rel="stylesheet" type="text/css"/>
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/jquery-ui.min.js' />" type="text/javascript"></script>
<script>
	$().ready(function() {
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
       
         $( ".searchKeyword" ).catcomplete({
	     	 delay: 0,
	     	 source: data,
			 open: function() {
				 var wid = $(this).width();
				 $("ul.ui-menu").width( wid*0.9 ); 
				 $("#ui-id-2").css("left","50.5%");
	         } 	 
	    });
         
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
		<input type="text" class="searchBar searchKeyword" /> <a href="#searchList"><i
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


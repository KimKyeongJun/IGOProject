<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IGO</title>
<link href="/IGOProject/css/common.css" rel="stylesheet" type="text/css"/>
<link href="/IGOProject/css/main.css" rel="stylesheet" type="text/css"/>
<link href="/IGOProject/css/core.css" rel="stylesheet" type="text/css"/>
<link href="/IGOProject/css/subCom.css" rel="stylesheet" type="text/css">
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
<script src="<c:url value='/js/jquery-ui.min.js' />" type="text/javascript"></script>

 <script type="text/javascript">
	$().ready(function(){
		
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
       
         $( ".search-input" ).catcomplete({
	     	 delay: 0,
	     	 source: data,
			 open: function() {
	                 $("ul.ui-menu").width( $(this).width() );
	         } 	 
	    });
		
		$(".joinBtn1").click(function() {
			location.href = "<c:url value='/member/regist'/>";
		});
		$(".joinBtn2").click(function() {
			location.href = "<c:url value='/member/find'/>";
		});
		// cookie에서 이메일 받아와서 변수에 넣기
		var cookieId= getLogin();
		
		// cookie에 이메일 값이 있으면 email입력 form에 입력하고 checkbox 체크
		if ( cookieId != "" ) {
			$("#email").val(cookieId);
			$("#chkbox").prop("checked", true);
		}
		
		// checkbox 체크 여부 확인
		$("#chkbox").click(function() {
			var idChkbox = this;
			var isRemember;
			
			if ( $(idChkbox).is(":checked") ) {
				isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까?\n PC방 등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
				
				if(!isRemember) {
					$(idChkbox).prop("checked", false);
				}
			}
		});
		
		// email form email주소 저장
		function saveLogin(id) {
			if ( id != "" ) {
				setSave("userid", id, 7);
			}
			else {
				setSave("userid", id, -1);
			}
		}
		
		// cookie에 email값 넣기
		function setSave(name, value, expiredays) {
			var today = new Date();
			today.setDate( today.getDate() + expiredays );
			document.cookie = name + "=" + escape(value) + "; path/; expires=" + today.toGMTString() + ";"
		}
		
		// cookie에서 이메일 값 받아오기
		function getLogin() {
			var cook = document.cookie+";";
			var idx = cook.indexOf("userid", 0);
			var val = "";
			
			if ( idx != -1 ){
				cook = cook.substring(idx, cook.length);
				begin = cook.indexOf("=",0) + 1;
				end = cook.indexOf(";", begin);
				val = unescape(cook.substring(begin,end));
			}
			
			return val;
		}
		
		$("#sbtn").click(function(){
			
			// checkbox 체크되어있으면 로그인 정보 저장
			if ( $("#chkbox").is(":checked") ) {
				saveLogin($("#email").val());
			}
			else {
				saveLogin("");
			}
			
			$.post("<c:url value='/memberlogin'/>", 
					$('#logF').serialize()
					, function(response) {
				    if (response == "loginFail") {
				    	alert("로그인에 실패하였습니다.");
				    }
				    else if (response == "loginSuccess"){
						alert("로그인에 성공하였습니다.");
						location.href="<c:url value ='/'/>";
				    } 
				    else if (response == "block") {
				    	alert("Password 3회이상 실패하여 1시간 동안 계정이 잠겼습니다. ");
				    } 
				    else if (response == "approvalFail") {
				    	alert("이메일 인증을 확인하세요.");
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
					<input type="text" name="search" class="search-input searchKeyword"
						placeholder="Type to search">
					<button class="search-icon" onclick="searchToggle(this, event);">
						<span></span>
					</button>
				</div>
				<span class="close" onclick="searchToggle(this, event);"></span> <a
					href="search.html"><div class="result-container"></div></a>
			</div>
			<a href="<c:url value="/"/>" id="logo"></a>
		</div>


		<div class="nav_wrapperM">
			<nav id="navM" class="menuM">
				<ul class="active">
					<c:choose>
						<c:when test="${empty sessionScope._USER_}">
							<li class="tmenu" id="loginClick"><a href="#" title="LOGIN"><i
									class="fa fa-sign-in MLIco"></i>LOGIN</a></li>
							<li class="tmenu"><a href="<c:url value='/member/regist'/>" title="회원가입"> <i
									class="icon ion-md-person MLIco"></i>회원가입
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="tmenu"><a href="<c:url value='/member/logout2'/>" title="LOGOUT"><i
									class="fa fa-sign-out MLIco"></i>LOGOUT</a></li>
							<li class="tmenu"><a href="<c:url value='/member/passwordconfirm'/>" title="INFO">
							<i class="icon ion-md-person MLIco"></i>${sessionScope._USER_.name}님</a></li>
						</c:otherwise>
					</c:choose>
					<li class="tmenu"><a href="<c:url value='/notice'/>" title="공지사항"> <i
							class="icon ion-md-mail MLIco"></i>공지사항
					</a></li>

					<li class="tmenu"><a href="<c:url value='/qna'/>" title="Q & A"><i
							class="icon ion-md-help MLIco"></i>Q &amp; A</a></li>
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
								name="securityEmail" maxlength="40" placeholder="이메일을 입력하세요" value="${memberVO.email}"/>
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
							<li class="joinBtn joinBtn1">회원가입</li>
							<li class="joinBtn joinBtn2">ID/PW 찾기</li>
						</ul>
					</div>
				</form>
			</div>
		</section>
		<div class="modal_x">닫기</div>
	</div>
	<!-- 백그라운드 -->
	<div class="modal_back"></div>



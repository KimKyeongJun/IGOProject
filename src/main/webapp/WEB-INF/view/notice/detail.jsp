<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='/css/board.css'/>" rel="stylesheet" type="text/css">
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/common/header_layout.jsp"/>
	
	<div class="sub_common">
		<div class="headImg subHeadNotice"><h2>공지사항</h2></div>
			<div class="headBox">
				<div class="heading"><h2 class="headTxt">공지사항</h2>
			</div>	
		</div>
	</div>
	
	<article id="bo_v" >
  		<header>
    		<h2 id="bo_v_title"> <span class="bo_v_tit"> ${noticeVO.title}</span> </h2>
  		</header>
  		<section id="bo_v_info">
    		<h2>페이지 정보</h2>
    		<span class="sound_only">작성자</span>
    		<span class="sv_member">${noticeVO.memberVO.name}</span>
    		<span> 조회수 ${noticeVO.viewCount}</span>
    		<strong class="if_date">
    			<span class="sound_only">작성일</span>
    			<i class="fa fa-clock-o" aria-hidden="true"></i> 
    			${noticeVO.regDate}
    		</strong>
    	</section>
  
  	<section id="bo_v_atc">
    	<h2 id="bo_v_atc_title">본문</h2>
    	<div id="bo_v_img"> </div>
    
   	 	<!-- 본문 내용 시작 { -->
    	<div id="bo_v_con">${noticeVO.content}</div>
    <!-- } 본문 내용 끝 --> 
    
  	</section>
  
  	<!-- 게시물 상단 버튼 시작 { -->
  	<div id="bo_v_top">	
	    <ul class="bo_v_com">
	    	<c:if test="${sessionScope._USER_.email eq noticeVO.memberVO.email}">
				<li><a href="<c:url value='/notice/modify/${noticeVO.noticeId}'/>" onclick="comment_box('4', 'cu'); return false;" class="btn_b03 replyModi"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 수정</a></li>
	    	</c:if>
		      	<li><a href="<c:url value='/notice'/>" class="btn_b01 btn"><i class="fa fa-list" aria-hidden="true"></i> 목록</a></li>
	    </ul>
  	</div>
  <!-- } 게시물 상단 버튼 끝 --> 
</article>

	<jsp:include page="/WEB-INF/view/common/footer_layout.jsp"/>

</body>
</html>
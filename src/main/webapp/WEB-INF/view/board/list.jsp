<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	
	<link rel="stylesheet" type="text/css" href="/IGOProject/css/layout.css" />
    <link rel="stylesheet" href="/IGOProject/css/style.css">

<!--<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">  -->

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="/IGOProject/js/script.js"></script>


   <script type="text/javascript">
    $('.dropdown-toggle').dropdown();
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
      });
	</script>    
	<script type="text/javascript">
		var message = "${param.message}";
		if ( message != "" ) {
			alert(message);
		}
	</script>
	
</head>

<body>

<center>

<form:form  modelAttribute="noticeVO" method="post" action="/IGOProject/notice/write" enctype="multipart/form-data">
		<!-- <div class="errors">
			<ul>
				<li><form:errors path="subject" /></li>
				<li><form:errors path="content" /></li>			
			</ul>
		</div> -->

	<div id="wrapper">
		<div id="headerWrapper">
		<div style="text-align:center;">
			<div class="number header box">글 번호</div><!--
			--><div class="subject header box">제목</div><!--
			--><div class="writer header box">작성자</div><!--
			--><div class="create-date header box">작성일</div>
		</div>
		</div>
		</div>
		<c:choose>
			<c:when test="${not empty noticeVOList }">
				<c:forEach items="${noticeVOList }" var="notice">
					 <div class="contentWrapper">
						<div class="number box">${notice.id }</div><!--
						--><div class="subject box">
								<a href="/IGOProject/notice/detail/${notice.id }">${notice.title }</a>
						   </div><!--
						--><div class="writer box">${notice.memberVO.name }</div><!--
						--><div class="create-date box">${notice.regDate }</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div id="no-articles">
				<div style="text-align:center;">
					등록된 게시글이 없습니다.
				</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="padded">
			<form id="searchForm">
				${pagenation}
			</form>
		</div>
</center>		
		<div class="padded">
		<div style="text-align:right;">
			<a href="/IGOProject/notice/write">글 작성</a>
		</div>
		</div>
	</div>
<center>
    <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
</center>
</form:form>
</center>	
</body>
</html>
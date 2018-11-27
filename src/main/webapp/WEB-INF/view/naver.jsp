<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<c:url value="/js/jquery-3.3.1.min.js" />" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#favoriteBtn").click(function() {
			alert("aa");
		});
	});
</script>
<body>
<h1>${keyword}</h1>
	<div>
		<a id="favoriteBtn">즐겨찾기O</a>
		<a id="favoriteXBtn">즐겨찾기X</a>
	</div>
	<c:forEach items="${list}" var="list">
	<div>
		<div>
			☆ title : ${list.id} (${list.date}) <a href="${list.url}">링크</a>
		</div>
		<%-- <div>
			☆ originLink : <a href="${article.originallink}">${article.originallink}</a>
		</div>
		<div>
			☆ link : <a href="${article.link}">${article.link}</a>
		</div>	 --%>
		<div>
			☆ description : ${list.text}
		</div>
		<%-- <div>
			☆ pubDate : ${article.pubDate}
		</div> --%>			
	</div>
	<hr>
	</c:forEach>

</body>
</html>
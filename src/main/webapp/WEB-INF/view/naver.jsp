<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>lastBuildDate : ${naverVO.lastBuildDate}</div>
	<div>total : ${naverVO.total}</div>
	<div>start : ${naverVO.start}</div>
	<div>display : ${naverVO.display}</div>
	<hr><hr>
	<c:forEach items="${naverVO.items}" var="article">
	<div>
		<div>
			☆ title : ${article.title}
		</div>
		<div>
			☆ originLink : <a href="${article.originallink}">${article.originallink}</a>
		</div>
		<div>
			☆ link : <a href="${article.link}">${article.link}</a>
		</div>	
		<div>
			☆ description : ${article.description}
		</div>
		<div>
			☆ pubDate : ${article.pubDate}
		</div>			
	</div>
	<hr>
	</c:forEach>

</body>
</html>
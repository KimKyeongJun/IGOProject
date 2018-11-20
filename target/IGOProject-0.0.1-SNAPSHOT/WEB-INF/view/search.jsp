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

	<c:forEach items="${twitterList}" var="twitter">
		<div>
			<div>
				<span>${twitter.userId}</span>
				<span>${twitter.date}</span>
			</div>
			<div>
				<span>${twitter.text}</span>
			</div>
			<br/>
		</div>
	</c:forEach>

</body>
</html>
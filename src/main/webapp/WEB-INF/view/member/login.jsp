<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/js/jquery-3.3.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#loginBtn").click(function(){
			$.post("/IGOProject/memberlogin", 
				$(`#memberLoginForm`).serialize()
				, function(response) {
			    if (response == "loginFail") {
			    	alert("로그인에 실패하였습니다.");
			    	location.href="/IGOProject/member/login";
			    }
			    else if (response == "loginSuccess"){
					alert("로그인에 성공하였습니다.");
					location.href="/IGOProject/index";
			    } 
			    else if (response == "block") {
			    	alert("Password 3회이상 실패하여 1시간 동안 계정이 잠겼습니다. ");
			    	location.href="/IGOProject/member/login";
			    }
	    //alert(response.message);
	 		});     
		});
	});
</script>

</head>
<body>

	<form:form id = "memberLoginForm" modelAttribute="memberVO" method="post" action="/IGOProject/memberlogin">
			<div>
				<input type="email" id="email" name="email" placeholder="Email" value="${memberVO.email}"/>
			</div>
			<div>
				<form:errors path="email"/>
			</div>
			<div>
				<input type="password" id="password" name="password" placeholder="Password" value="${memberVO.password}" />
			</div>
			<div >
				<form:errors path="password"/>
			</div>
			<div>
				<input style="background-color:" type="submit" id="loginBtn" value="로그인" />
			</div>
	</form:form>

</body>
</html>